<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../main/header.jsp" flush="false" />
<script> 
$(document).ready(function(){
	var mainheight = $('main').height();
	var navheight = 150px;
	if(($(window).height() - navheigt) < mainheight) {
		$('footer').css({
			'position' : fixed, 
			'bottom' : 0
		}) 
	} 
})	  
</script>
<style>
footer{height: 150px;}
</style>
</head>
<body>

	<!-- Body Start -->
	<main>		
		<jsp:include page="notice_write.jsp" />
	</main>
	<!-- Body End -->

	<!-- Footer Start -->
	<footer>
		<jsp:include page="../main/footer.jsp" flush="false" />
	</footer>
	<!-- Footer End -->
</body>
</html>