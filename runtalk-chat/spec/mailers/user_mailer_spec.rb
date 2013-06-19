require 'spec_helper'

describe UserMailer do

  describe ".user_invitation" do 

    it "sends an individual a confirmation email" do 
      mail = UserMailer.send_invitation("yolo@example.com")
      expect(mail.to).to eq ["yolo@example.com"]
    end
  end




end