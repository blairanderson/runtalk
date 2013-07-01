require 'spec_helper'

describe User do 

  describe "user login" do 

    context "a user is registered" do 

      it "signs in the user" do 
        user = User.create(username: "yo", email: "yolo@example.com", password: "a_password")

        visit "/"
        click_on "Log In"

        fill_in "Username", :with => "yo"
        fill_in "Password", :with => "a_password"
        click_on "Log in"

        expect(current_path).to eq "/"
        expect(page).to have_content "Sign Out"
        expect(page).to_not have_content "Log In"
      end
    end

    context "a user is not registered" do 

      it "does not sign in the user" do 

        visit "/"
        click_on "Log In"

        fill_in "Username", :with => "jo"
        fill_in "Password", :with => "a_password"
        click_on "Log in"

        expect(current_path).to eq "/sessions/new"
        within("#flash") do 
          expect(page).to have_content("Invalid credentials")
        end
      end 
    end
  end
end