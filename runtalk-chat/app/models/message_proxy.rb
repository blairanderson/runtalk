require 'ostruct'

class MessageProxy < OpenStruct

  def self.build_proxy_message(message_content, chat_id)
    valid_message = { 
      content: message_content, 
      chat_id: chat_id,
      created_at: Time.now}
    new(valid_message)
  end

  def self.build_location_for_chat(lat_long, chat_id)
    location = LocationProxy.new(lat_long)
    message = {
      chat_id: chat_id, 
      location: location,
      content: "mapping... #{location.address}",
      created_at: Time.now
      }
    MessageProxy.new(message)
  end

  def photo
    false
  end

  def to_partial_path
    "messages/message"
  end

  def to_json
    marshal_dump.to_json
  end
end
