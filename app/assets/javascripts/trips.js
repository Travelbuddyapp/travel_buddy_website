$(document).ready(function() {
  $('.new-trip-link').click(function(){
    window.location = '/trips/new'
  });

  $('.show-trip-link').click(function(){
    var trip_id = $(this).data('trip-id');
    window.location = '/trips/' + trip_id
  });
})
