class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :trips, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :first_name, :last_name, :birth_date, :phone_number, :gender, presence: true
  has_attached_file :avatar, styles: { medium: "230x230=", thumb: "100x100>" },
   default_url: "/images/:style/missing.png",
   :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: "key_id",
        aws_secret_access_key: "access_key"
    },
    fog_directory: "rails-demo-env"


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
