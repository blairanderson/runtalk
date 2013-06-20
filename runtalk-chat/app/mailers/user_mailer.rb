class UserMailer < ActionMailer::Base

  default :from => "our_app@app.com"

  def unregistered_invitation(invitation)
    @invitation = invitation
    mail to: @invitation.user_email
  end

  def send_registered_user_invitation(invitation)
    @invitation = invitation
    mail to: @invitation.user_email
  end
end