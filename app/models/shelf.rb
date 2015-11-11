class Shelf < ActiveRecord::Base

  has_many :fanfics
  belongs_to :user

end