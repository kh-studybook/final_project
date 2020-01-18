<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join success</title>
<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

.s_title {
	margin-top: 250px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	margin-top: 50px;
	text-align: center;
}

.s_content {
	font-size: 18px;
	margin: 20px;
}

.start {	
	width: 330px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 50px;
	border: none;
	cursor: pointer;
}

.start:hover {
	opacity: 70%;
}

</style>
<script>
	$(function() {

		$(".start").click(function() {
			location.href = "login.mem";
		});
	});
</script>

</head>
<body>
	<p class=s_title>환영합니다.</p>
	<div class=s_container>

		<div class=s_content>
			<span>천사요정공주님, 회원가입을 축하합니다.</span><br>
		</div>
		<div class=s_content>
			<span>지금부터 이메일 일단그냥@아무거나.com 으로</span><br>
		</div>
		<div class=s_content>
			<span>로그인 하실 수 있습니다.</span><br>
		</div>
		<div>
			<button class=start>시작하기</button>
		</div>

	</div>
</body>
</html>