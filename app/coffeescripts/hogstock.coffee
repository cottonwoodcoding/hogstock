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
    $(".rslides").responsiveSlides()

  sideHomeHandler = ->
    $('#side_home').bind 'click', (e) ->
      e.preventDefault()
      $("html, body").animate
        scrollTop: 0, "fast", ->
          $('#content_row').empty()

  menuLinks = ['menu', 'photos', 'contact', 'testimonials']

  sideMenuAction = (item) ->
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
      slideHomeHandler()

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
