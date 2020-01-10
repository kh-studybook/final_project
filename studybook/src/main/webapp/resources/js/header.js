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
	
});