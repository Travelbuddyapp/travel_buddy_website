class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :reservations, dependent: :destroy
  serialize :ice_id
  validates :name, presence: true
  # accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['address'].blank? }
  
end
