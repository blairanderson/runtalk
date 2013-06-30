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
    let(:valid_location) do 
      {
        content: "some content",
        chat_id: 1,
        location: {
          latitude: "39.733482200000005",
          longitude: "-104.9926124",
          accuracy: 2,
          address: "1060 North Speer Boulevard, Denver, CO 80204, USA",
          map_url: "http://maps.google.com/maps/api/staticmap?size=700x200&zoom=16&sensor=true&maptype=road&markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124"
        }
      }
    end

    before do 
      Message.store_message(valid_location) 
    end
    it 'saves the message' do
      expect(Message.count).to eq 1
    end

    it 'saves the location' do 
      expect(Location.count).to eq 1
    end

    it 'saves the association between the message and location' do
      expect(Message.first.location).to be_kind_of Location
    end
  end

  context 'given a message with a photo' do 
    let(:valid_photo) do 
      {
        content: "some content",
        chat_id: 1,
        photo: {photo_url: "http://filepicker.com/poop"}
      }
    end

    before do 
      Message.store_message(valid_photo)
    end

    it 'saves the message' do
      expect(Message.count).to eq 1
    end

    it 'saves the photo' do 
      expect(Photo.count).to eq 1
    end

    it 'saves the association between the message and photo' do
      expect(Message.first.photo).to be_kind_of Photo
    end
  end
end
