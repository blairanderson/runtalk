  require 'spec_helper'

describe Chat do

  describe '#messages' do 
    
    let(:sample_messages) do 
      [{"id"=>1, "content"=>"funny message", "user_id"=>nil, "chat_id"=>1, "created_at"=>"2013-06-26T23:16:43.977Z", "updated_at"=>"2013-06-26T23:16:43.977Z"}]
    end

    before do 
      Chat.any_instance.stub(:message_request).and_return(sample_messages)
    end

    it 'should convert these messages to MessageProxy objects' do 
      chat = create_chat
      messages = chat.messages
      expect(messages.first).to be_kind_of MessageProxy
    end
  end

  describe '#create' do 

    context 'a chatroom name is unique' do 

      it 'creates the chatroom' do 
        expect(Chat.create(name: "Example123", slug: "example123")).to be_valid
      end
    end

    context 'a chatroom name is not unique' do

      before do 
        Chat.create(name: "Example123", slug: "example123")
      end

      it 'does not create the chatroom' do 
        expect(Chat.create(name: "Example123", slug: "example000")).to_not be_valid
      end
    end

    context 'a chatroom slug is unique' do 
      it 'creates the chatroom' do 
        expect(Chat.create(name: "Example123", slug: "example123")).to be_valid
      end
    end

    context 'a chatrom slug is not unique' do

      before do 
        Chat.create(name: "Example000", slug: "example123")
      end

      it 'does not create the chatroom' do 
        expect(Chat.create(name: "Example123", slug: "example123")).to_not be_valid
      end 
    end
  end

  describe 'validations' do 
    it 'should always use lowercase characters in slug'
    it 'cannot have symbols in slug'
  end
  
  it 'object path should use slug instead of id' do 
    chat = Chat.create(name: "funny", slug: "funny")
    expect(chat.to_param).to eq "funny"
  end
end
