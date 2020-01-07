<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<!-- 스크립트 import -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<!-- fontawesome css import -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />

<!-- Favicon -->
<link rel="shortcut icon" href="icons/cat_logo.jpg">

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css" />

<!-- js -->
<script src="resources/js/header.js"></script>

<!-- title -->
<c:if test="${!empty id }">
<title>StudyBook | ${id} </title>
</c:if>
<c:if test="${empty id }">
<title>StudyBook</title>
</c:if>
</head>

<body>
	<header id="j_header">
		<div class="j_header__column">
		</div>
		<div class="j_header__column">
			<span class="header__icon"> 
				<a href="Newsfeed.do"> 
					<img src="icons/cat_logo.jpg" />
				</a>
			</span>
		</div>
		<div class="j_header__column">
			<span id="j_menu_icon"> <i class="fas fa-bars"></i>
			</span>
		</div>
	</header>
	<div id="menu">
		<ul>
			<li><div class="menu" onClick="location.href='Newsfeed.do'">Newsfeed</div></li>
			<li><div class="menu" onClick="location.href='Search.do'">Search</div></li>
			<li><div class="menu" onClick="location.href='AddF.do'">Add</div></li>
			<li><div class="menu" onClick="location.href='Mypage.do'">My page</div></li>
			<li><div class="menu" onClick="location.href='logout.net'">Logout</div></li>
		</ul>
		<p id="copyright">
			<a href="#">
				&copy; Lightgram
			</a>
		<p>
	</div>
	<div id="moveTop">
		<img src="icons/arrow_up.png" />
	</div>
</body>
</html>