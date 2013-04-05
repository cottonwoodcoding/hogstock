$ ->
  menuLinks = ['home', 'menu', 'photos', 'testimonials', 'contact']
  $menu = $('#menu_holder')
  $content = $('#content')

  menuAction =  (item) ->
    $("##{item}").bind 'click', (e) ->
      e.preventDefault()
      $.get "/#{item}", (data) ->
        $content.html data
        $("html, body").animate
          scrollTop: $content.offset().top, "slow"
        $content.removeClass('hidden')

  menuAction(item) for item in menuLinks

  $menu.mouseover ->
    $(@).css('margin-top', '100px')
  $menu.mouseout ->
    $(@).css('margin-top', '50px')
