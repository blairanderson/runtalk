require 'spec_helper'

describe Invitation do

  let(:chat) { Chat.create(name: "Example123", slug: "example123") }
  let(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }
  let(:user_2) { User.create(username: "jo", email: "jolo@example.com", password: "a_password") }

  describe '#send_email' do 

    context 'the invited individual is a registered user' do 

      it 'should send an email to the user' do
        invitation = Invitation.create(user_email: user_2.email, chat_id: chat.id, user_id: user.id)

        UserMailer.should_receive(:send_registered_user_invitation).with(invitation)

        invitation.send_email
      end
    end

    context 'the invited individual is an unregistered user' do 
      it 'should send an email to the user' do 
        invitation = Invitation.create(user_email: "new_user_email@example.com", chat_id: chat.id, user_id: user.id)

        UserMailer.should_receive(:unregistered_invitation).with(invitation)

        invitation.send_email
      end
    end 
  end



end