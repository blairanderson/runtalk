require 'spec_helper'

describe MessagesController do 

  describe 'GET #index' do 
    let(:valid_location) do 
      {
        content: "some content",
        chat_id: 1,
        profile: {id: 1},
        location: {
          latitude: "39.733482200000005",
          longitude: "-104.9926124",
          accuracy: 2,
          address: "1060 North Speer Boulevard, Denver, CO 80204, USA",
          map_url: "http://maps.google.com/maps/api/staticmap?size=700x200&zoom=16&sensor=true&maptype=road&markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124"
        }
      }
    end

    let(:valid_photo) do 
      {
        content: "photo... ",
        chat_id: 1,
        profile: {id: 1}, 
        photo: {photo_url: "http://filepicker.com/poop"}
      }
    end


    let!(:message1) { Message.create!(chat_id: 1, content: "some_content", user_id: 1) }
    let!(:message2) { Message.store_message(valid_location) }
    let!(:message3) { Message.store_message(valid_photo) }

    it "renders a list of messages in json, at most 20" do 
      get :index, chat_id: 1
      expect( assigns(:messages) ).to eq [message1, message2, message3]
    end

    it "includes the location for messages with locations" do

      Message.any_instance.stub(:created_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      Message.any_instance.stub(:updated_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      Location.any_instance.stub(:created_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      Location.any_instance.stub(:updated_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      Photo.any_instance.stub(:created_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      Photo.any_instance.stub(:updated_at).and_return(Time.parse("2013-06-29T22:23:58Z"))
      
      get :index, chat_id: 1

      target = JSON.parse(response.body)
      expect( target ).to eq [
          {"id"=>1, "content"=>"some_content", "user_id"=>1, "chat_id"=>1, "created_at"=>"2013-06-29T22:23:58Z", "updated_at"=>"2013-06-29T22:23:58Z"}, 
          {"id"=>2, "content"=>"some content", "user_id"=>1, "chat_id"=>1, "created_at"=>"2013-06-29T22:23:58Z", "updated_at"=>"2013-06-29T22:23:58Z", "location"=>{"id"=>1, "message_id"=>2, "latitude"=>"39.733482200000005", "longitude"=>"-104.9926124", "accuracy"=>"2", "address"=>"1060 North Speer Boulevard, Denver, CO 80204, USA", "map_url"=>"http://maps.google.com/maps/api/staticmap?size=700x200&zoom=16&sensor=true&maptype=road&markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124", "created_at"=>"2013-06-29T22:23:58Z", "updated_at"=>"2013-06-29T22:23:58Z"}}, 
          {"id"=>3, "content"=>"photo... ", "user_id"=>1, "chat_id"=>1, "created_at"=>"2013-06-29T22:23:58Z", "updated_at"=>"2013-06-29T22:23:58Z", "photo"=>{"id"=>1, "photo_url"=>"http://filepicker.com/poop", "message_id"=>3, "created_at"=>"2013-06-29T22:23:58Z", "updated_at"=>"2013-06-29T22:23:58Z"}}]

    end
  end
end
