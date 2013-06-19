require 'spec_helper'

describe Photo do
  let(:chat){create_chat}
  let(:message){create_message}

  let(:photo)do
    photo = new_photo
    photo.message_id = message.id
    photo.save
    photo  
  end

  before :each do 
    expect(chat).to be_valid
    expect(message).to be_valid
    expect(photo).to be_valid
  end

  describe 'validations' do 
    it 'must have a url' do 
      expect(photo).to be_valid
      expect(photo.photo_url).to eq "http://www.google.com/image.png"

      photo.photo_url = nil
      expect(photo).to be_invalid
    end

    it 'is invalid without a URL' do 
      expect(photo).to be_valid
      expect(photo.photo_url).to eq "http://www.google.com/image.png"

      photo.photo_url = "taco"
      expect(photo).to be_invalid
    end

    it 'should have a message_id' do 
      expect(photo).to be_valid

      photo.message_id = nil
      expect(photo).to be_invalid
    end
  end

end
