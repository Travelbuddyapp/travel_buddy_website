class Vehicle < Reservation
  def reserve
    'We have recorded your vehicle reservation.'
  end

  def icon 
    '<i class="fa fa-car"></i>'
  end
end