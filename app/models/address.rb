class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservation
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
  
end
