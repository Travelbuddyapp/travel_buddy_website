class Activity < Reservation
  def reserve
    'We have recorded your activity reservation.'
  end
  def icon 
   '<i class="fa fa-map-signs"></i>'
  end
end