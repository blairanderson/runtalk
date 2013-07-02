require 'ostruct'

class Location < OpenStruct

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

  def to_h
    result = @table.dup
    result[:address] = address
    result[:map_url] = map_url
    result
  end
end
