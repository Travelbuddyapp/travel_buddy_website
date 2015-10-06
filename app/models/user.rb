class User < ActiveRecord::Base
  has_many :trips
  has_many :vaccines
  has_many :documents
  has_many :contacts
  has_one :address
  
end
