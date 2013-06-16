require 'spec_helper'

describe Chat do 
  let(:valid_name){"Valid Name"}
  let(:valid_slug){"validslug"}
  let(:chat){Chat.create!(name: valid_name, slug: valid_slug)}
  describe 'visiting a chatroom' do 
    it 'should be accessible at /chats/:chat_slug' do 
      
      expect(chat.name).to eq valid_name
      expect(chat.slug).to eq valid_slug

      visit chat_path(chat)
      expect(current_path).to eq "/chats/#{valid_slug}"
      expect(page).to have_content valid_name.capitalize
    end
  end

  
end
