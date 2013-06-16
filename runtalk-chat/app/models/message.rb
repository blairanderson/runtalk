class Message < ActiveRecord::Base
  attr_accessible :content
  
  validates :content, presence: true
  validates :chat_id, presence: true
  belongs_to :chat
end
