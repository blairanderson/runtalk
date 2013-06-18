class Photo < ActiveRecord::Base
  belongs_to :message

  validates_presence_of :filepicker_url
end
