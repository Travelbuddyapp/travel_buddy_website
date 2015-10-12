module StiHelper
  # Returns a dynamic path based on the provided parameters
  def sti_reservation_path(trip, type = "reservation", reservation = nil, action = nil, address = nil)
    address ?
    send "#{format_sti(action, type, reservation)}address_path", trip, reservation, address :
    send "#{format_sti(action, type, reservation)}_path", trip, reservation
  end
  # Not sure if need to pass in user_params? Also, on lines 3 and 6, 
  # is it just "trip," or is it "user_trip" or "user, trip,"?

  def format_sti(action, type, reservation)
    action || reservation ? 
    "#{format_action(action)}#{type.underscore}" : 
    "user_trip_#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_user_trip_" : "user_trip_"
  end
  #TODO: check comments on lines 8 and 9.
  #TODO: include _addresses inside this helper?
  #      or make a new helper when going down another level
  # Do we even need to go down another level?  Couldn't we
  # just show the address on the reservation show page?
  # We'd propably still need new/create, edit/update, and delete...

  #TODO: We may only need a simplified version(if any of this)
  #      if we unnest address from reservation and use JS to 
  #      make a dynamic form pop up on reservations page to allow
  #      CRUD on addresses related to reservations.
end