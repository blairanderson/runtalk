class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :email, :password, :password_confirmation

  has_one :profile

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  validates_presence_of :email, :username
  validates_uniqueness_of :username, :email

  after_create :build_user_profile

  def build_user_profile
    create_profile(name: username, email: email)  
  end

end
