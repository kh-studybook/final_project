<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write</title>

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
tr.center {
	text-align: center
}

h1 {
	font-size: 1.5rem;
	text-align: center;
	color: #1a92b9
}

.s_container {
	width: 60%
}

label {
	font-weight: bold
}
</style>
</head>
<body>
	<div class="s_container">
		<form action="NoticeAddAction.bo" method="post"
			enctype="multipart/form-data" name="noticeform">
			<h1>write</h1>

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
				<button type="reset" class="resetbtn">취소</button>
			</div>
		</form>
	</div>

</body>
</html>