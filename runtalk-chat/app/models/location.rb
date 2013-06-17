class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :accuracy

  validates :message_id, presence: true
  belongs_to :message

  after_create :build_map_url

  def build_formatted_address
    latlong = "#{latitude}, #{longitude}"
    self.formatted_address = Geocoder.search(latlong).first.formatted_address
    self.save
  end

  def google_map_url
    "https://maps.google.com/?q=#{self.latitude},#{self.longitude}"
  end
  
  def build_map_url
    image = StaticMap::Image.new({
      size: '700x200',
      sensor: false,
      markers: [{ latitude: self.latitude, longitude: self.longitude, color: "blue", label: "You" }],
      maptype: 'road',
      zoom: 16,
      title: 'Your Location',
      alt: "map of your location, near lat: #{self.latitude} and lon: #{self.longitude}"
    })
    self.map_url = image.url
    self.save
  end
end

