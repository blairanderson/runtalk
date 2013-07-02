require 'spec_helper'

describe InvitationRecorder do 

  context "all attributes are valid" do 
  
    before do 
      Text.any_instance.stub(:send_message)
    end

    it "creates a new invitation" do 

      invitation = {
        user_id: 1,
        phone_number: "15000000000",
        chat_id: 1
      }.to_json

      Invitation.any_instance.should_receive(:send_text)

      InvitationRecorder.record(invitation)

    end
  end
end