require 'spec_helper'

describe User do 

  describe "a registered user invites another individual" do 

    let!(:chat){Chat.create(name: "whatever", slug: "whatever")}

    context "the individual is a registered user" do 

      it "sends an email notifying the user" do 

        User.create(username: "yo", email: "yolo@example.com", password: "a_password")

        (UserMailer).should_receive(:send_registered_user_invitation)

        visit '/chats/whatever'
        click_on "Invite Another User"
        fill_in "Email", :with => "yolo@example.com"
        click_on "Send Invitation"
      end
    end

    context "the individual is not a registered user" do 

      it "sends an email notifying the user" do 

        (UserMailer).should_receive(:send_invitation)

        visit '/chats/whatever'
        click_on "Invite Another User"
        fill_in "Email", :with => "yolo@example.com"
        click_on "Send Invitation"

      end
    end
  end
end