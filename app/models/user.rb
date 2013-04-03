class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :email, :password, :password_confirmation, :presence => true

  validates :email, :uniqueness => true

end