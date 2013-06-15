require 'spec_helper'

describe "Message" do

  describe 'root page' do 

    it 'should have a list of chat messages' do
      chat = create_chat
      expect(chat.name).to eq "Valid Name"
      expect(chat.slug).to eq "validslug"

      visit chat_path(chat)
      expect(page).to have_content "Valid name"
      expect(page).to have_css('ul#messages')
    end

    it 'should have form-input to submit a message' do 
      visit root_path
      expect( page ).to have_field('message_content')
      expect( page ).to have_button('Submit')
    end

    it 'should show a message after it has been submitted' do
      chat = create_chat
      message_content = "Valid Message"
      visit chat_path(chat)
      fill_in "message_content", :with => message_content
      click_on "Submit"

      expect(current_path).to eq chat_path(chat)
      expect(Message.first).to be_valid
      expect(Message.first.chat.id).to eq chat.id
      expect(Message.first.content).to eq message_content
      within("#messages") do 
        expect(page).to have_content message_content
      end
    end
  end
end
