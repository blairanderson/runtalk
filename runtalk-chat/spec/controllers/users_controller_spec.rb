require 'spec_helper'

describe UsersController do

  valid_params = { user: { username: "patrick", 
                   email: "an_email@example.com",
                   password: "a_password", 
                   password_confirmation: "a_password" } }

  invalid_params = { user: { username: "patrick", 
                 email: "an_email@example.com" } }

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do 

    context "given a user has already signed up" do 

      it "creates a user" do 
        expect {
          post :create, valid_params 
        }.to change(User, :count).by(1)
      end
    end

    context "given a user has not already signed up" do 

      it "does not create a new user" do 
        expect {
          post :create, invalid_params 
        }.to change(User, :count).by(0)
      end
    end
  end

end
