class Message < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true
  has_one :photo, dependent: :destroy, autosave: true

  def build_and_validate_location(location)
    if location = self.create_location(location)
      location.build_formatted_address
      self.content = "mapping... #{location.formatted_address}"
      location
    else
      return false
    end
  end
end
