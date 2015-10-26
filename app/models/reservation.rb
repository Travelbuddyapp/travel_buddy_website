class Reservation < ActiveRecord::Base
  belongs_to :trip
  has_one :address, dependent: :destroy
  validates :type, presence: true
  accepts_nested_attributes_for :address, allow_destroy: true , reject_if: proc { |attributes| attributes['address'].blank? }

  def self.types
    %w(Lodging Travel Vehicle Dining Activity Event Other)
    # Not sure if being too general or too specific above?
    # Also is it too formal? too vague? Dining or restaurant?
    # TODO: check if Events and Activities is plural or singular?
  end

  def self.by_type
    reservations = {}
    results = select('count(*) AS count, type')
              .group(:type)
    results.each do |r|
      reservations[r[:type]] = r[:count]
    end
    reservations
  end

  #scopes
  def self.lodgings
    where(type: 'Lodging')
  end

  def self.travels
    where(type: 'Travel')
  end

  def self.vehicles
    where(type: 'Vehicle')
  end

  def self.dinings
    where(type: 'Dining')
  end

  def self.activities
    where(type: 'Activity')
  end

  def self.events
    where(type: 'Event')
  end

  def self.others
    where(type: 'Other')
  end

  def reserve
    raise 'You need to override this method in your sub classes'
    'We have recorded your generic reservation.'
  end

  def self.most_recent
    
  end
  
end
