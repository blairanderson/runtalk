require "spec_helper"

describe Text do 

  let(:invitation) { Invitation.create(phone_number: "15005550000", chat_id: 1, user_id: 1) }

  before do 
    Text.any_instance.stub(:send_message)
  end

  describe "#send_invitation" do 

    let(:Text) { Text.new }

    it "sends a registered user an invitation email" do 

      VCR.use_cassette("twilio_new") do 
        text = Text.new(invitation.phone_number)
        text.should_receive(:send_message)
        text.send_invitation(invitation)
      end
    end
  end
end