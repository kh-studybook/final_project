<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>join</title>

<link type="text/css" rel="stylesheet" href="resources/css/join.css" >

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" />
	
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
      
      $("#tel").blur(function() {
    		var re_id = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; //test
    		var userid=$("#email").val();
     		var param ="email="+email; 
     		if(emailcheck.test(email)!=true){
     			$("#telmsg").html('<span style="color:red">특수기호 없이 숫자만 입력해주세요.</span>');
     			$("#tel").focus();
     			return;
     		}
  	  });
      
      
});
   
</script>


</head>
<body>
 
<h2>회원가입</h2>
<span>이미 회원이신가요?</span> <a href=# class=login>로그인</a>
 
	<form name="joinform" action="joinProcess.mem" method="post">

		
		
		<input type="text" name="name" id="name" placeholder="이름" maxlength=15 required>	
		<span id="namemsg"/>
		
		<input type="text" name="email" id="email" placeholder="이메일" required>
		<span id="emailmsg"/>
		
		<input type="password" name="pw" id="pw" placeholder="비밀번호" required>
		<span id="pwmsg"/>
		 
		<input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" required>
		<span id="pwcheckmsg"/>
		
		<input type="text" name="tel" id="tel" placeholder="전화번호" maxLength="12" required>
		<span id="telmsg"/>		


		<input type="checkbox" name="priv"> 서비스 약관과 개인정보 보호정책에 동의합니다.
		
		<div class="clearfix">
			<button type="submit" class="submitbtn">회원가입</button>
		</div>
		
	</form>
</body>
</html>