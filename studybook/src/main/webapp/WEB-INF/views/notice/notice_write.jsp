<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write</title>
  
<script>

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

</style>
</head>

<body>

<div class=contentwrap>
<div class=contentarea>

<div class=title_wrap>
	<p class=s_title>공지사항 쓰기</p> 	
</div>
<div class=realcontent>

<input type="hidden" id="memberkey" value="${key }" name="memberkey">

	<p class=s_title></p>
	
	<div class="s_container">
		<form action="NoticeAddAction.bo" method="post"
			enctype="multipart/form-data" name="noticeform">

			<div class="form-group">
				<input type="text" name="NOTICE_TITLE"
					id="notice_title" size="70" maxlength="100"
					class="notice_title" placeholder="제목" value="">
			</div>
			
			<div class="form-group">
				<textarea name="NOTICE_CONTENT" id="notice_content" cols="70"
					rows="20" class="notice_content" placeholder="내용"></textarea>
			</div>
			<div class="form-group buttons float-right">
				<button type="reset" class="resetbtn" onClick="history.go(-1)">취소</button>
				<button type="submit" class="submitbtn">등록</button>
			</div>
			
		</form>
	</div>
</div>
</div>	
</div>
</body>
</html>