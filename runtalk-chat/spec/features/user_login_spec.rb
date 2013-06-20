require 'spec_helper'

describe User do 

  describe "user login" do 

    context "a user is registered" do 

      it "signs in the user" do 

        user = User.create(username: "yo", email: "yolo@example.com", password: "a_password")

        visit "/"
        click_on "Log In"

        fill_in "Username", :with => "yolo@example.com"
        fill_in "Password", :with => "a_password"
        click_on "Log in"

        expect(current_path).to eq "/"
        within("#flash") do 
          expect(page).to have_content("Signed In")
        end

        expect(current_user).to eq user

      end
    end

    context "a user is not registered" do 

      it "does not sign in the user"
    end
  end
end