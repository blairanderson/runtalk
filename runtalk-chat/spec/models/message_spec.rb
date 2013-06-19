require 'spec_helper'

describe Message do
  let(:chat){create_chat}
  
  before :each do 
    expect(chat).to be_valid
  end

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

  describe '#build_and_validate_location' do 
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

    end
  end
end
