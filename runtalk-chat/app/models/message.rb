class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true
  has_one :photo, dependent: :destroy, autosave: true

  def self.build_location_for_chat(location, chat)
    a = parse_raw_value_as_a_number(location[:latitude])
    b = parse_raw_value_as_a_number(location[:longitude])
    c = parse_raw_value_as_a_number(location[:accuracy])
    yes = (a != nil) && (b != nil) && (c != nil)
    if yes
      message = Message.create(
        chat_id: chat.id, 
        content: "Mapping your location")
      location = message.create_location(location)
      location.build_formatted_address

      message.update_attributes(content: "mapping... #{location.formatted_address}")
      message
    else
      "you fucked up"
    end
  end

  def self.parse_raw_value_as_a_number(raw_value)
    case raw_value
    when /\A0[xX]/
      nil
    else
      begin
        Kernel.Float(raw_value)
      rescue ArgumentError, TypeError
        nil
      end
    end
  end

  def self.build_photo_for_chat(photo, chat)
    message = Message.create(chat_id: chat.id, content: "photo contents")
    message.create_photo(photo)
    message
  end

end
