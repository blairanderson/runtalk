class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id
  
  has_one :location

  def self.store_message(data)
    message = create(content: data[:content], chat_id: data[:chat_id])
    if data[:location]
      message.create_location!(data[:location])
    end
    message
  end

end
