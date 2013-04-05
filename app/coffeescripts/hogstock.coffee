$ ->
  menuLinks = ['#home', '#menu', '#photos', '#testimonials', '#contact']
  
  for selector in menuLinks
    $(selector).bind 'click', (e) ->
      e.preventDefault()
      $("html, body").animate
        scrollTop: $("#content").offset().top, "slow"
    $(selector).mouseover ->
      $('#menu').css('margin-top', '100px')
    $(selector).mouseout ->
      $('#menu').css('margin-top', '50px')
