$ ->
  $(window).resize ->
    makeScrollable() if $("#st_nav").is(":visible")

  buildThumbs = ->
    $list = $("#st_nav")
    $list.children("li.album").each ->
      $elem = $(@)
      $thumbs_wrapper = $elem.find(".st_thumbs_wrapper")
      $thumbs = $thumbs_wrapper.children(":first")

      finalW = $thumbs.find("img").length * 183
      $thumbs.css "width", finalW + "px"

      makeScrollable $thumbs_wrapper, $thumbs

  thumbClickHandler = ->
    $("#st_nav").find(".st_thumbs img").bind("click", ->
      $this = $(@)
      $("<img class=\"st_preview\"/>").load(->
        $this = $(@)
        $currImage = $("#st_main").children("img:first")
        $this.insertBefore $currImage
        $currImage.fadeOut 0, ->
          $(@).remove()

      ).attr "src", $this.attr("alt")
    ).bind("mouseenter", ->
      $(@).stop().animate opacity: "1"
    ).bind "mouseleave", ->
      $(@).stop().animate opacity: "0.7"

  makeScrollable = ($outer, $inner) ->
    extra = 800

    #Get menu width
    divWidth = $outer.width()

    #Remove scrollbars
    $outer.css overflow: "hidden"

    #Find last image in container
    lastElem = $inner.find("img:last")
    $outer.scrollLeft 0

    #When user move mouse over menu
    $outer.unbind("mousemove").bind "mousemove", (e) ->
      containerWidth = lastElem[0].offsetLeft + lastElem.outerWidth() + 5 * extra
      left = (e.pageX - $outer.offset().left) * (containerWidth - divWidth) / divWidth - extra
      $outer.scrollLeft left

  sideHomeHandler = ->
    $('#side_home').bind 'click', (e) ->
      e.preventDefault()
      $("html, body").animate
        scrollTop: 0, "slow", ->
          $('#content_row').empty()

  menuLinks = ['home', 'menu', 'photos', 'contact', 'testimonials']

  sideMenuAction = (item) ->
    sideHomeHandler()
    $("##{item}_side").bind 'click', (e) ->
      e.preventDefault()
      $('#content_container').empty()
      $.get "/#{item}", (data) ->
        $(data).appendTo($('#content_container'))
        if item == 'photos'
          buildThumbs()
          thumbClickHandlers()

  sideMenuHandler = ->
    sideMenuAction(item) for item in menuLinks
    $("#sdt_menu > li.skip-image").bind("mouseenter", ->
      $elem = $(@)
      $sub_menu = $elem.find(".sdt_box")
      if $sub_menu.length
        left = "170px"
        left = "170px"  if $elem.parent().children().length is $elem.index() + 1
        $sub_menu.show().animate
          left: left
          top: "20"
        , 200
    ).bind "mouseleave", ->
      $elem = $(@)
      $sub_menu = $elem.find(".sdt_box")
      $sub_menu.hide().css "left", "0px"  if $sub_menu.length

  $menu = $('#menu_holder')

  menuAction = (item) ->
    $("##{item}").bind 'click', (e) ->
      e.preventDefault()
      $('#content_row').empty()
      $.get "/content", (data) ->
        $('#content_row').append(data)
        $content = $('#content')
        $content.css('margin-top', '2000px').css('text-align', 'center').css('margin-bottom', '30px')
        $.get "/#{item}", (data) ->
          $(data).appendTo($('#content_container'))
          sideMenuHandler()
          if item == 'photos'
            buildThumbs()
            thumbClickHandler()
          if item == 'contact'
            contactHandler()
          $("html, body").animate
            scrollTop: $content.offset().top, "slow"
          $content.removeClass('hidden')

  menuAction(item) for item in menuLinks

  $menu.mouseover ->
    $(@).css('margin-top', '100px')
  $menu.mouseout ->
    $(@).css('margin-top', '50px')

  contactHandler = ->
    $('#contact_form').bind 'submit', (e) ->
      e.preventDefault()
      $.post "/contact", (data) ->
        $('#contact_info').html(data)
