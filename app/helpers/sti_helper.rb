module StiHelper
  # Returns a dynamic path based on the provided parameters
  def sti_reservation_path(trip, type = "reservation", reservation = nil, action = nil)
    send "#{format_sti(action, type, reservation)}_path", trip, reservation
  end

  def format_sti(action, type, reservation)
    action || reservation ? 
    "#{format_action(action)}#{type.underscore}" : 
    "trip_#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_trip_" : "trip_"
  end
end