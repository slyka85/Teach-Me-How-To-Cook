 $(document).ready(function() {
    console.log("I'm in ");

$('.meal-photo').contenthover({
    overlay_background:'#000',
    overlay_opacity:0.8,
    effect:'slide',
    slide_speed:500,
    slide_direction:'left',
    onshow:function(){
        $('<div>Hover element shown</div>').appendTo($('#d6_log'));
    },
    onhide:function(){
        $('<div>Hover element hidden</div>').appendTo($('#d6_log'));
    }
});

// jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });


});



