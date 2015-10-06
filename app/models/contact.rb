class Contact < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  validates :name, presence: true
  
end
