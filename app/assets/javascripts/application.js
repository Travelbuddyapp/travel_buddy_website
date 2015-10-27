// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require react
//= require react_ujs
//= require components
//= require select2
//= require Chart
//= require underscore
//= require gmaps/google
//= require_tree .
//= require cocoon

$(document).ready(function() {
   // navbar
  $(".button-collapse").sideNav({
    menuWidth: 300
  });

  // update completed? for list item
  $('.completed').click(function() {
    var checked = $(this).prop('checked');
    var item_id = $(this).attr('id');
    var trip_id = $(this).data('trip-id');
    var checklist_id = $(this).data('checklist-id');
    var url = '/trips/' + trip_id + '/checklists/' + checklist_id + '/list_items/' + item_id
    var content = $(this).siblings('.flow-text').html();
    $.ajax(url, {
      type: 'PUT',
      data: { list_item: { completed: checked }},
      success: function(data) {
        if ( checked == true)
        {
          var msg = content + " has been checked"
          Materialize.toast(msg, 3000, 'rounded')
        }
        else 
        {
          var msg = content + " has been unchecked"
          Materialize.toast(msg, 3000, 'rounded')
        }
      },
      error: function(data) {
        Materialize.toast(data, 3000, 'rounded')
      }
    });
  });

  // materialize date-picker
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 100
  });

  // materialize tabs 
  $('ul.tabs').tabs();

  // Open attachments in a new tab
  $('a[rel="external"]').click(function() {
    window.open($(this).attr('href'));
    return false;
  });

  $('.parallax').parallax();       
});