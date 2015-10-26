class Other < Reservation
  def reserve
    'We have recorded your other reservation.'
  end
  def icon 
    '<i class="fa fa-optin-monster"></i>'
  end
end