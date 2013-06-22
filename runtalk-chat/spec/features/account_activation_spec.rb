require "spec_helper"

describe User do 

  let(:chat) { Chat.create(name: "Example123", slug: "example123") }
  let(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }
  let(:invitation) { Invitation.create(phone_number: "15005550000", chat_id: chat.id, user_id: user.id) }

  describe "an unregistered user clicks an invitation link" do 

    it "brings user to the account sign up page" do 

      visit new_users_path(activation_key: invitation.unique_url)

      expect(page).to have_content "Invitation to Chatroom"
    end

    it "redirects to chat"

  end
end