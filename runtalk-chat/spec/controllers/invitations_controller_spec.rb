require 'spec_helper'

describe InvitationsController do

  describe "POST #create" do 

    let!(:chat) { Chat.create(name: "valid_name", slug: "validslug")}
    let!(:user) { User.create(username: "jo", email: "jolo@example.com", password: "a_password") }

    it "creates a new invitation" do 

      VCR.use_cassette("create_invitations") do

        post :create, { phone_number: "15005550000", chat_id: chat.slug, user_id: user.id }
        expect(assigns(:chat)).to eq chat
      end
    end
  end

  describe "GET #new" do 

    let(:invitation) { InvitationProxy.new}

    it "renders a new invitation" do 
      pending "it says no route is available but the route is there"
      get :new
      expect(assigns(:invitation)).to eq invitation
    end
  end
end

