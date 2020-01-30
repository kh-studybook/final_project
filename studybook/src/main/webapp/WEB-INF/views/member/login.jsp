<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>

<script src="resources/js/bootstrap.js"></script>

<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

.s_title { 
	margin-top: 200px;  
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}

.s_input {
	width: 330px;
	height: 35px;
	padding-left: 20px;
	border: 1px solid #555555;
	resize: vertical;
	color: #7F7F7F;
	font-size: 12px;
}

.s_submit {
	width: 330px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 20px;
	border: none;
	cursor: pointer;
}

.s_submit:hover {
	opacity: 70%;
}

input[type=checkbox] {
	background:#ffffff;	
}

.findpw {
	text-decoration: none;
}

.findpw:hover {
	text-decoration: none;
}

.col-100 {
	width: 100%;
	margin-top: 15px;
}

/* Responsive layout 
- when the screen is less than 600px wide, 
make the two columns stack on top of each other 
instead of next to each other */
@media screen and (max-width: 700px) {
	.col-100 {
		width: 100%;
		margin-top: 15px;
	}
}


.floatl {
	float:left;
	font-size: 12px;
	color: #555555;
}

.floatr {
	float:right;
	font-size: 12px;
	color: #555555;
}

.clear {
	clear:both;
}

.join {
	color: #7F56D2;
	font-weight : bolder;
	cursor: pointer;
	margin-left:20px;
}

.join:hover {
	color:#56D7D6;
}

#success_message{ display: none;}

</style>

<script>
	$(function() {

		$(".join").click(function() {
			location.href = "join.mem";
		})

		$(".findpw").click(function() {
			location.href = "findpw.mem";
		}) 
	});
		
</script>


</head>
<body>

	<p class=s_title>로그인</p>




	<div class="s_container">
		<form name="loginform" action="loginProcess.mem" method="post">
		
		
			<div class="row">
				<div class="col-100">
					<input type="text" id="email" class="s_input" name="email" placeholder="이메일">
					<span class=emailmsg></span>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-100">
					<input type="password" id="password" class="s_input" name="password" placeholder="비밀번호">
					<span class=passwordmsg></span>	
				</div>
			</div>

			<div class="row">
				<div class="col-100">
					<label for=remember id=remember class="remember floatl"><input type="checkbox">로그인 기억하기</label> 
					
					<a href=# class="findpw floatr">비밀번호 찾기</a>
				</div>
			</div>
			
			<div class="row">
				<div class="col-100">
					<input type="submit" class="s_submit clear" value="로그인">
				</div>
			</div>
			
			<div class="row">
				<div class="col-100" style="text-align:center; margin-top:25px;">
					<span class="wannajoinus">스터디북 방문이 처음이신가요?</span><span class="join">회원가입</span>
				</div>
			</div>
		</form>
	</div>

</body>
</html>