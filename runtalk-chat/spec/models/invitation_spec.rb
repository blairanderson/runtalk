require 'spec_helper'

describe Invitation do

  let(:chat) { Chat.create(name: "Example123", slug: "example123") }
  let(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }
  let(:user_2) { User.create(username: "jo", email: "jolo@example.com", password: "a_password") }

  describe '#send_email' do 

    context 'the invited individual is a registered user' do 

      it 'should send an email to the user' do
        invitation = Invitation.create(phone_number: "15005550000", chat_id: chat.id, user_id: user.id)

        Text.any_instance.should_receive(:send_message)

        VCR.use_cassette("twilio_new") do 
          invitation.send_text
        end
      end
    end

    context 'the invited individual is an unregistered user' do 
      it 'should send an email to the user' do 
        invitation = Invitation.create(phone_number: "15005550000", chat_id: chat.id, user_id: user.id)

        Text.any_instance.should_receive(:send_message)

        VCR.use_cassette("twilio_new") do 
          invitation.send_text
        end
      end
    end 
  end



end