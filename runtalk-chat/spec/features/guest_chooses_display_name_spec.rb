require 'spec_helper'

describe 'Profiles' do 

  context 'guest user' do 
    it 'brings a guest to a page, asking them to create a guest username' 
  end

  context 'logged-in user' do 
    let!(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }
    let(:chat){create_chat}

    
    before do 
      visit login_path
      fill_in "Username", :with => "yo"
      fill_in "Password", :with => "a_password"
      click_on "Log in"
      expect(page).to have_content "Signed In" 
    end
    
    it 'has messages referencing their profile' do 
      pending "new feature, not yet implemented"
    
      Chat.any_instance.stub(:message_request).and_return([])

      visit chat_path(chat)

      fill_in "message_content", :with => "content"
      click_on "Send"
      visit chat_path(chat)

      expect(page).to have_content(user.username)

    end
  end
end 
