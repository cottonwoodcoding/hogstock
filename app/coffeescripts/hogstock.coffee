$ ->
  menuLinks = ['#home', '#menu', '#photos', '#testimonials', '#contact']
  
  menuLinks.each ->
    $(@).bind 'click, hover', (e) ->
      e.prevenDefault()
      $('#menu').css('margin-top', '100px')
