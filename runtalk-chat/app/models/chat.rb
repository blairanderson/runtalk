class Chat < ActiveRecord::Base
  attr_accessible :name, :slug

  validates_uniqueness_of :name, :slug
  
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
      MessageProxy.new(message.with_indifferent_access)
    end
  end
end
