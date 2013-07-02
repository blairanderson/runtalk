require "spec_helper"

describe Text do 

  let(:invitation) { Invitation.create(phone_number: "15005550000", chat_id: 1, user_id: 1) }


  describe "#send_invitation" do 

    before do 
      Text.any_instance.stub(:send_message)
    end

    it "sends a registered user an invitation email" do 

      text = Text.new(invitation.phone_number)

      VCR.use_cassette("twilio_new") do 
        text.should_receive(:send_message)
        text.send_invitation(invitation)
      end
    end
  end
end