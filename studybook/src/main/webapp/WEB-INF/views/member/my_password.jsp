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
	line-height:43px;
	background-color: #9f9f9f;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	border: none;
	cursor: pointer;
}

input[type=checkbox] {
	background:#ffffff;	
}

.findpw {
	text-decoration: none;
}

.col-100 {
	width: 100%;
	margin-bottom: 30px;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
	.col-100 {
		width: 100%;
		margin-bottom: 30px;
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


.schonangemeldet {
	margin-bottom: 40px;
	font-size: 12px;
	color: #555555;
	display: flex;
	justify-content: center;
}

.tologin {
	font-size: 12px;
	color: #7F56D2;
	font-weight : bolder;
	cursor: pointer;
	margin-left: 20px;
}

.tologin:hover {
	color:#56D7D6;
}

.joinus {
	text-align:center;
	font-size: 12px;
	color: #555555;
	margin-top:20px;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

   $(document).ready(function() {
	      
	   $('#password').on('keyup',function(){
		      $('.pwcheckmsg').html('');
		    });
	   
	   $('#pwcheck').on('keyup',function(){
	        if($('#password').val() != $('#pwcheck').val()){
	          $('.pwcheckmsg').html('비밀번호 일치하지 않음');
	          $('.pwcheckmsg').attr('color', 'red');
	        } else {
	          $('.pwcheckmsg').html('비밀번호 일치함');
	          $('.pwcheckmsg').attr('color', 'blue');
	        }

	   });
		    	   
      
      $(".tologin").click(function(){
			location.href="login.mem";
	  }); 
      
      
});
   
</script>


</head>
<body>

<p class=s_title>비밀번호 변경</p>

	<div class="s_container">
		<form name="updatepwform" action="updatepw.mem" method="post">
			
			<div class="row"> 
				<div class="col-100">
					<input type="password" id="password" class="s_input" name="password" placeholder="${member.password}" readOnly>
				</div>
			</div> 
			
			<div class="row">
				<div class="col-100">
					<input type="password" id="password" class="s_input" name="password" placeholder="비밀번호">
					<span class=pwmsg></span>	
				</div>
			</div>
			<div class="row">		
				<div class="col-100">
					<input type="password" id="pwcheck" class="s_input" name="pwcheck" placeholder="비밀번호 확인">
					<span class=pwcheckmsg></span>	
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