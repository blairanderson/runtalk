require 'spec_helper'

describe "Message" do

  describe 'root page' do 
    it 'should have a list of chat messages' do
      visit "/"
      expect(page).to have_content "Messages"
      expect(page).to have_css('ul#messages')
    end

    it 'should have form-input to submit a message' do 
      visit root_path
      expect( page ).to have_field('message_content')
      expect( page ).to have_button('Submit')
    end

    it 'should show a message after it has been submitted' do
      message_content = "Valid Message"
      visit root_path
      fill_in "message_content", :with => message_content
      click_on "Submit"

      expect(current_path).to eq '/'
      expect(Message.first.class).to eq Message
      expect(Message.first).to be_valid
      expect(Message.first.content).to eq message_content
      within("#messages") do 
        expect(page).to have_content message_content
      end
    end
  end
end
