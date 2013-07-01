class Text

  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def send_invitation(chatroom)
    message_body = "You have been invited to RunTalk. Visit www.runtalk.us/chats/#{chatroom.chat_id} to join."
    send_message(phone_number, message_body)
  end

  private
  
  def send_message(phone_number, message)

    client.account.sms.messages.create(
      :from => "+#{twilio_phone_number}", 
      :to => phone_number,
      :body => message )
  end

  def client
    Twilio::REST::Client.new(twilio_sid, twilio_token)
  end

  def twilio_sid
    ENV["TWILIO_SID"]
  end

  def twilio_token
    ENV["TWILIO_TOKEN"]
  end

  def twilio_phone_number
    ENV["TWILIO_PHONE_NUMBER"]
  end
end