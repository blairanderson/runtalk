require 'spec_helper'

describe 'a user joins a chatroom' do 

  context 'a guest user joins a chatroom' do 

    it 'brings a guest to a page, asking them to create a guest username' 

  end

  context 'a user that is logged in joins a chatroom' do 

    let!(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }

    before do 

      visit "/"
      click_on "Log In"

      fill_in "Username", :with => "yo"
      fill_in "Password", :with => "a_password"
      click_on "Log in"

      Chat.any_instance.stub(:message_request).and_return([])

    end
    
    it 'brings the user directly to the chatroom' do 

      pending "new feature, not yet implemented"
    
      Chat.any_instance.stub(:message_request).and_return([])

      visit root_path

      fill_in 'name', :with => "Example123"
      click_button 'Create'
      click_button 'Create Chatroom'

      fill_in "message_content", :with => "content"
      click_on "Send"
      visit(current_path)

      expect(page).to have_content(user.username)

    end
  end
end 