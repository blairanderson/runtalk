require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'"  do

    context "user enters valid credentials" do 

      it "creates a new session for the user" do 
        user = User.create(username: "yo", email: "yolo@example.com", password: "a_password", password_confirmation: "a_password")
        post :create, { username: "yo", password: "a_password" }

        expect(controller.current_user).to eq user
      end 
    end

    context "user enters invalid credentials" do 

      it "does not log in the user" do 

        post :create, { username: "jo", password: "a_password" }

        expect(controller.current_user).to be_false

        expect(flash[:notice]).to eq "Invalid credentials"
      end
    end
  end

end
