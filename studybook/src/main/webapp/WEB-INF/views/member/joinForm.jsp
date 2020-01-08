<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>

<link type="text/css" rel="stylesheet" href="resources/css/join.css" >

</head>
<body>

<h2>회원가입</h2>
<span>이미 회원이신가요?</span> <a href=# class=login>로그인</a>

	<form name="joinform" action="joinProcess.net" method="post">
		 
		<input type="text" name="name" placeholder="이름" maxlength=15 required>	
		<span id="namemsg"></span>
		
		<input type="text" name="email" placeholder="이메일" required>
		<span id="emailmsg"></span>
		
		<input type="password" name="pw" placeholder="비밀번호" required>
		<span id="pwmsg"></span>
		 
		<input type="password" name="pwcheck" placeholder="비밀번호 확인" required>
		<span id="pwcheckmsg"></span>
		
		<input type="text" name="tel" placeholder="전화번호" required maxLength="12">
		<span id="telmsg"></span>		


		<input type="checkbox" name="priv"> 서비스 약관과 개인정보 보호정책에 동의합니다.
		
		<div class="clearfix">
			<button type="submit" class="submitbtn">회원가입</button>
		</div>
		
	</form>
</body>
</html>