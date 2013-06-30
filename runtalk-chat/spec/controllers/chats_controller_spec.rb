require 'spec_helper'

describe ChatsController do

  describe 'POST #create' do 
    it 'creates a new chatroom' do 
      params = {chat: {name: "example123", slug: "example123" }}
      post :create, params
      expect(Chat.count).to eq 1 
    end
  end

  describe 'GET #new' do 
    it 'renders the template to create a new chatroom' do 
      chat = create_chat
      Chat.stub(:new).and_return(chat)
      get :new
      expect(assigns(:chat)).to eq chat
    end
  end

end
