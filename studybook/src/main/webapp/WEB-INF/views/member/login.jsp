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
			location.href="join.mem";
		}); 
	});
</script>
</head> 
<body>

	<form name="loginform" action="loginProcess.mem" method="post">
		<h1>로그인</h1>
		<hr>
		<input type="text" name="email" id="email" placeholder="이메일" required>
		<input type="password" name="pw" id="pw" placeholder="비밀번호" required>
		<div class="clearfix">
			<button type="submit" class="submitbtn">로그인</button>			
		</div>
	</form>
	
</body>
</html>