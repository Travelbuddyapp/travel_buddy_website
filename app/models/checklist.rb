class Checklist < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  has_many :list_items, dependent: :destroy
  validates :title, presence: true
  accepts_nested_attributes_for :list_items, reject_if: :all_blank, allow_destroy: true
end
