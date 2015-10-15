$(document).ready(function() {
  // click new card and redirect to new form
  $('.new-contact-link').click(function(){
    window.location = '/contacts/new';
  });

  // click card and redirect to show view
  $('.show-contact-link').click(function(){
    var contact_id = $(this).data('contact-id');
    window.location = '/contacts/' + contact_id;
  });
});
