

 $(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });



    console.log("I'm in ");
    $('.meal-photo').contenthover({

    overlay_background:'#000',
    overlay_opacity:0.8,
    effect:'slide',
    slide_speed:500,
    slide_direction:'left'

});


// Show navigation bar on scroll

// $('.js-section-steps').waypoint(function(direction){
//     if (direction == "down") {
//         $('nav').addClass('sticky-nav');
//         $('div.wrapper').addClass('wrapper-black');
//     } else {
//         $('nav').removeClass('sticky-nav');
//         $('.logo-black').hide();
//     }
// }, { offset: '60px'
// });


});





