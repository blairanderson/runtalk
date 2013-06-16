class Chat < ActiveRecord::Base
  attr_accessible :name, :slug

  validates_uniqueness_of :name, :slug
  
  has_many :messages
  
  def to_param
    slug
  end
end
