$ ->
  cateringMenu = ->
    #Add Inactive Class To All Accordion Headers
    $(".accordion-header").toggleClass "inactive-header"

    #Set The Accordion Content Width
    contentwidth = $(".accordion-header").width()
    $(".accordion-content").css width: contentwidth

    #Open The First Accordion Section When Page Loads
    $(".accordion-header").first().toggleClass("active-header").toggleClass "inactive-header"
    $(".accordion-content").first().slideToggle().toggleClass "open-content"

    # The Accordion Effect
    $(".accordion-header").click ->
      if $(@).is(".inactive-header")
        $(".active-header").toggleClass("active-header").toggleClass("inactive-header").next().slideToggle().toggleClass "open-content"
        $(@).toggleClass("active-header").toggleClass "inactive-header"
        $(@).next().slideToggle().toggleClass "open-content"
      else
        $(@).toggleClass("active-header").toggleClass "inactive-header"
        $(@).next().hide().toggleClass "open-content"


  testimonials = ->
    $("#testimonials1").cycle
      fx: "fade" # choose your transition type, ex: fade, scrollUp, scrollRight, shuffle

  slideshow = ->
    Page = (->
      $navArrows = $("#nav-arrows").hide()
      $navOptions = $("#nav-options").hide()
      $shadow = $("#shadow").hide()
      slicebox = $("#sb-slider").slicebox(
        onReady: ->
          $navArrows.show()
          $navOptions.show()
          $shadow.show()

        orientation: "h"
        cuboidsCount: 3
      )
      init = ->
        initEvents()

      initEvents = ->

        # add navigation events
        $navArrows.children(":first").on "click", ->
          slicebox.next()
          false

        $navArrows.children(":last").on "click", ->
          slicebox.previous()
          false

        $("#navPlay").on "click", ->
          slicebox.play()
          false

        $("#navPause").on "click", ->
          slicebox.pause()
          false


      init: init
    )()
    Page.init()

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
    $('#side_home, #mini_logo').bind 'click', (e) ->
      e.preventDefault()
      $("html, body").animate
        scrollTop: 0, "slow", ->
          $('#content_row').empty()

  menuLinks = ['menu', 'photos', 'contact', 'testimonials']

  sideMenuAction = (item) ->
    sideHomeHandler()
    $("##{item}_side").bind 'click', (e) ->
      e.preventDefault()
      $('#content_container').empty()
      $.get "/#{item}", (data) ->
        $(data).appendTo($('#content_container'))
        if item == 'menu'
          cateringMenu()
        if item == 'photos'
          slideshow()
        if item == 'contact'
          contactHandler()
        if item == 'testimonials'
          testimonials()
      $("html, body").animate
        scrollTop: $(document).height(), "slow"

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
        $content.css('margin-top', '2000px').css('text-align', 'center').css('margin-bottom', '100px')
        $.get "/#{item}", (data) ->
          $(data).appendTo($('#content_container'))
          sideMenuHandler()
          if item == 'menu'
            cateringMenu()
          if item == 'photos'
            slideshow()
          if item == 'contact'
            contactHandler()
          if item == 'testimonials'
            testimonials()
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
      $form = $(@)
      $("#contact_info").hide()
      $submitButton = $form.find('button')
      $submitButton.html('Sending...')
      $submitButton.attr("disabled", "disabled").addClass("disabled")
      $.ajax
        type: 'POST',
        url: '/contact',
        data: $form.serializeArray(),
        success: (data) ->
          $contentInfo = $("#contact_info")
          $contentInfo.html(data).slideToggle()
          $('#contact_form')[0].reset()
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
        error: (data) ->
          $submitButton.html("Send")
          $submitButton.removeAttr("disabled").removeClass("disabled")
          alert('email fail try again')
