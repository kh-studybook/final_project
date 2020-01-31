<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
</script>
<style>

</style>
</head>
<body>
	<!-- Header Start -->
	<nav>
		<jsp:include page="../admin/adheader.jsp" flush="false" /><br> <br>
	</nav>
	<!-- Header End -->

	<!-- Body Start -->
	<main>		
		<jsp:include page="notice_detail.jsp" />
	</main>
	<!-- Body End -->

	<!-- Footer Start -->
	<footer>
		<jsp:include page="../admin/adfooter.jsp" flush="false" />
	</footer>
	<!-- Footer End -->
</body>
</html>