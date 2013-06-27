require 'spec_helper'


describe Location do 

  let(:location) do
    { 
      latitude: "39.733482200000005",
      longitude: "-104.9926124",
      accuracy: 2,
      address: "1060 North Speer Boulevard, Denver, CO 80204, USA"
    }
  end

  let(:subject){Location.create(location)}

  its(:latitude) { location[:latitude] }
  its(:longitude) { location[:longitude] }
  its(:accuracy) { location[:accuracy] }
  its(:address) { location[:address] }


end
