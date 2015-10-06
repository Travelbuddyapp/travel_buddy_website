class Document < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
  
end
