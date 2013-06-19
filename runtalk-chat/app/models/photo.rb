class Photo < ActiveRecord::Base
  attr_accessible :photo_url

  belongs_to :message

  validates_presence_of :photo_url
  validates_format_of :photo_url, :with => URI::regexp(%w(http https))
  
  validates_presence_of :message_id
end
