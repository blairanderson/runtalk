class Chat < ActiveRecord::Base
  attr_accessible :name, :slug

  validates_uniqueness_of :slug, :case_sensitive => false
  validates :slug, format: { with: /\A[a-z0-9]+\z/ }

  def to_param
    slug
  end

  def request_url(path)
    "http://localhost:3001/#{path}"
  end

  def title
    name.to_s.capitalize
  end

  def message_request
    begin
      response = HTTParty.get request_url("messages?chat_id=#{self.id}")
      JSON.parse(response.body)
    rescue
      []
    end
  end

  def messages
    messages = message_request

    # raise messages.inspect

    messages.map do |message|
      Message.build_message_with_location_or_photo(message.with_indifferent_access)
    end
  end

end
