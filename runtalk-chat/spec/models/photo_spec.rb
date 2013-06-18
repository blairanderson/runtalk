require 'spec_helper'

describe Photo do
  let(:chat){create_chat}
  let(:message)do
    message = Message.new
    message.content = "this is great"
    message.chat_id = chat.id
    message.save
    message
  end

  let(:photo)do
    photo = Photo.new
    photo.photo_url = "http://www.google.com/image.png"
    photo.message_id = message.id
    photo.save
    photo  
  end

  describe 'validations' do 
    it 'should have a url' do 
      expect(photo).to be_valid

      photo.photo_url = nil
      expect(photo).to be_invalid
    end

    it 'should have a message_id' do 
      expect(photo).to be_valid

      photo.message_id = nil
      expect(photo).to be_invalid
    end
  end
end
