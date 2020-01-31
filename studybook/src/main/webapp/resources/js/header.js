$(document).ready(function(){
	var navheight = $('nav').height();
	$('main').css({
		margin: '0 auto -navheight'
	})
	
	$('.navbar-toggler').click(function(){
		$('main').css({
		margin: '0 auto -navheight'
		}) 
	})
	
	$('#menu_icon').click(function(){
		$('.menu').addClass('nav-expanded');
	})
	
	$('.close').click(function(){
		$('.menu').removeClass('nav-expanded');
	})
	
	/*
	$('html').click(function(e) {
		if($('.menu').hasClass('nav-expanded')){
			if(!$(e.target).hasClass("menu")) { 
				$('.menu').removeClass('nav-expanded');
			}
		}
	});
	*/
	
	// 타겟영역을 제외하고 클릭했을 시 팝업 숨김처리.
	$('body').on('click', function(e){
	    var $tgPoint = $(e.target);
	    var $popCallBtn = $tgPoint.hasClass('JS-popup-btn')
	    var $popArea = $tgPoint.hasClass('popup-box')
	 
	    if ( !$popCallBtn && !$popArea ) {
	        $('.popup-box').removeClass('view');
	    }
	});
});