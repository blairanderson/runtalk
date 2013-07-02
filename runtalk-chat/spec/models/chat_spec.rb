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
      expect(messages.first).to be_kind_of Message
    end
  end


  describe 'validations' do 
    let(:chat){Chat.create(name: "Example123", slug: "example123")}

    before do 
      expect(chat).to be_valid
    end

    context 'a chatroom slug is unique' do 
      it 'cannot have the same slug' do 
        expect(Chat.create(name: "Example123", slug: "example123")).to be_invalid
      end

      it 'cannot have the same slug, case insensitive' do 
        expect(Chat.create(name: "Example123", slug: "EXAMPLE123")).to be_invalid
      end


      it 'cannot have symbols or caps in slug' do 
        expect(Chat.create(name: "Example123", slug: "?123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "&123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "%123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "*123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "[]123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "()123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "=123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "~123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: "@123")).to be_invalid
        expect(Chat.create(name: "Example123", slug: '#123')).to be_invalid
        expect(Chat.create(name: "Example123", slug: 'BAD')).to be_invalid
      end
    end
  end

  it 'object path should use slug instead of id' do 
    chat = Chat.create(name: "funny", slug: "funny")
    expect(chat.to_param).to eq "funny"
  end
end
