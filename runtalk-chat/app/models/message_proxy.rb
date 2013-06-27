class MessageProxy
  attr_reader :content, :chat_id, :created_at

  def initialize(message)
    @content = message['content']  
    @chat_id = message['chat_id']
    @created_at = message['created_at']
  end

  def self.create(message_params, chat_id)
    valid_message = { 
      content: message_params[:message][:content], 
      chat_id: chat_id, 
      created_at: Time.now}.with_indifferent_access
    new(valid_message)
  end

  def location
    false
  end

  def photo
    false
  end

  def save
    puts self.inspect
    Channel.publish(:chat_message, self)
    true
  end

  def to_partial_path
    "messages/message"
  end
end
