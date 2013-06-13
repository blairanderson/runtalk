require 'spec_helper'

describe MessagesController do
  
  describe "GET #index" do
    it "has all the messages" do 
      message = Message.create!(content: "message content")
      get :index
      expect( assigns(:messages) ).to eq [message]
    end
  end

  describe 'POST #create' do 
    it 'creates a new message' do 
      valid_message = {content: "Message Content"}
      post :create, message: valid_message
      expect(Message.first.content).to eq valid_message[:content]
    end
  end
end
