// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var $menu, item, menuAction, menuLinks, _i, _len;
    menuLinks = ['home', 'menu', 'photos', 'testimonials', 'contact'];
    $menu = $('#menu_holder');
    menuAction = function(item) {
      return $("#" + item).bind('click', function(e) {
        e.preventDefault();
        return $.get("/content", function(data) {
          var $content;
          $('#content_row').append(data);
          $content = $('#content');
          $content.css('margin-top', '2000px').css('text-align', 'center');
          return $.get("/" + item, function(data) {
            $(data).appendTo($content);
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
