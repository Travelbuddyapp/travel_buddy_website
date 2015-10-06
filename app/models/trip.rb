class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists
  has_many :contacts
  has_many :reservations
  
end
