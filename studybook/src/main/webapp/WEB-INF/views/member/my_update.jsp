<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
<!-- <jsp:include page="../main/header.jsp"/> -->
	<script>
		$(function(){
			 
			var emailcheck = true;
			$("#email").on("keyup",function(){
				$("#emailmsg").empty();

				var pattern = /^\w+@\w+[.]\w{3}$/;
				var email = $("#email").val();
				console.log(email)
				console.log(pattern.test(email))
				if(!pattern.test(email)) {
					$("#emailmsg").css("color","red").html("이메일 형식이 맞지 않습니다.");
					emailcheck = false;
				} else {
					$("#emailmsg").css("color","blue").html("이메일 형식에 맞습니다.");
					emailcheck = true;
				}
			});
			
		});
	</script>
	
</head>


<body> 
	<form name="updateform" action="updateProcess" method="post">
		<h1>프로필 관리</h1>
		
		<div class="profimg">
			<label> 
				<input type="file" name="uploadfile" accept="image/gif, image/jpeg, image/png" style="display: none">
				<img src="resources/image/profile/default.png" alt="Avatar" class="avatar">
			</label>
			<button>프로필 사진 변경</button>
		</div>
	<!-- 모달 띄우기 -->		
		<hr>

		<b>이름</b>
		<input type="text" name="name" id=name class=name maxlength=15 value="${member.name }">
		
		<b>이메일 주소</b>
		<input type="text" name="email" id=email class=email value="${member.email }">
		
		<b>연락처</b>
		<input type="text" name="phone" id=phone class=phone maxLength="12" value="${member.phone }">
		
		<b>비밀번호</b>
		<input type="password" name="password" id=password class=password value="${member.password }">

		<hr>

		<div>
		<a href=#>계정 삭제하기</a>
		</div>
	</form>
</body>
</html>