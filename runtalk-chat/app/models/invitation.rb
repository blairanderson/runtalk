class Invitation < ActiveRecord::Base
  attr_accessible :phone_number, :chat_id, :user_id

  after_create :generate_unique_url

  def send_text
    Text.new(phone_number).send_invitation(self)
  end

private

  def generate_unique_url
    self.unique_url = SecureRandom.urlsafe_base64(16)
    self.save
  end
end