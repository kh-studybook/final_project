<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
$(document).ready(function(){
	var mainheight = $('main').height();
	var navheight = $('nav').height();
	if(($(window).height() - navheigt) < mainheight) {
		$('footer').css({
			'position' : fixed,
			'bottom' : 0
		})
	}
})	
</script>
<style>
nav {height: 150px;}
footer{height: 150px;}
</style>
</head>
<body>
	<!-- Header Start -->
	<nav>
		<jsp:include page="header.jsp" flush="false" /><br> <br>
	</nav>
	<!-- Header End -->

	<!-- Body Start -->
	<main>		
		<jsp:include page="content.jsp" />
	</main>
	<!-- Body End -->

	<!-- Footer Start -->
	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
	<!-- Footer End -->
</body>
</html>