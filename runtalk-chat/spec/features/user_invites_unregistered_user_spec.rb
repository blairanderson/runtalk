require 'spec_helper'

describe User do 

  describe "a registered user invites another individual" do 

    context "the individual is a registered user" do 

      it "allows access for that individual" 

      it "sends an email notifying the user" 
    end

    context "the individual is not a registered user" do 

      let!(:chat){Chat.create(name: "whatever", slug: "whatever")}

      it "sends an email notifying the user" do 

        (Mailer).should_receive(:send_invitation)

        visit '/chats/whatever'
        click_on "Invite Another User"
        fill_in "Email", :with => "yolo@example.com"
        click_on "Send Invitation"

      end

      it "allows access for that individual"
    end
  end
end