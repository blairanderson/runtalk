class Text

  attr_reader :phone_number

  def send_registered_user_invitation(invitation)
    message_body = "You have been invited to RunTalk. Visit localhost:3000/users/new?activation_key=#{invitation.unique_url}"
    send_message(@invitation.user_email, message_body)
  end


  def unregistered_invitation(invitation)
    @invitation = invitation
    message_body = "You have been invited to RunTalk. Visit localhost:3000/#{invitation.chat_id} to join."
    send_message(@invitation.user_email, message_body)
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