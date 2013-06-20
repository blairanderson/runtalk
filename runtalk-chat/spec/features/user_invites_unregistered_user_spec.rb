require 'spec_helper'

describe User do 

  describe "a registered user invites another individual" do 

    let!(:chat){Chat.create(name: "whatever", slug: "whatever")}

    context "the individual is a registered user" do 

      it "sends an email notifying the user" do 

        User.create(username: "yo", email: "yolo@example.com", password: "a_password")

        visit '/chats/whatever'
        click_on "invite_user"
        fill_in "Email", :with => "yolo@example.com"
        click_on "Send Invitation"

        expect(Invitation.count).to eq 1
        expect(current_path).to eq '/chats/whatever'
      end
    end

    context "the individual is not a registered user" do 

      it "sends an email notifying the user" do 

        visit '/chats/whatever'
        click_on "invite_user"
        fill_in "Email", :with => "yolo@example.com"
        click_on "Send Invitation"

        expect(Invitation.count).to eq 1
        expect(current_path).to eq '/chats/whatever'
      end
    end
  end
end