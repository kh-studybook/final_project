<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>join</title>


<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

.s_title { 
	margin-top: 50px; 
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
	margin-top: 25px;
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
	margin-top: 15px;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
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


.schonangemeldet {
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
}

.tologin:hover {
	background: #7F56D2;
	color:#ffffff;
	font-weight : bolder;
}


</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

   $(document).ready(function() {
	      
	   $('#pw').on('keyup',function(){
		      $('#pwcheckmsg').html('');
		    });
	   
	   $('#pwcheck').on('keyup',function(){
	        if($('#pw').val() != $('#pwcheck').val()){
	          $('#pwcheckmsg').html('비밀번호 일치하지 않음<br><br>');
	          $('#pwcheckmsg').attr('color', 'red');
	        } else{
	          $('#pwcheckmsg').html('비밀번호 일치함<br><br>');
	          $('#pwcheckmsg').attr('color', 'red');
	        }

	    });
		    	   
      $('#id').on('keyup',function(){
         $("#message").empty();
         var pattern = /^\w{4,12}$/;
         var id = $("#id").val();
         if(!pattern.test(id)){
            $("#message").css('color', 'red').html("영문자, 숫자, _ 4~12자 가능");
            checkid=false;
            return;
         }
         
          $.ajax({
            type:"post",
            url : "idcheck",
            data : {"id":id},   
            success : function(resp){
               if(resp == -1){
                  $("#message").css('color','green').html("사용 가능한 아이디");
                  checkid=true;
               }else{
                  $("#message").css('color','red').html("사용중인 아이디");
                  checkid=false;
               }
            } 
         }) 
      })

      $("#email").blur(function() {
  		var re_id = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; //test
  		var userid=$("#email").val();
   		var param ="email="+email; 
   		if(emailcheck.test(email)!=true){
   			$("#emailcheck").html('<span style="color:red">유효한 이메일 주소를 입력해주세요.</span>');
   			$("#email").focus();
   			return;
   		}
	  });
      
      $("#phone").blur(function() {
    		var re_id = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; //test
    		var userid=$("#phone").val();
     		var param ="phone="+email; 
     		if(phonecheck.test(phone)!=true){
     			$("#phonemsg").html('<span style="color:red">특수기호 없이 숫자만 입력해주세요.</span>');
     			$("#phone").focus();
     			return;
     		}
  	  });
      
      $(".login").click(function(){
			location.href="login.mem";
	  }); 
      
      
});
   
</script>


</head>
<body>

<p class=s_title>회원가입</p>
<p class="schonangemeldet">이미 스터디북 회원이신가요?  <span class="tologin">로그인</span></p>
	<div class="s_container">
		<form name="joinform" action="joinProcess.mem" method="post">
			<div class="row">

					
				<div class="col-100">
					<input type="text" id="name" class="s_input" name="name" placeholder="이름">
					<span class=namemsg></span>
				</div>
				<div class="col-100">
					<input type="text" id="email" class="s_input" name="email" placeholder="이메일">
					<span class=emailmsg></span>
				</div>

				<div class="col-100">
					<input type="password" id="password" class="s_input" name="password" placeholder="비밀번호">
					<span class=passwordmsg></span>	
				</div>
				
				<div class="col-100">
					<input type="password" id="passwordcheck" class="s_input" name="passwordcheck" placeholder="비밀번호 확인">
					<span class=passwordcheckmsg></span>	
				</div>
				<div class="col-100">
					<input type="text" name="phone" id="phone" class="s_input" name="phone" placeholder="전화번호" maxLength="12" required>
					<span class=phonemsg></span>	
				</div>
			</div>


			
			<div class="row">
				<div class="col-100">
					<span class="wannajoinus floatl"><input type="checkbox" name="priv"> 서비스 약관과 개인정보 보호정책에 동의합니다.</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-100">
					<input type="submit" class="s_submit clear" value="회원가입">
				</div>
			</div>
		</form>
	</div>



</body>
</html>