require 'spec_helper'


describe Location do 

  let(:location) do
    { 
      latitude: "39.733482200000005",
      longitude: "-104.9926124",
      accuracy: 2,
      address: "1060 North Speer Boulevard, Denver, CO 80204, USA",
      map_url: "http://maps.google.com/maps/api/staticmap?size=700x200&zoom=16&sensor=true&maptype=road&markers=color%3Ablue%7Clabel%3AYou%7C39.733482200000005,-104.9926124"
    }
  end

  let(:subject){Location.create(location)}

  its(:latitude) { location[:latitude] }
  its(:longitude) { location[:longitude] }
  its(:accuracy) { location[:accuracy] }
  its(:address) { location[:address] }
  its(:map_url) { location[:map_url] }

end
