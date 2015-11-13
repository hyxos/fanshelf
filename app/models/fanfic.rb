class Fanfic < ActiveRecord::Base

  belongs_to :shelf

  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :url, presence: true
end