<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>loginForm</title>
  
<link type="text/css" rel="stylesheet" href="resources/css/login.css" >

<script>
	$(function(){
		$(".join").click(function(){
			location.href="join.net";
		}); 
	});
</script>
</head>
<body>
	<form name="loginform" action="loginProcess.net" method="post">
		<h1>로그인</h1>
		<hr>
		<b>아이디</b>
		<input type="text" name="id" placeholder="Enter id" required>
		<b>Password</b>
		<input type="password" name="password" placeholder="Enter password" required>
		<div class="clearfix">
			<button type="submit" class="submitbtn">로그인</button>
			<button type="button" class="join">회원 가입</button>
		</div>
	</form>
</body>
</html>