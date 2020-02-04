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
	
	$('.notice_content').keyup(function (e){
	    var content = $(this).val();
	    $('.counter').html("("+content.length+" / 최대 1500자)"); //글자수 실시간 카운팅

	    if (content.length > 1500){
	        alert("최대 1500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 1500));
	        $('.counter').html("(1500 / 최대 1500자)");
	    }
	});
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
	margin-top: 0px;
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
	margin-top: 50px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}
   
.notice_title {
	font-size: 14px;
	padding:5px;
	width:500px;
	height:35px;
}

.notice_content {
	font-size: 14px;
	padding:5px;
	width:500px;
	height:450px;
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

.submitbtn {
	width:85px;
	height:35px;
	line-height: 35px;
	background-color: #7F56D2;;
	color: white;
	margin-top: 10px;
	margin-bottom: 80px;
	margin-left: 10px;
	border: none;
	cursor: pointer;
	font-size: 12px;
	font-weight: bold;
	border-radius:5px;
}

.resetbtn {
	width:85px;
	height:35px;
	line-height: 35px;
	background-color: #56D7D6;
	color: white;
	margin-top: 10px;
	margin-bottom: 80px;
	border: none;
	cursor: pointer;
	font-size: 12px;
	font-weight: bold;
	border-radius:5px;
}

.submitbtn:hover, .resetbtn:hover {
	opacity: 70%;
}

.buttons {
	text-align:center
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

<div class=title_wrap>
	<p class=s_title>공지 수정하기</p> 	
</div>
<div class=realcontent>

<input type="hidden" id="memberkey" value="${key }" name="memberkey">

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
					<br>
				<span class=counter style="color:#7F56D2; font-size:12px;" id="counter">(0 / 최대 1500자)</span>
			</div>

			<!-- 관리자한테만 보이게 test 넣기 -->
			
			<div class="buttons">
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