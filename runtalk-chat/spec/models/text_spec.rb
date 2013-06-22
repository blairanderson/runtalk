require "spec_helper"

describe Text do 

  let(:invitation) { Invitation.create(user_email: '15000000000', chat_id: 1, user_id: 1) }


  describe "#send_registered_user_invitation" do 

    let(:Text) { Text.new }

    it "sends a registered user an invitation email" do 
      Text.any_instance.should_receive(:message)
      Text.send_registered_user_invitation(invitation)
    end
  end

  describe "#unregistered_user" do 

    it "sends an individual an invitation email" 
  end
end