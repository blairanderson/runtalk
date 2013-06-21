require 'spec_helper'

describe UserMailer do

  let(:invitation) { Invitation.create(user_email: "yolo@example.com", chat_id: 1, user_id: 1) }

  describe ".user_invitation" do 

    it "sends an individual an invitation email" do 
      mail = UserMailer.unregistered_invitation(invitation)
      expect(mail.to).to eq [invitation.user_email]
    end
  end

  describe ".send_registered_user_invitation" do 

    it "sends a registered user an invitation email" do 
      mail = UserMailer.send_registered_user_invitation(invitation)
      expect(mail.to).to eq [invitation.user_email]
    end
  end
end