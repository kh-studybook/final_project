

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete member</title>


<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

.s_title {
	margin-top: 230px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_content {
	font-size: 14px;
	margin: 12px;
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
	width: 150px;
	height: 43px;
	line-height: 43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	margin-left:10px;
	border: none;
	cursor: pointer;
}

.s_reset {
	width: 150px;
	height: 43px;
	line-height: 43px;
	background-color: #56D7D6;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	border: none;
	cursor: pointer;
}

.s_submit:hover, .s_reset:hover {
	opacity: 70%;
}

input[type=checkbox] {
	background: #ffffff;
}


.col-100 {
	width: 100%;
	margin-bottom: 0px;
}

/* Responsive layout 
- when the screen is less than 600px wide, 
make the two columns stack on top of each other 
instead of next to each other */
@media screen and (max-width: 700px) {
	.col-100 {
		width: 100%;
		margin-bottom: 0px;
	}
}

.message {
	mergin-top: 2px;
}

.height {
	width: 330px;
	height: px;
}

.buttons {
	width: 330px;
	margin-top:100px;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function() {

	$(".s_submit").click(function() {
		location.href = "login.mem";
	});
	
	$(".s_reset").click(function() {
		location.href = "my_update.mem";
	});
	
});
</script>


</head>
<body>

	<p class=s_title>계정 삭제하기</p>
	<br>
	<br>
	<br>
	<div class="s_container">

		<form name="updatepwform" action="deleteProcess.mem" method="get">

			<div class="row height">
				<div class="col-100"> 
					<p class=s_content>${member.name}님,
					<p class=s_content>아래 삭제 버튼을 누르시면
					<p class=s_content>회원 정보와 예약 정보가 모두 삭제됩니다.
					<p class=s_content>계정 삭제를 진행하시겠습니까.
				</div>
			</div>

			<div class="row buttons">
				<div class="col-100">
					<input type="reset" class="s_reset clear" value="조금 더 고민해보기">
					<input type="submit" class="s_submit clear" value="삭제ㄱㄱ">
				</div>
			</div>
			
		</form>
	</div>



</body>
</html>