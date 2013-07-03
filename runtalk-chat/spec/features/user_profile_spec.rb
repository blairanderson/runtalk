require 'spec_helper'

describe "Profile" do 
  describe "User creates a profile" do 
    it 'allows anonymous to create profile' do 
      visit new_profile_path
      fill_in :profile_name, with: "tom"
      click_on("create")
      expect(current_path).to eq root_path
      expect(Profile.count).to eq 1
    end

    it 'allows anonymous to create profile and redirect to referring room' do 
      chat = create_chat
      visit new_profile_path(chat_id: chat.slug)
      fill_in :profile_name, with: "tom"
      click_on("create")
      expect(current_path).to eq chat_path(chat)
      expect(Profile.count).to eq 1
    end
  end
end
