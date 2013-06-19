class UserMailer < ActionMailer::Base

  default :from => "our_app@app.com"

  def send_invitation(email)
    mail to: email
  end

  def send_registered_user_invitation(user_email)
    mail to: user_email
  end
end