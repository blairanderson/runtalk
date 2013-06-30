require 'spec_helper'

describe Chat do 
  let(:valid_name){"Valid Name"}
  let(:valid_slug){"validslug"}
  let(:chat){Chat.create!(name: valid_name, slug: valid_slug)}

  describe 'creating a new chatroom' do 

    before do 
      Chat.any_instance.stub(:message_request).and_return([])
    end

    context 'given the chatroom does not exist' do 
      it 'creates a new chatroom' do 
        visit root_path

        fill_in 'name', :with => "Example123"
        click_button 'Create'
        click_button 'Create Chatroom'


        expect(current_path).to eq "/chats/example123"
        expect(page).to have_content("Example123")
      end
    end
  

    context 'given the chatroom does exist' do 
      before do 
        Chat.create(name: "Example123", slug: "example123")
      end
      it 'informs the user that the chatroom already exists' do 
        visit root_path
        fill_in 'name', :with => "Example123"
        click_button 'Create'
        click_button 'Create Chatroom'
        
        expect(current_path).to eq "/chats/new"
        within("#flash") do
          expect(page).to have_content("Sorry")
        end
      end
    end
  end



  
end
