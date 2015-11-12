class Shelf < ActiveRecord::Base

  has_many :fanfics, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 140 }

end