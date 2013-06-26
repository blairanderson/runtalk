class MessageProxy
  attr_reader :content, :chat_id, :created_at

  def initialize(message)
    @content = message['content']  
    @chat_id = message['chat_id']
    @created_at = message['created_at']
  end

  def self.create(message_params)
    valid_message = { 
      content: message_params[:message][:content], 
      chat_id: message_params[:chat_id], 
      created_at: Time.now}
    new(valid_message)
  end

  def location
    false
  end

  def photo
    false
  end

  def save
    Channel.publish(:chat_message, self)
  end

  def to_partial_path
    "messages/message"
  end
end
