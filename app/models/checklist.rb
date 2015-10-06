class Checklist < ActiveRecord::Base
  belongs_to :trip
  has_many :list_items
  
end
