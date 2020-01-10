<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>login</title>
  
<script>

	$(function(){  
		
		$(".join").click(function(){
			location.href="join.mem";
		}); 
		
		$(".findpw").click(function(){
			location.href="login_findpw.mem";
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
		<label class=floatl><input type=checkbox>아이디 기억하기</label><span class="floatr findpw">비밀번호 찾기</span>
			<button type="submit" class="submitbtn">로그인</button>			
		</div>
		
		<span class=clear>studybook 방문이 처음이신가요?</span> <span class="clear join">회원가입</span>
	</form>
	
</body>
</html>