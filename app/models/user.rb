class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_one :address, dependent: :destroy
  validates :first_name, :last_name, :birth_date, :phone_number, :gender, presence: true
  
end
