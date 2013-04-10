// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var $menu, buildThumbs, item, makeScrollable, menuAction, menuLinks, thumbClickHandler, _i, _len;
    $(window).resize(function() {
      return makeScrollable();
    });
    buildThumbs = function() {
      var $list;
      $list = $("#st_nav");
      return $list.children("li.album").each(function() {
        var $elem, $thumbs, $thumbs_wrapper, finalW;
        $elem = $(this);
        $thumbs_wrapper = $elem.find(".st_thumbs_wrapper");
        $thumbs = $thumbs_wrapper.children(":first");
        finalW = $thumbs.find("img").length * 183;
        $thumbs.css("width", finalW + "px");
        return makeScrollable($thumbs_wrapper, $thumbs);
      });
    };
    thumbClickHandler = function() {
      return $("#st_nav").find(".st_thumbs img").bind("click", function() {
        var $this;
        $this = $(this);
        return $("<img class=\"st_preview\"/>").load(function() {
          var $currImage;
          $this = $(this);
          $currImage = $("#st_main").children("img:first");
          $this.insertBefore($currImage);
          return $currImage.fadeOut(0, function() {
            return $(this).remove();
          });
        }).attr("src", $this.attr("alt"));
      }).bind("mouseenter", function() {
        return $(this).stop().animate({
          opacity: "1"
        });
      }).bind("mouseleave", function() {
        return $(this).stop().animate({
          opacity: "0.7"
        });
      });
    };
    makeScrollable = function($outer, $inner) {
      var divWidth, extra, lastElem;
      extra = 800;
      divWidth = $outer.width();
      $outer.css({
        overflow: "hidden"
      });
      lastElem = $inner.find("img:last");
      $outer.scrollLeft(0);
      return $outer.unbind("mousemove").bind("mousemove", function(e) {
        var containerWidth, left;
        containerWidth = lastElem[0].offsetLeft + lastElem.outerWidth() + 5 * extra;
        left = (e.pageX - $outer.offset().left) * (containerWidth - divWidth) / divWidth - extra;
        return $outer.scrollLeft(left);
      });
    };
    menuLinks = ['home', 'menu', 'photos', 'testimonials', 'contact'];
    $menu = $('#menu_holder');
    menuAction = function(item) {
      return $("#" + item).bind('click', function(e) {
        e.preventDefault();
        $('#content_row').empty();
        return $.get("/content", function(data) {
          var $content;
          $('#content_row').append(data);
          $content = $('#content');
          $content.css('margin-top', '2000px').css('text-align', 'center').css('margin-bottom', '30px');
          return $.get("/" + item, function(data) {
            $(data).appendTo($content);
            if (item === 'photos') {
              buildThumbs();
              thumbClickHandler();
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
    $menu.mouseover(function() {
      return $(this).css('margin-top', '100px');
    });
    return $menu.mouseout(function() {
      return $(this).css('margin-top', '50px');
    });
  });

}).call(this);
