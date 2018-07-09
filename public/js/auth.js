$(".register-box:not(.open)").on("click",function(){
     $(this).addClass("open");
});

$(".register-box .close").on("click",function(e){
     e.stopPropagation();
     $(".register-box").removeClass("open");
});