class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :checklists, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one :contact
  validates :name, presence: true
  
  def ice_name
    contact.name
  end
  
end
