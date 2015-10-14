$(document).ready(function() {
  $('.new-trip-link').click(function(){
    var user_id = $(this).data('user-id');
    window.location = '/users/' + user_id + '/trips/new'
  });

  $('.show-trip-link').click(function(){
    var user_id = $(this).data('user-id');
    var contact_id = $(this).data('contact-id');
    window.location = '/users/' + user_id + '/trips/' + contact_id
  });
})
