class Reservation < ActiveRecord::Base
  belongs_to :trip
  has_one :address
  
end
