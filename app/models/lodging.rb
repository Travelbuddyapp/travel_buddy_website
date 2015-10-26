class Lodging < Reservation
  def reserve
    'We have recorded your lodging reservation.'
  end
  def icon 
    '<i class="material-icons">hotel</i>'
  end
end