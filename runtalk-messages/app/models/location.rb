class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :accuracy, :map_url
  belongs_to :message
end


