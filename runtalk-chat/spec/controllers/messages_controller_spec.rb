require 'spec_helper'

describe MessagesController do
  
  describe 'POST #create' do 
    it 'creates a new message' do 
      chat = create_chat
      valid_message = {content: "Message Content"}
      post :create, chat_id: chat.slug, message: valid_message
      expect(assigns(:message).content).to eq valid_message[:content]
    end
  end
end
