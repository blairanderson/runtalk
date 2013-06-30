class Chat < ActiveRecord::Base
  attr_accessible :name, :slug

  validates_uniqueness_of :slug, :case_sensitive => false
  validates :slug, format: { with: /\A[a-z0-9]+\z/ }

  def to_param
    slug
  end

  def message_request
    response = HTTParty.get("http://localhost:3001/messages?chat_id=#{self.id}")
    JSON.parse(response.body)
  end

  def messages
    messages = message_request
    messages.map do |message|
      MessageProxy.build_message_with_location_or_photo(message.with_indifferent_access)
    end
  end

end
