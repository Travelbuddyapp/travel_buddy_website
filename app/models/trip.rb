class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one :contact
  validates :name, presence: true
  delegate :lodgings, :travels, :vehicles, :dinings, :activities, :events, :others, to: :reservations
  
  def ice_name
    contact == nil ? "Not Set" : contact.name
  end
  
end
