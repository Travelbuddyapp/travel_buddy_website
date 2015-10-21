$ ->
  $('.alert').show ->
    setTimeout (->
      $('.alert').slideToggle()
      return
    ), 5000

$ ->
  $('.error').show ->
    setTimeout (->
      $('.error').slideToggle()
      return
    ), 4000

$ ->
  $('.notice').show ->
    setTimeout (->
      $('.notice').slideToggle()
      return
    ), 5000