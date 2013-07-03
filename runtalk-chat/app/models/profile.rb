class Profile < ActiveRecord::Base
  attr_accessible :name, :email
  belongs_to :user
end
