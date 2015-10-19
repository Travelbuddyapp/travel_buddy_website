class Document < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :attachment, presence: true
  has_attached_file :attachment
  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
