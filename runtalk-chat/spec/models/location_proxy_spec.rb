require 'spec_helper'

describe LocationProxy do 

  let(:location) do 
    {
      latitude: "39.733482200000005",
      longitude: "-104.9926124",
      accuracy: 2
    }
  end

  let(:subject) { LocationProxy.new(location)}

  its(:latitude) { location[:latitude] }
  its(:longitude) { location[:longitude] }
  its(:accuracy) { location[:accuracy] }

  it "gets an address from Geocoder" do 
    VCR.use_cassette("location_address") do 
      expect(subject.address).to eq "1060 North Speer Boulevard, Denver, CO 80204, USA"
    end
  end

end
