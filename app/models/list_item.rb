class ListItem < ActiveRecord::Base
  belongs_to :checklist
  validates :content, :completed, presence: true

end
