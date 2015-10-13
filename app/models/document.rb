class Document < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  has_attached_file :attachment, styles: { medium: "230x230=", thumb: "100x100>" }
  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  
end
