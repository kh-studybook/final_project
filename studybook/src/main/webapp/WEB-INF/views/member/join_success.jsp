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

body {
	background-color: #f2f2f2;
	text-align: center;
}

.s_title {
	margin-top: 50px;
	margin-bottom: 45px;
	font-size: 32px;
	text-align: center;
}

.s_content {
	font-size: 14px;
	margin: 12px;
	text-align: center;
}

.outer_container {
	display: flex;
	justify-content: center;
}

.s_container {
	margin-top: 115px;
	background-color: #ffffff;
	padding: 20px;
	width: 30%;
	min-width: 500px;
	margin-bottom: 10px;
}

.formdiv {
	display: flex;
    justify-content: center;
}

.start {	
	width: 320px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 50px;
	margin-bottom: 70px;
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

<div class=outer_container>
	<div class="s_container">
	
	
	<p class=s_title>환영합니다.</p>
	
<div class=formdiv>

<div class="row">
	<div class="col-100">
		<div class=s_content>
			<span>${name}님, 회원가입을 축하합니다.</span><br>
		</div>
		<div class=s_content>
			<span>지금부터 ${email}으로</span><br> 
		</div>
		<div class=s_content>
			<span>로그인 하실 수 있습니다.</span><br>
		</div>
		<div class=s_content>
			<span>StudyBook을 즐겨보세요!</span><br>
		</div>		
		<div>	
			<button class=start>시작하기</button>
		</div>	
	</div>		
</div>

</div>	

	
	</div>
</div>
	
</body>
</html>