$(document).ready(function() {
  // click new card and redirect to new form
  $('.new-contact-link').click(function(){
    var id = $(this).data('user-id');
    window.location = '/users/' + id + '/contacts/new';
  });

  // click card and redirect to show view
  $('.show-contact-link').click(function(){
    var user_id = $(this).data('user-id');
    var contact_id = $(this).data('contact-id');
    window.location = '/users/' + user_id + '/contacts/' + contact_id;
  });
});
