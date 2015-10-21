class Document < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :attachment, presence: true
  has_attached_file :attachment,
    :url  => ":s3_domain_url",
    :path => "public/documents/:id/:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCES_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]
      
  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
