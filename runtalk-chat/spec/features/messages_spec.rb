require 'spec_helper'

describe "Message" do

  describe 'chatroom show' do

    it 'should show a message after it has been submitted' do
      pending "this isn't testing what we think it should"
      chat = create_chat
      VCR.use_cassette("chatroom_show") do 
        visit chat_path(chat)
        expect( page ).to have_field('message_content')
        expect( page ).to have_button('Send')

        content = "Valid Message"
        fill_in "message_content", :with => content
        save_and_open_page
        click_on "Send"

        expect(current_path).to eq chat_path(chat)

        visit current_path
        expect(page).to have_content content
      end
    end
  end
end
