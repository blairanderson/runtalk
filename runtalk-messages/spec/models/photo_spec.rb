require 'spec_helper'

describe Photo do
  describe '.create' do 
    let(:photo) {{photo_url: "http://filepicker.com/poop"}}
    let(:subject) {Photo.create(photo)}

    its(:photo_url) {photo[:photo_url]}
  end
end
