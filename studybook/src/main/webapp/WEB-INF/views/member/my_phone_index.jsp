<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- Header Start -->
	<nav>
		<jsp:include page="../main/header.jsp" flush="false" /><br> <br>
	</nav>
	<!-- Header End -->
	
	<!-- Body Start -->
	<main>		
		<jsp:include page="my_phone.jsp" />
	</main>
	<!-- Body End -->

	<!-- Footer Start -->
	<footer>
		<jsp:include page="../main/footer.jsp" flush="false" />
	</footer>
	<!-- Footer End -->
</body>

</html>