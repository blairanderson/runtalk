class Photo < ActiveRecord::Base
  attr_accessible :photo_url
  
  belongs_to :message
end
