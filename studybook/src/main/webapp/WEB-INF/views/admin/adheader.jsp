<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>스터디북-관리자사이트</title>
<style>
* {
	font-family: "맑은 고딕";
}

.w_wrap {
	min-height: 900px;
}

.navbar-login {
	width: 305px;
	padding: 10px;
	padding-bottom: 0px;
}

.thumbnail1 {
	width: 30px;
	height: 30px;
	border-radius: 50%;
}

.thumbnail2 {
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

.mymenu {
	left: -200px;
}

.mysearch {
	margin-right: 20px;
}

* {
	font-family: "맑은 고딕";
}

.tag_strong {
	color: white;
}

.w_bgcolor {
	background: #7F56D2
}


</style>
<nav class="navbar navbar-expand-lg navbar-dark w_bgcolor">
	<a class="navbar-brand" href="RoomList.ro">STUDYBOOK</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="RoomList.ro">Home </a></li>
			<li class="nav-item"><a class="nav-link"
				href="javascript:void(0);"
				onclick="javascript:location.href='RoomList.ro'">공간관리</a></li>
			<li class="nav-item"><a class="nav-link" href="FoodAdList.re">음식관리</a></li>
			<li class="nav-item"><a class="nav-link" href="ReserveAdList.re">예약관리</a></li>
			<li class="nav-item"><a class="nav-link" href="MemberList.bo">회원관리</a></li>
			<li class="nav-item"><a class="nav-link" href="NoticeList.bo">공지사항</a>
			</li>
		</ul>
		<%-- <c:if test="${member.key==0}">
			<script>
				location.href = "main.net";
			</script>
		</c:if> --%>

		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item"><a class="nav-link loginbtn"
				href="logout.mem">(${member.name}) 로그아웃</a></li>
		</ul>


	</div>
</nav>
<script>
	
</script>