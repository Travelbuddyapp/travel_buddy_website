class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :reservations, dependent: :destroy
  serialize :ice_id
  validates :name, presence: true
  
end
