require 'spec_helper'

describe User do
  
  describe ".username" do 

    context "given a username exists" do 

      it "does not create the user"

      it "has an error on username"
    end

    context "a user does not give a username" do 

      it "does not create the user"

      it "has an error on username"
    end

    context "a user does give a username" do 

      it "creates the user"
    end
  end

  describe ".password" do 

    context "a user does not give a password" do 

      it "does not create the user"

      it "has an error on password"
    end

    context "a user does give a password" do 

      it "creates the user"
    end
  end

  describe ".password_confirmation" do 

    context "a user does not give a password confirmation" do 

      it "does not create the user"

      it "has an error on password confirmation"
    end

    context "a user does give a password confirmation" do 

      it "creates the user"
    end
  end

  describe ".email" do 

    context "given an email exists" do 

      it "does not create the user"

      it "has an error on email"
    end

    context "a user does not give an email" do 

      it "does not create the user"

      it "has an error on email"
    end

    context "a user does give an email" do 

      it "creates the user"
    end
  end
end
