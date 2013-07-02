require 'spec_helper'

describe InvitationRecorder do 

  context "all attributes are valid" do 
  
    it "creates a new invitation" do 

      invitation = {
        user_id: 1,
        phone_number: "15000000000",
        chat_id: 1
      }.to_json

      Invitation.should_receive(:create)

      InvitationRecorder.record(invitation)

    end
  end
end