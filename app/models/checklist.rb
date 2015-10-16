class Checklist < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  has_many :list_items, dependent: :destroy
  validates :title, presence: true
end
