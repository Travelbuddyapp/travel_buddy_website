# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if window.location.pathname.match(/\/trips\/\d+\/reservations/).length
    # labels = []
    reservationData = []
    id = parseInt(window.location.pathname.split("/trips/")[1].split("/")[0])
    $.ajax '/by_type',
      type: 'GET'
      data: trip_id: id
      success: (data) ->
        for type, count of data.reservations
          switch type
            when 'Lodging' then set = {value: count, color: "#517EA6", highlight: 'rgba(81,126,166,.1)', label: type}
            when 'Travel' then set = {value: count, color: "#AB2116", highlight: 'rgba(171,33,22,.1)', label: type}
            when 'Vehicle' then set = {value: count, color: "#5A6B75", highlight: 'rgba(90,107,117,.1)', label: type}
            when 'Dining' then set = {value: count, color: "#BC774C", highlight: 'rgba(188,119,76,.1)', label: type}
            when 'Activity' then set = {value: count, color: "#FDB45C", highlight: 'rgba(253,180,92,.1)', label: type}
            when 'Event' then set = {value: count, color: "#AB2116", highlight: 'rgba(171,33,22,.1)', label: type}
            when 'Other' then set = {value: count, color: "#5A6B75", highlight: 'rgba(90,107,117,.1)', label: type}
          reservationData.push(set)

        $('#reservations_by_type').empty()
        new Chart($("#reservations_by_type").get(0).getContext("2d")).Doughnut(reservationData)



