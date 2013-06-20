require 'spec_helper'

describe PhotosController do
  let(:valid_url){"http://filepicker.com/image/valid-photo-url"}
  let(:chat){create_chat}
  let(:valid_params) do 
      {
        photo_url: valid_url,
        chat_id: chat.slug
      }
  end

  describe "POST 'create'" do
    it "creates a photo, responding to json and HTML" do
      expect(chat).to be_valid
      post :create, valid_params
      expect(Photo.count).to eq 1
      expect(Photo.first.photo_url).to eq "http://filepicker.com/image/valid-photo-url"
    end
  end

end
