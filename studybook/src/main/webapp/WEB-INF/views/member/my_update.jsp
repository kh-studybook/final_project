<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

body {
	background-color: #f2f2f2;
	text-align: center;
}

input[type=text], select, textarea {
	width: 100%;
	border: 0px;
	resize: vertical;
}

.s_title {
	margin-top: 220px;
	margin-bottom: 20px;
	font-size: 32px;
	text-align: center;
}

.outer_container {
	display: flex;
	justify-content: center;
}

.s_container {
	background-color: #ffffff;
	padding: 20px;
	width: 60%;
	min-width: 500px;
	margin-bottom: 150px;
}

.col-20 {
	float: left;
	width: 20%;
	margin-top: 20px;
	text-align:left;
}

.col-30 {
	float: left;
	width: 30%;
	margin-top: 25px;
	text-align:left;
}

.col-50 {
	float: left;
	width: 50%;
	margin-top: 25px;
	text-align:left;
}

.col-100 {
	clear: both;
	width: 100%;
	margin-top: 25px;
	display: flex;
	justify-content: center;
}

.avatar {
	width: 100px;
	border-radius: 50%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout 
- when the screen is less than 600px wide, 
make the two columns stack on top of each other 
instead of next to each other */
@media screen and (max-width: 600px) {
	{
		width: 100%;
		margin-top: 0;
	}
}

.picupdate {
	cursor: pointer;
	background-color:#56D7D6;
	color:white;
	border:0px;
}

.picupdate:hover {
	opacity:70%
}

.s_update, .s_delete {
	text-decoration:none;
	font-weight:bold;
	cursor: pointer;
	color:#56D7D6;
}

.s_update:hover, .s_delete:hover {
	text-decoration:none;
	color:#7F56D2;
}

.s_delete {
	margin-bottom:50px;
}

.hr {
	margin:50px;
	width:100%
}

.hr2 {
	margin-bottom:30px;
	margin-top:80px;
	width:100%
}

</style>
</head>
<body>


	<p class=s_title>프로필 관리</p>
	<div class=outer_container>
		<div class="s_container">
			<form action="#">


				<div class="row">
					<div class="col-100">
						<label> <input type="file" name="uploadfile"
							accept="image/gif, image/jpeg, image/png" style="display: none">
							<img src="resources/image/profile/default.png" alt="Avatar"
							class="avatar">
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-100">
						<p>프로필 사진 변경</p>
					</div>
				</div>

				
				<hr class=hr>
				
				
				<div class="row">
					<div class="col-30"></div>
					<div class="col-20">
						<label for="name">이름</label>
					</div>
					<div class="col-30">
						<input type="text" id="name" name="name" placeholder="손연수">
					</div>
					<div class="col-20"></div>
				</div>
				<div class="row">
					<div class="col-30"></div>
					<div class="col-20">
						<label for="email">이메일</label>
					</div>
					<div class="col-50">
						<input type="text" id="email" name="email"
							placeholder="sonyeonsoo@son.com">
					</div>
				</div>
				<div class="row">
					<div class="col-30"></div>
					<div class="col-20">
						<label for="phone">연락처</label>
					</div>
					<div class="col-20">
						<input type="text" id="phone" name="phone"
							placeholder="010-2222-3333">
						<!--   <input type="text" name="phone" id=phone class=phone maxLength="12" value="${member.phone }">-->
					</div>
					<div class="col-30">
						<a href=# class=s_update>변경하기</a>
					</div>
				</div>
				<div class="row">
					<div class="col-30"></div>
					<div class="col-20">
						<label for="password">비밀번호</label>
					</div>
					<div class="col-30">	
						<a href=# class=s_update>변경하기</a>
					</div>
					<div class="col-20"></div>
				</div>
				
				
				<hr class=hr2>
				
				
				<div class="row">
					<div class="col-100">
						<a href=# class=s_delete>계정 삭제하기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
