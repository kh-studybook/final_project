<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>update pw</title>


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
	mergin-top: 2px;
}

.height {
	width: 330px;
	height: 70px;
}

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

   $(document).ready(function() {
	      
		$('#password').on('keyup', function() {
			$('.pwcheckmsg').html('');
		});

		$('#pwcheck').on('keyup', function() {
			if ($('#password').val() != $('#pwcheck').val()) {
				$('.pwcheckmsg').text('! 비밀번호가 일치하지 않습니다.');
				$('.pwcheckmsg').css('color', 'LightCoral');
				$('.s_submit').attr('disabled', true); 
			} else {
				$('.pwcheckmsg').text('비밀번호 일치');
				$('.pwcheckmsg').css('color', '#7F56D2');
				$('.s_submit').attr('disabled', false); 
				$('.s_submit').css('background', '#7F56D2');
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
					<span class="pwmsg"></span>
				</div>
			</div>
			<div class="row height">
				<div class="col-100">
					<input type="password" id="pwcheck" class="s_input" name="pwcheck"
						placeholder="새 비밀번호 확인">
				</div>
				<div class="col-100 message">
					<span class="pwcheckmsg"></span>
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