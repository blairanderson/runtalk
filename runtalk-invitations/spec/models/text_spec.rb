require "spec_helper"

describe Text do 

  let(:invitation) { Invitation.create(phone_number: "15005550000", chat_id: 1, user_id: 1) }


  describe "#send_invitation" do 

    let(:Text) { Text.new }

    it "sends a registered user an invitation email" do 

      VCR.use_cassette("twilio_new") do 
        Text.any_instance.should_receive(:send_message)
        Text.new(invitation.phone_number).send_invitation(invitation)
      end
    end
  end
end