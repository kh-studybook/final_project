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

body {
	background-color: #f2f2f2;
	text-align: center;
}

.s_title {
	margin-top: 60px;
	margin-bottom: 65px;
	font-size: 32px;
	text-align: center;
}

.s_content {
	font-size: 14px;
	margin: 12px;
	text-align: center;
}

.outer_container {
	display: flex;
	justify-content: center;
}


.s_container {
	margin-top: 115px;
	background-color: #ffffff;
	padding: 20px;
	width: 30%;
	min-width: 500px;
	margin-bottom: 10px;
}

.formdiv {
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
	margin-bottom: 120px;
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
	margin-bottom: 10px;
}

.col-100 .first {
	width: 100%;
	margin-bottom: 30px;
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
	margin-top: 0px;
	height: 15px;
}


.heght {
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
				$('.pwmsg').text('변경 가능한 비밀번호 입니다.');
				$('.pwmsg').css('color', '#7F56D2');
				$('.s_submit').attr('disabled', true);
			} else {
				$('.pwmsg').text('숫자, 영문 대/소문자로 총 6자 이상 입력해주세요.');
				$('.pwmsg').css('color', 'crimson');
				$('.s_submit').attr('disabled', true);
			}
		});

		$('#pwcheck').on('keyup', function() {
			if ($('#password').val() != $('#pwcheck').val()) {
				$('.pwcheckmsg').text('비밀번호가 일치하지 않습니다.');
				$('.pwcheckmsg').css('color', 'crimson');
				$('.s_submit').attr('disabled', true);
			} else {
				$('.pwcheckmsg').text('비밀번호가 일치합니다!');
				$('.pwcheckmsg').css('color', '#7F56D2');
				$('.s_submit').attr('disabled', false);
				$('.s_submit').css('background', '#7F56D2');
			} 
		});   
		
		   
		$(".s_submit").click(function() {
		if ($('#password').val() == "" || $('#pwcheck').val() == "") {
			$('.s_submit').attr('disabled', true);
		} else {
			$('.s_submit').attr('disabled', false);
		}
		});
		
	});
   
</script>


</head>
<body>

<div class=outer_container>
	<div class="s_container">
	

<p class=s_title>비밀번호 변경</p>

<div class=formdiv>

		<form name="updatepwform" action="passwordProcess.mem" method="get">

			<div class="row height">
				<div class="col-100 first">
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
					<div class=msgdiv>
					<span class="pwcheckmsg msg"></span>
					</div>
				</div>
			</div>

			 
			<div class="row">
				<div class="col-100"> 
					<input type="submit" class="s_submit clear" value="확인">
				</div>
			</div>
		</form>
</div>		
	</div>
</div>
</body>
</html>