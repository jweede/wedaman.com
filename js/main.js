$(function(){
    window.setInterval(
    function(){
        var nextView = $("span.blink").css('visibility') === 'hidden' ? 'visible' : 'hidden';
        $("span.blink").css('visibility', nextView);
    }
    , 800);
    
    $('.related').hover(
    function(){
        $(this).removeClass('hoverNoBorder');
        $(this).addClass('hoverBorder');
        $(this).children('h3').addClass('hoverTitle');
    },
    function(){ 
        $(this).removeClass('hoverBorder');
        $(this).addClass('hoverNoBorder');
        $(this).children('h3').removeClass('hoverTitle');
    }
    );
});