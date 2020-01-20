<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>

<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

.s_title { 
	margin-top: 250px; 
	margin-bottom: 25px;
	font-size: 32px;
	text-align: center;
} 

.text {
	margin-top: 7px;
	font-size: 12px;
	color: #555555;
	display: flex;
	justify-content: center;
}

.s_container {
	margin-top: 22px;
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
	margin-top: 18px;
	border: none;
	cursor: pointer;
}

.s_submit:hover {
	opacity: 70%;
}

.findpw {
	text-decoration: none;
}

.col-100 {
	width: 100%;
	margin-top: 15px;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
	.col-100 {
		width: 100%;
		margin-top: 15px;
	}
}


</style>

<script>

</script>


</head>
<body>

	<p class=s_title>비밀번호 찾기</p>
	<p class=text>회원가입 시 등록한 이메일로</p>
	<p class=text>임시비밀번호를 보내드립니다.</p>
	<div class="s_container">
		<form name="findForm" action="findpw.mem" method="post">
			<div class="row">
				<div class="col-100">
					<input type="text" id="email" class="s_input" name="email" placeholder="이메일">
					<span class=emailmsg></span>
				</div>
			</div>

			
			<div class="row">
				<div class="col-100">
					<input type="submit" class="s_submit" value="제출">
				</div>
			</div>
			
		</form>
	</div>

</body>
</html>