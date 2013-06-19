require 'spec_helper'

describe UserMailer do

  describe ".user_invitation" do 

    it "sends an individual an invitation email" do 
      mail = UserMailer.send_invitation("yolo@example.com")
      expect(mail.to).to eq ["yolo@example.com"]
    end
  end

  describe ".send_registered_user_invitation" do 

    it "sends a registered user an invitation email" do 
      user = User.create(username: "yo", email: "yolo@example.com", password: "a_password")
      mail = UserMailer.send_registered_user_invitation(user.email)
      expect(mail.to).to eq [user.email]
    end
  end
end