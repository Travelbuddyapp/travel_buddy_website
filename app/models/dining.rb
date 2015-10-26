class Dining < Reservation
  def reserve
    'We have recorded your dining reservation.'
  end

  def icon 
    '<i class="fa fa-cutlery"></i>'
  end
end