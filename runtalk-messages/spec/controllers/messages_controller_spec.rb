require 'spec_helper'

describe MessagesController do 

  describe 'GET #index' do 

    let!(:message1) { Message.create!(chat_id: 1, content: "some_content") }
    let!(:message2) { Message.create!(chat_id: 1, content: "more_content") }

    it "renders a list of messages in json, at most 20" do 
      get :index, chat_id: 1
      expect( assigns(:messages) ).to eq [message1, message2]
    end
  end
end
