class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one :contact
  validates :name, presence: true
  # accepts_nested_attributes_for :addresses, reject_if: proc { |attributes| attributes['address'].blank? }
  
  def ice_name
    contact == nil ? "Not Set" : contact.name
  end
  
end
