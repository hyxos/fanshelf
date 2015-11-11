class User < ActiveRecord::Base

  has_many :shelves
  has_many :fanfics, :through => :shelves
  has_secure_password

end