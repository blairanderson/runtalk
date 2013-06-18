require 'spec_helper'

describe LocationsController do

  describe "POST 'create'" do
    let(:invalid_latitude){"TACO"}
    let(:invalid_longitude){"TACO"}
    let(:invalid_accuracy){"PIZZA"}
    let(:invalid_params)do
      {"latitude"=> invalid_latitude , "longitude"=> invalid_longitude , "accuracy"=> invalid_accuracy , "chat_id"=> chat.slug}
    end

    let(:valid_latitude){"39.7336161"}
    let(:valid_longitude){"-104.9926653"}
    let(:valid_accuracy){"71"}
    let(:chat){create_chat}
    let(:valid_params) do 
      {"latitude"=> valid_latitude , "longitude"=> valid_longitude , "accuracy"=> valid_accuracy , "chat_id"=> chat.slug}
    end
    
    it "creates a message and location with valid params" do
      post :create, valid_params
      expect(Location.count).to eq 1
      expect(Location.first.latitude).to eq valid_latitude
      expect(Location.first.longitude).to eq valid_longitude
      expect(Location.first.accuracy).to eq valid_accuracy
      expect(Message.count).to eq 1
      expect(Message.first.content).to eq "mapping... 1062 Delaware Street, Denver, CO 80204, USA"
    end

    xit 'does not create message or location when bad params are submitted' do 
      post :create, invalid_params
      expect(Location.count).to eq 0
      expect(Message.count).to eq 0
    end
  end
end
