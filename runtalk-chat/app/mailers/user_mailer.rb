class UserMailer < ActionMailer::Base

  default :from => "our_app@app.com"

  def send_invitation(email)
    mail to: email
  end
end