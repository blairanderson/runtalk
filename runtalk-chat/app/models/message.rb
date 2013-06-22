class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true
  has_one :photo, dependent: :destroy, autosave: true

  def self.build_location_for_chat(location, chat)
    message = Message.create(
      chat_id: chat.id, 
      content: "Mapping your location")
    location = message.create_location(location)
    location.build_formatted_address
    message.update_attributes(content: "mapping... #{location.formatted_address}")
    message
  end

  def self.build_photo_for_chat(photo, chat)
    message = Message.create(chat_id: chat.id, content: "photo contents")
    message.create_photo(photo)
    message
  end

end