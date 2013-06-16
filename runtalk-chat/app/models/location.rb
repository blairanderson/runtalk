class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :accuracy

  belongs_to :message
end
