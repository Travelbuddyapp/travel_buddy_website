class Event < Reservation
  def reserve
    'We have recorded your event reservation.'
  end
  def icon 
    '<i class="fa fa-calendar-check-o"></i>'
  end
end