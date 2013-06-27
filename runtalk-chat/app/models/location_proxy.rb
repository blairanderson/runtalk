require 'ostruct'

class LocationProxy < OpenStruct
  def address
    @address ||= build_address
  end

  def map_url
    @map_url ||= build_map_url
  end

  def google_map_url
    "https://maps.google.com/?q=#{latitude},#{longitude}"
  end

  def build_address
    Geocoder.search("#{latitude}, #{longitude}").first.formatted_address
  end

  def build_map_url
    StaticMap::Image.new({
      size: '700x200',
      sensor: false,
      markers: [{ latitude: latitude, longitude: longitude, color: "blue", label: "You" }],
      maptype: 'road',
      zoom: 16,
      title: 'Your Location',
      alt: "map of your location, near lat: #{self.latitude} and lon: #{self.longitude}"
    }).url
  end

  def to_json
    marshal_dump.to_json
  end
end
