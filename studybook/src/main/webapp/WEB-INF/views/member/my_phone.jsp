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

body {
	background-color: #f2f2f2;
	text-align: center;
}

.s_title {
	margin-top: 60px;
	margin-bottom: 67px;
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
	margin-top: 15px;
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

.phonenum {
	margin-bottom: 5px;	
	background-color: #e6e6e6;
	border-color:#e6e6e6;
}

.message {
	margin-top: 2px;
	height:15px;
} 

.phonemsg {
	font-size:12px;
}

.col-100 {
	width: 100%;
	margin-bottom: 5px;
}

.first {
	width: 100%;
	margin-bottom: 15px;
}

/* Responsive layout 
- when the screen is less than 600px wide 
make the two columns stack on top of each other 
instead of next to each other */
@media screen and (max-width: 700px) {
	.col-100 {
		width: 100%;
		margin-bottom: 0px;
	}
}




</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

   $(document).ready(function() {
	   
	   $("#phone").blur(function() {
		   
		   var phonetest = /^010?([0-9]{4})?([0-9]{4})$/;
		   
			if (phonetest.test($(this).val())) {
				console.log(phonetest.test($(this).val()));
				$(".phonemsg").text('변경 가능한 연락처입니다!');
				$('.phonemsg').css('color', '#7F56D2');
				$('.s_submit').attr('disabled', false);
				$('.s_submit').css('background', '#7F56D2');
			} else {
				$('.phonemsg').text('! 010으로 시작하는 11자리 숫자를 입력해주세요.');
				$('.phonemsg').css('color', 'crimson');
				$('.s_submit').attr('disabled', true);
			}
		}); 


});
   
</script>


</head>
<body>
<div class=outer_container>
	<div class="s_container">
	
<p class=s_title>연락처 변경</p>

<div class=formdiv>
	
		<form name="updatephoneform" action="phoneProcess.mem" method="get">

			<div class="row height">
				<div class="col-100 first">
					<input type="text" name="phonenum" id="phonenum" class="s_input phonenum"
						name="phone" placeholder="${member.phone}" maxLength="11" readOnly>
				</div>
				<div class="col-100">
					<input type="text" name="phone" id="phone" class="s_input"
						name="phone" placeholder="변경할 연락처 입력" maxLength="11" required>
				</div>
				<div class="col-100 message">
					<span class="phonemsg"></span>
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