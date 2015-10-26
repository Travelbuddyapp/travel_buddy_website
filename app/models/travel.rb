class Travel < Reservation
  def reserve
    'We have recorded your travel reservation.'
  end
  def icon 
    '<i class="fa fa-plane"></i>'
  end
end