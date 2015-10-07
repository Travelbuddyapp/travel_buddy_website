class Vaccine < ActiveRecord::Base
  belongs_to :user
  # TODO: validates :name???, :date_given, presence: true

end
