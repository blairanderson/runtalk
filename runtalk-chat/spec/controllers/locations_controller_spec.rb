require 'spec_helper'

describe LocationsController do

  describe "POST 'create'" do
    let(:valid_latitude){"39.7336161"}
    let(:valid_longitude){"-104.9926653"}
    let(:valid_accuracy){"71"}
    let(:chat){create_chat}
    let(:valid_params) do 
      {"latitude"=> valid_latitude , "longitude"=> valid_longitude , "accuracy"=> valid_accuracy , "chat_id"=> chat.slug}
    end
    
    it "creates a message and location" do
      post :create, valid_params
      expect(Location.count).to eq 1
      expect(Location.first.latitude).to eq valid_latitude
      expect(Location.first.longitude).to eq valid_longitude
      expect(Location.first.accuracy).to eq valid_accuracy
    end
  end

end
