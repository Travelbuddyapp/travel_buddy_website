class ListItem < ActiveRecord::Base
  belongs_to :checklist
  validates :content, presence: true

end
