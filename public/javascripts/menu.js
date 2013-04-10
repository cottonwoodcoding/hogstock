$(function() {
    var raise = '100px';
    var width = '170px';
    var height = '170px';
    var wrap_height = '70px';
    $('#sdt_menu > li').bind('mouseenter',function(){
        var $elem = $(this);
        $elem.find('img')
             .stop(true)
             .animate({
                'width':width,
                'height':height,
                'left':'0px'
             },400,'easeOutBack')
             .andSelf()
             .find('.sdt_wrap')
             .stop(true)
             .animate({'top':raise},500,'easeOutBack')
             .andSelf()
             .find('.sdt_active')
             .stop(true)
             .animate({'height':wrap_height},300,function(){
            var $sub_menu = $elem.find('.sdt_box');
            if($sub_menu.length){
                var left = '170px';
                if($elem.parent().children().length == $elem.index()+1)
                    left = '170px';
                $sub_menu.show().animate({
                                  'left':left,
                                   'top': '20'
                },200);
            }   
        });
    }).bind('mouseleave',function(){
        var $elem = $(this);
        var $sub_menu = $elem.find('.sdt_box');
        if($sub_menu.length)
            $sub_menu.hide().css('left','0px');
         
        $elem.find('.sdt_active')
             .stop(true)
             .animate({'height':'0px'},300)
             .andSelf().find('img')
             .stop(true)
             .animate({
                'width':'0px',
                'height':'0px',
                'left':'85px'},400)
             .andSelf()
             .find('.sdt_wrap')
             .stop(true)
             .animate({'top':'25px'},500);
    });
});
