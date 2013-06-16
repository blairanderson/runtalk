require 'spec_helper'

describe Message do
  describe 'validations' do 
    it 'must have content' do 
      message = Message.new(content: "valid")
      message.chat_id = 1
      expect(message).to be_valid

      message.content = nil
      expect(message).to be_invalid 
    end

    it 'must be attached to chat' do 
      message = Message.new(content: "valid")
      expect(message.save).to be_false
    end
  end

  describe '#has_valid_location' do 
    it 'requires lat/lon/accuracy' do 
      message = Message.new(content: "valid")
      message.chat_id = 1
      expect(message).to be_valid
      message.build_location({"latitude"=>"39.7336161", "longitude"=>"-104.9926653", "accuracy"=>"71"})
      location = message.location
      expect( location ).to be_valid
      expect( location.latitude).to eq "39.7336161"
      expect( location.longitude).to eq "-104.9926653"
      expect( location.accuracy).to eq "71"
    end
  end
end
