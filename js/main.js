$(function(){
    window.setInterval(
    function(){
        var nextView = $("span.blink").text() === '_' ? '\u00A0' : '_';
        $("span.blink").text(nextView);
    }
    , 800);
    
    $('.related').hover(
    function(){
        $(this).children('h3').addClass('hoverTitle');
    },
    function(){
        $(this).children('h3').removeClass('hoverTitle');
    } );
});