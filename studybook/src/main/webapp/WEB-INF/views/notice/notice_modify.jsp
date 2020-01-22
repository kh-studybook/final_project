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
		var check = 0;

		$('form').submit(function() {
			/* if($.trim($("input").eq(1).val())==""){
				alert("비밀번호를 입력하세요");
				$("input:eq(1)").focus();
				return false;
			}
			if($.trim($("input").eq(2).val())==""){
				alert("제목을 입력하세요");
				$("input:eq(2)").focus();
				return false;
			}
			
			if($.trim($("input").eq(3).val())==""){
				alert("내용을 입력하세요");
				$("input:eq(3)").focus();
				return false;
			}  */

		});

	});
</script>
<style>
.s_title {
	margin-top: 230px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}

tr.center-block {
	text-align: center
}

h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

.container {
	width: 60%
}

label {
	font-weight: bold
}

#upfile {
	display: none
}
</style>

</head>
<body>

	<p class=s_title></p>
	<div class="s_container">
		<form action="./NoticeModifyAction.bo" enctype="multipart/form-data"
			method="post" name="modifyform">
			<input type="hidden" name="NOTICE_NUM"
				value="${noticedata.NOTICE_NUM }">

			<div class="form-group">
				<label for="notice_title">제목</label> <input type="text"
					id="notice_title" name="NOTICE_TITLE" class="form-control"
					value="${noticedata.NOTICE_TITLE }" maxlength="100">
			</div>

			<div class="form-group">
				<label for="notice_content">내용</label>
				<textarea name="NOTICE_CONTENT" id="notice_content" cols="67"
					rows="10" class="form-control">${noticedata.NOTICE_CONTENT }</textarea>
			</div>


			<div class="form-group">
				<button type="submit" class="submitbtn">수정</button>
				<button type="reset" class="resetbtn" onClick="history.go(-1)">취소</button>
			</div>
		</form>
	</div>
</body>
</html>