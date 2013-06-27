require 'spec_helper'

describe MessagesController do 

  describe 'GET #index' do 

    before do 
      Message.create(chat_id: 1, content: "some_content")
      Message.create(chat_id: 1, content: "more_content")
    end

    it "renders a list of messages in json, at most 20" do 
      get :index, chat_id: 1
      expect(assigns(:messages).count).to eq 2
    end
  end
end
