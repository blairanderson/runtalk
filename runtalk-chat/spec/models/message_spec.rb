require 'spec_helper'

describe Message do
  let(:chat){create_chat}
  let(:message){create_message}
  
  before :each do 
    expect(chat).to be_valid
    expect(message).to be_valid
  end

  describe 'validations' do 
    it 'must have content' do 
      message.content = nil
      expect(message).to be_invalid 
    end

    it 'must be attached to chat' do 
      message = Message.new(content: "valid")
      expect(message.save).to be_false
    end
  end

  describe '#build_location_for_chat' do 
    it 'uses location params to create a location' do 
      expect(chat).to be_valid
      location_params = {:latitude=>"39.7336161", :longitude=>"-104.9926653", :accuracy=>"71"}

      message = Message.build_location_for_chat(location_params, chat)
      expect(message).to be_valid

      location = message.location 
      expect( location ).to be_valid
      expect( location.latitude).to eq "39.7336161"
      expect( location.longitude).to eq "-104.9926653"
      expect( location.accuracy).to eq "71"
    end

    it 'does not build a location with bad params' do 
      expect(chat).to be_valid
      invalid_params = {:latitude=>"taco", :longitude=>"taco", :accuracy=>"taco"}

      message = Message.build_location_for_chat(invalid_params, chat)
      expect(message).to be_invalid

      location = message.location 
      expect( location ).to be_invalid
    end
  end


    describe '#build_photo_for_chat' do 
    it 'uses photo params to create a photo' do 
      expect(chat).to be_valid
      photo_params = {:photo_url => "http://google.com/img.png"}

      message = Message.build_photo_for_chat(photo_params, chat)
      expect(message).to be_valid
      expect(message.content).to eq "photo contents"

      photo = message.photo 
      expect( photo ).to be_valid
      expect( photo.photo_url).to eq "http://google.com/img.png"
    end

    it 'does not build a photo with bad params' do 
      expect(chat).to be_valid
      invalid_params = {photo_url: "taco"}

      message = Message.build_photo_for_chat(invalid_params, chat)
      expect(message).to be_invalid

      photo = message.photo 
      expect( photo ).to be_invalid
    end
  end
end
