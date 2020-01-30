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
	margin-top: 120px;
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
	margin-bottom: 50px;
	border: none;
	cursor: pointer;
}

input[type=checkbox] {
	background: #ffffff;
}

.namemsg, .emailmsg, .pwmsg, .pwcheckmsg, .phonemsg {
	font-size: 12px;
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

.floatl {
	float: left;
	font-size: 12px;
	color: #555555;
}

.floatr {
	float: right;
	font-size: 12px;
	color: #555555;
}

.clear {
	clear: both;
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
	font-weight: bolder;
	cursor: pointer;
	margin-left: 20px;
}

.tologin:hover {
	color: #56D7D6;
}

.joinus {
	text-align: center;
	font-size: 12px;
	color: #555555;
	margin-top: 20px;
}

.message {
	mergin-bottom: 5px;
}

.msg {
	font-size:10px;
	color:crimson;
}

.height {
	width: 330px;
	height: 70px;
}

.submit {
	margin-bottom: 30px;
}

img {
	width:15px;
	margin-left:10px;
}

/*modal*/
#modalforupdate {
	display: none;
}

.modal {
	text-align: center;
}

@
@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal_dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal_wrap {
	padding: 40px;
	margin-top: 160px;
	margin-left: auto;
	width: 400px;
	height: 300px;
	background-color: white;
}

.modal_intro {
	height: 80px;
}

.modal_body {
	height: 80px;
}

.modal_title {
	font-size: 20pt;
}

.modal_text {
	font-size: 12pt;
}

#modal_phone {
	
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

						var nametest = /^[가-힣a-zA-Z]+$/;
						var passwordtest = /^[0-9a-zA-Z]{6,20}$/;
						var emailtest = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						var phonetest = /^010?([0-9]{4})?([0-9]{4})$/;

						
						$("#name").blur(function() {
							var value = $('#name').val().trim();
							if (nametest.test($(this).val())) {
								gogo();
								console.log(emailtest.test($(this).val()));
								$(".namemsg").html('<img src=resources/image/check.png>');
								
							} else {
								$('.namemsg').text('! 이름은 한글/영문만 입력 가능합니다.');
							}
						});

						$("#email").blur(function() {
							var value = $('#email').val().trim();
							if (emailtest.test($(this).val())) {
								gogo();
								console.log(emailtest.test($(this).val()));
								$(".emailmsg").html('<img src=resources/image/check.png>');
							} else {
								$('.emailmsg').text('! 유효한 이메일 주소를 입력해주세요.');
							}
						});

						$('#password').blur(function() {
							if (passwordtest.test($(this).val())) {
								gogo();
								console.log(passwordtest.test($(this).val()));
								$('.pwmsg').html('<img src=resources/image/check.png>');
							} else {
								$('.pwmsg').text('! 숫자, 영문 대/소문자로 총 6자 이상 입력해주세요.');
							}
						});

						$('#pwcheck').on('keyup', function() {
							if ($('#password').val() != $('#pwcheck').val()) {
								$('.pwcheckmsg').text('! 비밀번호가 일치하지 않습니다.');
							} else {
								gogo();
								$('.pwcheckmsg').html('<img src=resources/image/check.png>');
							}

						});

						$("#phone").blur(function() {
							if (phonetest.test($(this).val())) {
								gogo();
								console.log(phonetest.test($(this).val()));
								$(".phonemsg").html('<img src=resources/image/check.png>');
							} else {
								$('.phonemsg').text('! 010으로 시작하는 숫자만 입력 가능합니다.');
							}
						}); 

						function gogo() {
						if ($("#name").val() != "" 
							&& $("#email").val() != ""
							&& $("#password").val() != ""
							&& $("#pwcheck").val() != ""
							&& $("#phone").val() != "") {

							$('.s_submit').attr('disabled', false);
							$('.s_submit').css('background', '#7F56D2');
						} else {
							$('.s_submit').attr('disabled', true);
						}
						}
						
						$(".tologin").click(function() {
							location.href = "login.mem";
						});
					});
</script>

</head>
<body>

	<p class=s_title>회원가입</p>
	<p class="schonangemeldet">
		이미 스터디북 회원이신가요? <span class="tologin">로그인</span>
	</p>
	<div class="s_container">
		<form name="joinform" action="joinProcess.mem" method="get">

			<div class="row height">
				<div class="col-100">
					<input type="text" id="name" class="s_input" name="name"
						placeholder="이름">
				</div>
				<div class="col-100 message">
					<span class="namemsg msg"></span>
				</div>
			</div>

			<div class="row height">
				<div class="col-100">
					<input type="text" id="email" class="s_input" name="email"
						placeholder="이메일">
				</div>
				<div class="col-100 message">
					<span class="emailmsg msg"></span>
				</div>
			</div>

			<div class="row height">
				<div class="col-100">
					<input type="password" id="password" class="s_input"
						name="password" placeholder="비밀번호">
				</div>
				<div class="col-100 message">
					<span class="pwmsg msg"></span>
				</div>
			</div>
			<div class="row height">
				<div class="col-100">
					<input type="password" id="pwcheck" class="s_input" name="pwcheck"
						placeholder="비밀번호 확인">
				</div>
				<div class="col-100 message">
					<span class="pwcheckmsg msg"></span>
				</div>
			</div>

			<div class="row height">
				<div class="col-100">
					<input type="text" name="phone" id="phone" class="s_input"
						name="phone" placeholder="연락처" maxLength="11" required>
				</div>
				<div class="col-100 message">
					<span class="phonemsg msg"></span>
				</div>
			</div>

			<div class="row height">
				<div class="col-100 joinus">
					<span class="joinus"><input type="checkbox" name="priv">
						<a data-toggle="modal" data-target="#modalforupdate"
						class=s_update id="v1">서비스 약관과 개인정보 보호정책에 동의합니다.</a></span>
				</div>
			</div>

			<div class="row">
				<div class="col-100 submit">
					<input type="submit" class="s_submit clear" value="회원가입">
				</div>
			</div>
		</form>
	</div>


	<!-- modal 시작! -->
	<div class="modal" id="modalforupdate">
		<div class="modal_dialog">
			<div class="modal_wrap">

				<!-- modal body -->
				<div class="modal_body">
					<form>
						<div class="phoneupdate">

							<div class=modal_intro>
								<p class=modal_title>서비스약관개인정보보호정책</p>
								<p class=modal_text>~~~.</p>
							</div>



							<div class=modal_submit></div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 연수모달여기까지 -->

</body>
</html>