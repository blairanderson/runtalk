require 'spec_helper'

describe User do 

  describe "a registered user invites another individual" do 

    let!(:chat){Chat.create(name: "whatever", slug: "whatever")}

    it "sends an email notifying the user" do 

      VCR.use_cassette("twilio_response") do 
        visit '/chats/whatever'
        click_on "invite_user"
        fill_in "invitation_phone_number", :with => "15005550000"
        click_on "submit"
  
        expect(Invitation.count).to eq 1
        expect(current_path).to eq '/chats/whatever'
      end

    end
  end
end
