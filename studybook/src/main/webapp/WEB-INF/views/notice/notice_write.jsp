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
tr.center {
	text-align: center
}

h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

.s_title {
	margin-top: 230px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	width:60%;
	display: flex;
	justify-content: center;
}

label {
	font-weight: bold 
}

</style>
</head>

<body>

	<p class=s_title></p>
	
	<div class="s_container">
		<form action="NoticeAddAction.bo" method="post"
			enctype="multipart/form-data" name="noticeform">

			<div class="form-group">
				<label for="notice_title">제목</label> <input name="NOTICE_TITLE"
					id="notice_title" type="text" size="50" maxlength="100"
					class="form-control" placeholder="제목" value="">
			</div>
			<div class="form-group">
				<label for="notice_content">내용</label>
				<textarea name="NOTICE_CONTENT" id="notice_content" cols="67"
					rows="10" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="submitbtn">등록</button>
				<button type="reset" class="resetbtn" onClick="history.go(-1)">취소</button>
			</div>
			
		</form>
	</div>

</body>
</html>