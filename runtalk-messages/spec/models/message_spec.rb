require 'spec_helper'

describe Message do 


  context 'given a message' do 
    let(:valid_attributes) do 
      {
        content: "some content",
        chat_id: 1
      }
    end
  
    it "saves the message" do 
      expect{ Message.store_message(valid_attributes) }
      .to change(Message, :count).by(1)
    end
  end

  context 'given a message with a location' do 
    let(:valid_attributes) do 
      {
        content: "some content",
        chat_id: 1,
        location: {
          latitude: "39.733482200000005",
          longitude: "-104.9926124",
          accuracy: 2,
          address: "1060 North Speer Boulevard, Denver, CO 80204, USA"
        }
      }
    end

    before do 
      Message.store_message(valid_attributes) 
    end
    it 'saves the message' do
      expect(Message.count).to eq 1
    end

    it 'saves the location' do 
      expect(Location.count).to eq 1
    end
  end

  context 'given a message with a photo' do 
  end
  

end
