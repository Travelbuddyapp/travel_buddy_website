class Reservation < ActiveRecord::Base
  belongs_to :trip
  has_one :address, dependent: :destroy
  validates :type, presence: true
  
end
