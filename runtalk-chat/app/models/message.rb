class Message < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true

  def build_and_validate_location(location)
    if location = self.create_location(location)
      self.content = "Mapping lat: #{location[:latitude][0,9]} lon: #{location[:longitude][0,9]}"
      location
    else
      return false
    end
  end
end
