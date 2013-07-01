require 'spec_helper'

describe User do 

  describe "creating a new user from the sign up page" do 

    context "valid credentials are entered" do 

      it "creates a new user" do 

        visit "/"
        click_on "Sign Up"

        expect(current_path).to eq "/users/new"

        fill_in "Username", :with => "Sally"
        fill_in "Email", :with => "SillySally@emample.com"
        fill_in "Password", :with => "the_most_secret"

        click_on "Create Account"

        expect(current_path).to eq "/"
      end
    end

    context "an invalid user is created" do 
    end
  end

  describe "inviting a user to the site" do 
  end
end