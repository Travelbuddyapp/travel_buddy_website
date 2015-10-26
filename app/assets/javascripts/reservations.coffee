$(document).ready ->
  $('select').material_select()

  if $('#map').is(':visible')
    id = parseInt($('#map').data('reservationId'))
    $.ajax '/get_markers',
      type: 'GET'
      data: id: id
      success: (data) ->
        handler = Gmaps.build('Google')
        handler.buildMap {
          internal: id: 'map'
        }, ->
          markers = handler.addMarkers([ {
            'lat': data.hash[0].lat
            'lng': data.hash[0].lng
            'infowindow': data.hash[0].infowindow
          } ])
          handler.bounds.extendWith markers
          handler.fitMapToBounds()
          handler.getMap().setZoom(15)
      error: (data) ->
        console.log data