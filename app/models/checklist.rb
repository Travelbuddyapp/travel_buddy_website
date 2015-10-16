class Checklist < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  has_many :list_items, dependent: :destroy
  validates :title, presence: true
    accepts_nested_attributes_for :list_items, allow_destroy: true , reject_if: proc { |attributes| attributes['list_items'].blank? }
  
end
