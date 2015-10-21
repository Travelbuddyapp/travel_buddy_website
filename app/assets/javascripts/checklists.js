$(document).ready(function(){
  $('.new-checklist-link').click(function(){
    var trip_id = $(this).data('trip-id');
    window.location = '/trips/' + trip_id + '/checklists/new';
  });

  $('.show-checklist-link').click(function(){
    var trip_id = $(this).data('trip-id');
    var checklist_id = $(this).data('checklist-id');
    window.location = '/trips/' + trip_id + '/checklists/' + checklist_id
  });

  $('.new-reservation-link').click(function(){
    var trip_id = $(this).data('trip-id');
    window.location = '/trips/' + trip_id + '/reservations/new';
  });
});
