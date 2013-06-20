class Invitation < ActiveRecord::Base
  attr_accessible :user_email, :chat_id, :user_id

  after_create :generate_unique_url

  def send_email
    user = User.find_by_email(user_email)

    if user 
      UserMailer.send_registered_user_invitation(self)
    else
      UserMailer.unregistered_invitation(self)
    end
  end

private

  def generate_unique_url
    begin
      self.unique_url = SecureRandom.urlsafe_base64(16)
    end while self.class.exists?(unique_url: unique_url)
  end

end