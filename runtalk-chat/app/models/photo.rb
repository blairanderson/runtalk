class Photo < ActiveRecord::Base
  belongs_to :message

  validates_presence_of :photo_url
  validates_presence_of :message_id
end
