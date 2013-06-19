require 'spec_helper'

describe Location do

  let(:location) do 
    location = Location.new
    location.message_id = 1
    location.latitude = "39.733482200000005"
    location.longitude = "-104.9926124"
    location.save
    location
  end

  describe 'validations' do 
    it 'latitude should only consist of numerical chars' do 
      expect(location).to be_valid

      location.latitude = "TACO"
      expect(location).to be_invalid
    end
    
    it 'longitude should only consist of numerical chars' do 
      expect(location).to be_valid

      location.longitude = "TACO"
      expect(location).to be_invalid
    end
  end

  describe '#build_formatted_address' do 
    it 'should return an address from a latlon' do 
      expect(location).to be_valid

      VCR.use_cassette("build_formatted_address") do 
        target = "1060 North Speer Boulevard, Denver, CO 80204, USA"
        expect(location.build_formatted_address).to eq true
        expect(location.formatted_address).to eq target
      end

    end
  end

  describe '#build_map_url' do 
    it 'should return an image url from a latlong' do 
      expect(location).to be_valid
      target = "http://maps.google.com/maps/api/staticmap?size=700x200&zoom=16&sensor=true&maptype=road&markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124"
      
      VCR.use_cassette("build_map_url") do
        expect(location.build_map_url).to eq true
        expect(location.map_url).to eq target
      end
    end
  end

  it 'is invalid without a message_id' do 
    expect(location).to be_valid
    location.message_id = nil
    expect(location).to be_invalid
  end

  it 'should be destroyed if the message is deleted'

  it 'is invalid without latitude and longitude'
end
