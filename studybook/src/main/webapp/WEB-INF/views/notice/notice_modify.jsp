<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice modify</title>
<script> 

	$(document).ready(function() {
		$(".submitbtn").click(function() {
			location.href = "NoticeModifyAction.bo";
		})
	});
</script>
<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

body {
	background-color: #f2f2f2;
}

.contentwrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

.contentarea {
	background-color: white;
    width: 50%;
    min-width: 420px;
    height: auto;
}

.realcontent {
	margin-left: 200px;
    margin-right: 200px;
}

.s_title {
	margin-top: 30px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}
   
.notice_title {
	border: 1px solid #dce6e6;
	font-size: 14px;
	background-color:;
}

.notice_date {
	font-size:14px;
	text-align: center;
}
   
.notice_content {
	border: 1px solid #dce6e6;
	font-size: 14px;
	background-color:;
}
   
th {
	text-align:center
}

.float-right {
	float:right;
}

.center {
	text-align:center;
}

.table td, .table th {
    border-top: 0px;
}

.submitbtn, .resetbtn {
	background-color: #ffffff;
	border: 0px;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
	color: #7F56D2;	
	margin-top: 30px;
	margin-bottom: 35px;
}

.submitbtn:hover, .resetbtn:hover {
	text-decoration: none;
	border: 0px;
	color: #56D7D6;
}

.listbtn {
	width: 330px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 50px;
	margin-bottom: 50px;
	border: none;
	cursor: pointer;
	
}

.listbtn:hover {
	opacity: 70%;
}
</style>

</head>
<body>
<div class=contentwrap>

<div class=contentarea>

<div class=realcontent>

<input type="hidden" id="memberkey" value="${key }" name="memberkey">

	<p class=s_title>공지사항 수정하기</p>
	<div class="s_container">
		<form action="./NoticeModifyAction.bo" enctype="multipart/form-data"
			method="post" name="modifyform">
			<input type="hidden" name="NOTICE_NUM"
				value="${noticedata.NOTICE_NUM }">

			<div class="form-group">
				<input type="text" id="notice_title" name="NOTICE_TITLE" class="notice_title"
					value="${noticedata.NOTICE_TITLE }" maxlength="100">
			</div>

			<div class="form-group">
				<textarea name="NOTICE_CONTENT" id="notice_content" cols="70"
					rows="20" class="notice_content">${noticedata.NOTICE_CONTENT }</textarea>
			</div>

			<!-- 관리자한테만 보이게 test 넣기 -->
			
			<div class="float-right">
				<button type="submit" class="submitbtn">수정</button>
				<button type="reset" class="resetbtn" onClick="history.go(-2)">취소</button>
			</div>
			
		</form>
	</div>
</div>
</div>	
</div>

</body>
</html>