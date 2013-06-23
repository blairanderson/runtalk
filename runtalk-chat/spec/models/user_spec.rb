require 'spec_helper'

describe User do
  
  describe ".username" do 

    let!(:user) { User.create(username: "yo", email: "yolo@example.com", password: "a_password") }

    context "given a username exists" do 


      it "does not create the user" do 
        expect(User.create(username: "yo", email: "yolo@example.com", password: "a_password") ).to_not be_valid
      end
    end

    context "a user does not give a username" do 

      it "does not create the user" do 
        expect(User.create(email: "yolo@example.com", password: "a_password") ).to_not be_valid
      end
    end

    context "a user does give a unique username" do 

      it "creates the user" do 
        expect(User.create(username: "unique_username", email: "yolo@example.com", password: "a_password") ).to be_valid
      end
    end
  end

  describe ".password" do 

    context "a user does not give a password" do 

      it "does not create the user" do 
        expect(User.create(username: "yo", email: "yolo@example.com") ).to_not be_valid
      end
    end

    context "a user does give a password" do 

      it "creates the user" do 
        expect(User.create(username: "yo", email: "yolo@example.com", password: "a_password") ).to be_valid
      end
    end
  end

  describe ".email" do 

    context "given an email exists" do 

      it "does not create the user" do 
        expect(User.create(username: "yo", email: "yolo@example.com", password: "a_password") ).to_not be_valid
      end
    end

    context "a user does not give an email" do 

      it "does not create the user" do 
        expect(User.create(username: "yo", password: "a_password") ).to_not be_valid
      end
    end

    context "a user does give an email" do 

      it "creates the user" do 
        expect(User.create(username: "yo", email: "yolo@example.com", password: "a_password") ).to be_valid
      end
    end
  end
end
