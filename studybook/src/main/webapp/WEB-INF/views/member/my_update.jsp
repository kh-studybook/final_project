<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../room/header.jsp"/>
	<script>
		$(function(){
			
			var checkemail=true;
			$("input:eq(6)").on("keyup",function(){
				$("#email_message").empty();
							//+잇으면 무조건 한개 이상 , 뒤에는 반드시3개
				var pattern =/^\w+@\w+[.]\w{3}$/;
				var email=$("input:eq(6)").val();
				console.log(email)
				console.log(pattern.test(email))
				if(!pattern.test(email)){
					$("#email_message").css("color","red")
										.html("이메일 형식이 맞지 않습니다.");
					checkemail=false;
				}else{
					$("#email_message").css("color","green")
										.html("이메일 형식에 맞습니다.");
					checkemail=true;
				}
			});
			
			var pandan='${member.gender}';
			if(pandan=='남'){
				$("input:radio").eq(0).attr('checked','checked');
			}else{
				$("input:radio").eq(1).attr('checked','checked');
			}
			
			$(".cancelbtn").click(function(){
				history.back();
			});
			
		});
	</script>
</head>
<body>
	<form name="updateform" action="updateProcess" method="post">
		<h1>프로필 관리</h1>
		
		<img src="">
		<button>프로필 사진 변경</button>
		
		<hr>

		<b>이름</b>
		<input type="text" name="name" maxlength=15 value="${member.name }">
		
		<b>이메일 주소</b>
		<input type="text" name="email" placeholder="Enter Email"  value="${member.email }">
		<span id="email_message"></span>
		
		<b>연락처</b>
		<input type="text" name="tel" maxLength="12" value="${member.tel }">
		<span id="message"></span>
		
		<b>비밀번호</b>
		<input type="password" name="password" value="${member.password }">

		<hr>

		<div>
		<a href=#>계정 삭세하기</a>
		</div>
	</form>
</body>
</html>