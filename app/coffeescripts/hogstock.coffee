$ ->
  slideshow = ->
    $("#slides").slidesjs
      width: 940
      height: 528
      play:
        active: true
        auto: true
        interval: 4000
        swap: true 

  menuLinks = ['home', 'menu', 'photos', 'testimonials', 'contact']
  $menu = $('#menu_holder')

  menuAction =  (item) ->
    $("##{item}").bind 'click', (e) ->
      e.preventDefault()
      $('#content_row').empty()
      $.get "/content", (data) ->
        $('#content_row').append(data)
        $content = $('#content')
        $content.css('margin-top', '2000px').css('text-align', 'center').css('margin-bottom', '30px')
        $.get "/#{item}", (data) ->
          $(data).appendTo($content)
          slideshow() if item == 'photos'
          $("html, body").animate
            scrollTop: $content.offset().top, "slow"
          $content.removeClass('hidden')

  menuAction(item) for item in menuLinks

  $menu.mouseover ->
    $(@).css('margin-top', '100px')
  $menu.mouseout ->
    $(@).css('margin-top', '50px')
