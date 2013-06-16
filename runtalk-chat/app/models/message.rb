class Message < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat

  has_one :location, dependent: :destroy, autosave: true

  # def has_valid_location?
  #   true
  # end
end
