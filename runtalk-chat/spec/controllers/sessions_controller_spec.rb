require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'"  do

    it "creates a new session for the user" do 
      user = User.create(username: "yo", email: "yolo@example.com", password: "a_password", password_confirmation: "a_password")
      post :create, { username: "yo", password: "a_password" }

      expect(controller.current_user).to eq user
    end 
  end

end
