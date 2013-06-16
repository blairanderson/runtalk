require 'spec_helper'

describe ChatsController do

  describe 'GET #new' do 

    it 'renders the template to create a new chatroom' do 
      chat = create_chat
      Chat.stub(:new).and_return(chat)
      get :new
      expect(assigns(:chat)).to eq chat
    end
  end

  describe 'POST #create' do 

    it 'creates a new chatroom' do 

      expect { post :create, { name: "example123", slug: "example123" } }.
      to change(Chat, :count).by(1)
    end
  end
end
