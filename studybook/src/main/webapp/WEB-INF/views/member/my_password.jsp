<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>update password</title>

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
	line-height: 43px;
	background-color: #9f9f9f;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	border: none;
	cursor: pointer;
}

.s_submit:hover {
	opacity:70%;
}

input[type=checkbox] {
	background: #ffffff;
}

.pwmsg, .pwcheckmsg {
	font-size:12px;
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
	margin-bottom: 5px;
}

.msg {
	font-size:10px;
	color:crimson;
}


.height {
	width: 330px;
	height: 70px;
}

img {
	width:15px;
	margin-left:10px;
}

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

   $(document).ready(function() {
	   	var passwordtest = /^[0-9a-zA-Z]{6,20}$/;
	   	
	   	$('#password').blur(function() {
			if (passwordtest.test($(this).val())) {
				console.log(passwordtest.test($(this).val()));
				$('.pwmsg').html('<img src=resources/image/check.png>');
			} else {
				$('.pwmsg').text('! 숫자, 영문 대/소문자로 총 6자 이상 입력해주세요.');
				$('.pwmsg').css('color', 'crimson');
			}
		});

		$('#pwcheck').on('keyup', function() {
			if ($('#password').val() != $('#pwcheck').val()) {
				$('.pwcheckmsg').text('! 비밀번호가 일치하지 않습니다.');
				$('.pwcheckmsg').css('color', 'crimson');
			} else {
				$('.pwcheckmsg').html('<img src=resources/image/check.png>');
			}

		});   
	});
   
</script>


</head>
<body>

<p class=s_title>비밀번호 변경</p>
<br><br><br>
	<div class="s_container">
	
		<form name="updatepwform" action="passwordProcess.mem" method="get">

			<div class="row height">
				<div class="col-100">
					<input type="password" id="password" class="s_input"
						name="password" placeholder="새 비밀번호 입력">
				</div>
				<div class="col-100 message">
					<span class="pwmsg msg"></span>
				</div>
			</div>
			<div class="row height">
				<div class="col-100">
					<input type="password" id="pwcheck" class="s_input" name="pwcheck"
						placeholder="새 비밀번호 확인">
				</div>
				<div class="col-100 message">
					<span class="pwcheckmsg msg"></span>
				</div>
			</div>

			 
			<div class="row">
				<div class="col-100"> 
					<input type="submit" class="s_submit clear" value="확인">
				</div>
			</div>
		</form>
	</div>



</body>
</html>