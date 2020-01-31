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
	font-size: 14px;
	text-align: center;
}

.notice_date {
	font-size:14px;
	text-align: center;
}
   
.notice_content {

	font-size: 14px;
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

	<p class=s_title></p>
	
	<div class="s_container">
		<form action="NoticeAddAction.bo" method="post"
			enctype="multipart/form-data" name="noticeform">


			<div class="form-group">
				<input type="text" name="NOTICE_TITLE"
					id="notice_title" size="50" maxlength="100"
					class="form-control" placeholder="제목" value="">
			</div>
			
			<div class="form-group">
				<textarea name="NOTICE_CONTENT" id="notice_content" cols="70"
					rows="20" class="notice_content" placeholder="내용"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="submitbtn">등록</button>
				<button type="reset" class="resetbtn" onClick="history.go(-1)">취소</button>
			</div>
			
		</form>
	</div>
</div>
</div>	
</div>
</body>
</html>