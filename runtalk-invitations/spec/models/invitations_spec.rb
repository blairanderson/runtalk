require 'spec_helper'

describe Invitation do

  describe '#send_text' do 

    before do 
      Text.any_instance.stub(:send_message)
    end

    context 'the invited individual is a registered user' do 

      it 'should send an email to the user' do
        invitation = Invitation.create(phone_number: "15005550000", chat_id: 1, user_id: 1)

        Text.any_instance.should_receive(:send_message)

        VCR.use_cassette("twilio_new") do 
          invitation.send_text
        end
      end
    end

    context 'the invited individual is an unregistered user' do 
      it 'should send an email to the user' do 
        invitation = Invitation.create(phone_number: "15005550000", chat_id: 1, user_id: 1)

        Text.any_instance.should_receive(:send_message)

        VCR.use_cassette("twilio_new") do 
          invitation.send_text
        end
      end
    end 
  end



end