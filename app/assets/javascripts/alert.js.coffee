$ ->
  $('.alert').show ->
    setTimeout (->
      $('.alert').slideToggle()
      return
    ), 5000