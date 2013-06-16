require 'spec_helper'

describe Chat do 
  let(:valid_name){"Valid Name"}
  let(:valid_slug){"validslug"}
  let(:chat){Chat.create!(name: valid_name, slug: valid_slug)}

  describe 'creating a new chatroom' do 

    context 'given the chatroom does not exist' do 

      it 'creates a new chatroom' do 

        visit '/'
        click_on('Create New Chatroom')
        fill_in 'Name', :with => "Example123"
        fill_in 'Slug', :with => "example123"
        click_button 'Create Chatroom'

        expect(current_path).to eq "/chats/example123"
        expect(page).to have_content("Example123")
      end

      it 'lists the chatroom as an available room'
    end

    context 'given the chatroom does exist' do 
    
      it 'informs the user that the chatroom already exists'

    end

  end


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
