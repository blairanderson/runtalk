require 'ostruct'

class Message < OpenStruct

  def self.build_proxy_message(message_content, chat_id)
    valid_message = { 
      content: message_content, 
      chat_id: chat_id,
      created_at: Time.now}
    new(valid_message)
  end

  def self.build_message_with_location_or_photo(message)
    result = new(message)
    result = build_location_for_chat(message[:location], message[:chat_id]) if message[:location]
    result = build_photo_for_chat(message[:photo], message[:chat_id]) if message[:photo]
    result.profile = Profile.find_by_id(message[:user_id])
    result      
  end

  def self.build_location_for_chat(lat_long, chat_id)
    location = Location.new(lat_long)
    message = {
      chat_id: chat_id, 
      location: location,
      content: "mapping... #{location.address}",
      created_at: lat_long[:created_at] || Time.now
      }
    new(message)
  end

  def self.build_photo_for_chat(photo, chat_id)
    photo = Photo.new(photo)
    message = {
      chat_id: chat_id, 
      photo: photo,
      content: "photo...",
      created_at: photo[:created_at] || Time.now
      }
    new(message)
  end

  def to_partial_path
    "messages/message"
  end

  def to_json
    result = {}
    to_h.map do |key, value|
      thing = value
      thing = value.to_h if key == :location
      thing = value.to_h if key == :photo
      result[key] = thing
    end
    result.to_json
  end
end
