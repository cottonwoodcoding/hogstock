// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var cateringMenu, contactHandler, item, menuAction, menuLinks, sideHomeHandler, sideMenuAction, sideMenuHandler, slideshow, testimonials, _i, _len;
    cateringMenu = function() {
      var contentwidth;
      $(".accordion-header").toggleClass("inactive-header");
      contentwidth = $(".accordion-header").width();
      $(".accordion-content").css({
        width: contentwidth
      });
      $(".accordion-header").first().toggleClass("active-header").toggleClass("inactive-header");
      $(".accordion-content").first().slideToggle().toggleClass("open-content");
      return $(".accordion-header").click(function() {
        if ($(this).is(".inactive-header")) {
          $(".active-header").toggleClass("active-header").toggleClass("inactive-header").next().slideToggle().toggleClass("open-content");
          $(this).toggleClass("active-header").toggleClass("inactive-header");
          return $(this).next().slideToggle().toggleClass("open-content");
        } else {
          $(this).toggleClass("active-header").toggleClass("inactive-header");
          return $(this).next().hide().toggleClass("open-content");
        }
      });
    };
    testimonials = function() {
      return $(".bxslider").bxSlider({
        mode: "vertical",
        slideMargin: 3,
        auto: true
      });
    };
    slideshow = function() {
      return $(".rslides").responsiveSlides({
        auto: false,
        pager: false,
        nav: true,
        speed: 500,
        maxwidth: 800,
        namespace: "large-btns"
      });
    };
    sideHomeHandler = function() {
      return $('#side_home').bind('click', function(e) {
        e.preventDefault();
        return $("html, body").animate({
          scrollTop: 0
        }, "fast", function() {
          return $('#content_row').empty();
        });
      });
    };
    menuLinks = ['menu', 'photos', 'contact', 'testimonials'];
    sideMenuAction = function(item) {
      return $("#" + item + "_side").bind('click', function(e) {
        e.preventDefault();
        $('#content_container').empty();
        $.get("/" + item, function(data) {
          $(data).appendTo($('#content_container'));
          if (item === 'menu') {
            cateringMenu();
          }
          if (item === 'photos') {
            slideshow();
          }
          if (item === 'contact') {
            contactHandler();
          }
          if (item === 'testimonials') {
            return testimonials();
          }
        });
        $("html, body").animate({
          scrollTop: $(document).height()
        }, "slow");
        return slideHomeHandler();
      });
    };
    sideMenuHandler = function() {
      var item, _i, _len;
      for (_i = 0, _len = menuLinks.length; _i < _len; _i++) {
        item = menuLinks[_i];
        sideMenuAction(item);
      }
      return $("#sdt_menu > li.skip-image").bind("mouseenter", function() {
        var $elem, $sub_menu, left;
        $elem = $(this);
        $sub_menu = $elem.find(".sdt_box");
        if ($sub_menu.length) {
          left = "170px";
          if ($elem.parent().children().length === $elem.index() + 1) {
            left = "170px";
          }
          return $sub_menu.show().animate({
            left: left,
            top: "20"
          }, 200);
        }
      }).bind("mouseleave", function() {
        var $elem, $sub_menu;
        $elem = $(this);
        $sub_menu = $elem.find(".sdt_box");
        if ($sub_menu.length) {
          return $sub_menu.hide().css("left", "0px");
        }
      });
    };
    menuAction = function(item) {
      return $("#" + item).bind('click', function(e) {
        e.preventDefault();
        $('#content_row').empty();
        return $.get("/content", function(data) {
          var $content;
          $('#content_row').append(data);
          $content = $('#content');
          $content.css('margin-top', '2000px').css('text-align', 'center').css('margin-bottom', '100px');
          return $.get("/" + item, function(data) {
            $(data).appendTo($('#content_container'));
            sideMenuHandler();
            if (item === 'menu') {
              cateringMenu();
            }
            if (item === 'photos') {
              slideshow();
            }
            if (item === 'contact') {
              contactHandler();
            }
            if (item === 'testimonials') {
              testimonials();
            }
            $("html, body").animate({
              scrollTop: $content.offset().top
            }, "slow");
            return $content.removeClass('hidden');
          });
        });
      });
    };
    for (_i = 0, _len = menuLinks.length; _i < _len; _i++) {
      item = menuLinks[_i];
      menuAction(item);
    }
    return contactHandler = function() {
      return $('#contact_form').bind('submit', function(e) {
        var $form, $submitButton;
        e.preventDefault();
        $form = $(this);
        $("#contact_info").hide();
        $submitButton = $form.find('button');
        $submitButton.html('Sending...');
        $submitButton.attr("disabled", "disabled").addClass("disabled");
        return $.ajax({
          type: 'POST',
          url: '/contact',
          data: $form.serializeArray(),
          success: function(data) {
            var $contentInfo;
            $contentInfo = $("#contact_info");
            $contentInfo.html(data).slideToggle();
            $('#contact_form')[0].reset();
            $submitButton.html("Send");
            return $submitButton.removeAttr("disabled").removeClass("disabled");
          },
          error: function(data) {
            $submitButton.html("Send");
            $submitButton.removeAttr("disabled").removeClass("disabled");
            return alert('email fail try again');
          }
        });
      });
    };
  });

}).call(this);
