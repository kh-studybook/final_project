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
});