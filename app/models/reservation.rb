class Reservation < ActiveRecord::Base
  belongs_to :trip
  has_one :address, dependent: :destroy
  validates :type, presence: true
  # validates_presence_of :name

  def self.races
    %w(Lodging Travel Vehicle Dining Activity Event Other)
    # Not sure if being too general or too specific above?
    # Also is it too formal? too vague? Dining or restaurant?
    # TODO: check if Events and Activities is plural or singular?
  end

  #scopes
  def self.lodgings
    where(race: 'Lodging')
  end

  def self.travels
    where(race: 'Travel')
  end

  def self.vehicles
    where(race: 'Vehicle')
  end

  def self.dinings
    where(race: 'Dining')
  end

  def self.activities
    where(race: 'Activity')
  end

  def self.events
    where(race: 'Event')
  end

  def self.others
    where(race: 'Other')
  end
  
end
