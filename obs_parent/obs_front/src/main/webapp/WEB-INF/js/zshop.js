$(function(){
    //用户名密码登陆和短信登陆的切换
    $('#btn-sms-back').click(function(){
        $('#login-account').css('display','none');
        $('#login-sms').css('display','block');
    });
    $('#btn-account-back').click(function(){
        $('#login-sms').css('display','none');
        $('#login-account').css('display','block');
    });
    
});

/* Quickview-active active */
$('.quickview-active').owlCarousel({
    loop: true,
    autoplay: false,
    autoplayTimeout: 5000,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
    nav: true,
    item: 3,
    margin: 12,
})

/*--------------------------
   Tab active
   ---------------------------- */
var ProductDetailsSmall = $('.product-details-small a');
ProductDetailsSmall.on('click', function(e) {
    e.preventDefault();
    var $href = $(this).attr('href');
    ProductDetailsSmall.removeClass('active');
    $(this).addClass('active');
    $('.product-details-large .tab-pane').removeClass('active');
    $('.product-details-large ' + $href).addClass('active');
})