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

body {
	background-color: #f2f2f2;
	text-align: center;
}

.s_title {
	margin-top: 50px;
	margin-bottom: 45px;
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
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 20px;
	margin-bottom: 30px;
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

.joinus {
	margin-top: 40px;
	margin-bottom:80px;
	font-size:12px;
	text-align:center;
}

.remember {
	text-align:left; 
	margin-top: 7px;
	font-size: 12px;
	color:#7F7F7F;
}

</style>

<script>	
	
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#email").val(key); 
	     
	    if($("#email").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#remember").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#email").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

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

<div class=outer_container>
	<div class="s_container">
	
	<p class=s_title>로그인</p>


<div class=formdiv>

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
				<div class="col-100 remember">
					<label for=remember class="remember"><input type="checkbox" id= "remember" checked> 이메일 저장하기</label> 					
				</div>
			</div>
			
			<div class="row">
				<div class="col-100">
					<input type="submit" class="s_submit clear" value="로그인">
				</div>
			</div>
			
			<div class="row">
				<div class="col-100 joinus">
					<span class="wannajoinus">스터디북 방문이 처음이신가요?</span><span class="join">회원가입</span>
				</div>
			</div>
		</form>
</div>		
	</div>
</div>

</body>
</html>