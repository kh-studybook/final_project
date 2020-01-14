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
	width: 50%;
	min-width: 550px;
}

.col-50 {
	float: left;
	width: 50%;
	margin-top: 6px;
}

.col-60 {
	float: left;
	width: 60%;
	margin-top: 6px;
}


.col-100 {
	clear: both;
	width: 100%;
	margin-top: 6px;
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
	.col-50 {
		width: 100%;
		margin-top: 0;
	}
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
						<button>프로필 사진 변경</button>
					</div>
				</div>

				<hr>
				<div class="row">
					<div class="col-50">
						<label for="name">이름</label>
					</div>
					<div class="col-50">
						<input type="text" id="name" name="name" placeholder="손연수">
					</div>
				</div>
				<div class="row">
					<div class="col-50">
						<label for="email">이메일</label>
					</div>
					<div class="col-50">
						<input type="text" id="email" name="email"
							placeholder="sonyeonsoo@son.com">
					</div>
				</div>
				<div class="row">
					<div class="col-50">
						<label for="phone">연락처</label>
					</div>
					<div class="col-50">
						<input type="text" id="phone" name="phone"
							placeholder="010-2222-3333">
						<!--   <input type="text" name="phone" id=phone class=phone maxLength="12" value="${member.phone }">-->
					</div>
				</div>
				<div class="row">
					<div class="col-50">
						<label for="password">비밀번호</label>
					</div>
					<div class="col-50">
						<a href=# class>변경하기</a>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-100">
						<a href=#>계정 삭제하기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
