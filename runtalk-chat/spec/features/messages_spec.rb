require 'spec_helper'

describe "Message" do

  describe 'chatroom show' do
    it 'should show a message after it has been submitted' do
      chat = create_chat
      VCR.use_cassette("chatroom_show") do 
        visit chat_path(chat)
        expect( page ).to have_field('message_content')
        expect( page ).to have_button('Send')

        message_content = "Valid Message"
        fill_in "message_content", :with => message_content
        click_on "Send"

        expect(current_path).to eq chat_path(chat)

        visit chat_path(chat)
        expect(page).to have_content message_content
      end
    end
  end
end
