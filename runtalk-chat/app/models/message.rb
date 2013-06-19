class Message < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true
  has_one :photo, dependent: :destroy, autosave: true

  def self.build_location_for_chat(location, chat)
    message = Message.new
    message.chat_id = chat.id
    message.content = "Mapping your location"
    message.save
    location = message.create_location(location)
    message.content = "mapping... #{location.formatted_address}"
    message.save
    message
  end

  def self.build_photo_for_chat(photo, chat)
    message = Message.new
    message.chat_id = chat.id
    message.content = "photo contents"
    message.save
    photo = message.create_photo(photo)
    message
  end

end
