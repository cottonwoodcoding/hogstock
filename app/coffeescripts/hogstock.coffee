$ ->
  menuLinks = ['home', 'menu', 'photos', 'testimonials', 'contact']
  $menu = $('#menu_holder')

  menuAction =  (item) ->
    $("##{item}").bind 'click', (e) ->
      e.preventDefault()
      $.get "/content", (data) ->
        $('#content_row').append(data)
        $content = $('#content')
        $content.css('margin-top', '2000px')
        $content.css('text-align', 'center')
        $.get "/#{item}", (data) ->
          $(data).appendTo($content)
          $("html, body").animate
            scrollTop: $content.offset().top, "slow"
          $content.removeClass('hidden')

  menuAction(item) for item in menuLinks

  $menu.mouseover ->
    $(@).css('margin-top', '100px')
  $menu.mouseout ->
    $(@).css('margin-top', '50px')
