require 'spec_helper'

describe User do 

  describe "a registered user invites another individual" do 

    let!(:chat){Chat.create(name: "whatever", slug: "whatever")}
    let!(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }
    it "sends an email notifying the user" do 

      VCR.use_cassette("twilio_response") do 

        visit login_path
        fill_in "Username", :with => "yo"
        fill_in "Password", :with => "a_password"
        click_on "Log in"
        visit new_chat_invitations_path(chat)
        fill_in "invitation_phone_number", :with => "15005550000"
        click_on "submit"
        
        expect(current_path).to eq '/chats/whatever'

      end
    end
  end
end
