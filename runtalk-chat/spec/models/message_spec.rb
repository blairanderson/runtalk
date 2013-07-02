require 'spec_helper'

describe Message do

  let(:message) do 
    {
      content: "message",
      chat_id: 1,
      created_at: Time.parse("2013-06-29T14:30:59-06:00")
    }
  end

  let(:subject) { Message.new(message) }

  its(:content) {message[:content]}
  its(:chat_id) {message[:chat_id]}

  describe '#to_json' do 

    it 'should be properly formatted json' do 
      expect(subject.to_json).to eq "{\"content\":\"message\",\"chat_id\":1,\"created_at\":\"2013-06-29T14:30:59-06:00\"}"
    end

    let(:location_params) do 
      {
        latitude: "39.733482200000005",
        longitude: "-104.9926124",
        accuracy: 2
      }
    end
    
    it 'should have valid to_json for message with location' do
      Location.any_instance.stub(:build_address).and_return("1062 Delaware Street, Denver, CO 80204, USA")
      Time.stub(:now).and_return(Time.parse("2013-06-29T14:30:59-06:00"))
      message = Message.build_location_for_chat(location_params,1)
      expect(message.location).to be_kind_of Location
      expect(message.to_json).to eq "{\"chat_id\":1,\"location\":{\"latitude\":\"39.733482200000005\",\"longitude\":\"-104.9926124\",\"accuracy\":2,\"address\":\"1062 Delaware Street, Denver, CO 80204, USA\",\"map_url\":\"http://maps.google.com/maps/api/staticmap?size=700x200\\u0026zoom=16\\u0026sensor=true\\u0026maptype=road\\u0026markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124\"},\"content\":\"mapping... 1062 Delaware Street, Denver, CO 80204, USA\",\"created_at\":\"2013-06-29T14:30:59-06:00\"}"
    end

    let(:photo_params){{photo_url: "http://filepicker.com/image"}}

    it 'should have valid json for message with photo' do 
      Time.stub(:now).and_return(Time.parse("2013-06-29T14:30:59-06:00"))
      message = Message.build_photo_for_chat(photo_params,1)
      expect(message.photo).to be_kind_of Photo
      expect(message.to_json).to eq "{\"chat_id\":1,\"photo\":{\"photo_url\":\"http://filepicker.com/image\"},\"content\":\"photo...\",\"created_at\":\"2013-06-29T14:30:59-06:00\"}"
    end
  end

  describe '.build_photo_for_chat' do 
    let(:photo_params){{photo_url: "http://filepicker.com/image"}}
 
    it 'should create a message that response to photo' do 
      message = Message.build_photo_for_chat(photo_params,1)
      expect(message.photo).to be_kind_of Photo
      expect(message.photo.photo_url).to eq "http://filepicker.com/image"
    end
  end

  describe '.build_location_for_chat' do 
    let(:location) do 
      {
        latitude: "39.733482200000005",
        longitude: "-104.9926124",
        accuracy: 2
      }
    end
    
    it 'should create a message that responds to location' do 
      Location.any_instance.stub(:build_address).and_return("address")
      message = Message.build_location_for_chat(location,1)
      expect(message.location).to be_kind_of Location
    end    
  end

  context ".build_message_with_photo_or_location" do 
    
    let(:message_with_location) do 
      {"chat_id"=>1,
      "content"=>"mapping... 1062 Delaware Street, Denver, CO 80204, USA",
      "created_at"=>"2013-06-27T16:51:48-06:00",
      location: {
        "latitude"=>"39.7335536",
        "longitude"=>"-104.99257779999999",
        "accuracy"=>"20",
        "address"=>"1062 Delaware Street, Denver, CO 80204, USA",
        map_url: "http:map.org"
        }
      }
    end

    it 'should build message with location' do 
      Location.any_instance.stub(:build_address).and_return("poop")
      message = Message.build_message_with_location_or_photo(message_with_location)
      expect(message.location.class).to eq Location
    end

    let(:message_with_photo) do 
      {"chat_id"=>1,
      "content"=>"photo... ",
      "created_at"=>"2013-06-27T16:51:48-06:00",
      photo: {photo_url: "http://www.example.com/photo.png"}
      }.with_indifferent_access
    end

    it 'should build message with photo' do 
      message = Message.build_message_with_location_or_photo(message_with_photo)
      expect(message.photo).to be_kind_of Photo
    end
  end
end
