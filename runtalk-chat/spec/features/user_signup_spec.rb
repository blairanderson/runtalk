require 'spec_helper'

describe User do 

  describe "creating a new user from the sign up page" do 

    context "valid credentials are entered" do 

      it "creates a new user" do 
        visit new_users_path

        fill_in "Username", :with => "Sally"
        fill_in "Email", :with => "SillySally@emample.com"
        fill_in "Password", :with => "the_most_secret"

        click_on "Create Account"
        expect(User.count).to eq 1
        expect(Profile.count).to eq 1
      end
    end
  end

  describe "inviting a user to the site" do 
  end
end
