require 'spec_helper'

describe MessagesController do
  
  describe 'POST #create' do 
    it 'creates a new message' do 
      Channel.stub(:publish).and_return(true)
      chat = create_chat

      post :create, chat_id: chat.slug, content: "Message Content"
      expect(assigns(:message).content).to eq "Message Content"
    end
  end
end
