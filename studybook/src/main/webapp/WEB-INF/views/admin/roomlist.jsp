<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}

.w_title {
	font-size: 32px;
	font-weight: bold;
	margin-top: 50px;
}
form{width:400px; text-align:center;display:inline-block;}
select{
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
 }
</style>
<script>
	$(function() {
		$(".w_addbtn").click(function() {
			location.href = "RoomWrite.ro";
		})
	})
</script>
</head>
<body>
	<div class="container w_wrap">
		<div class="row">
			<div class="col">
				<p class="w_title">공간관리</p>
				<br>
				<form action="room_list.ro">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>룸 네임</option>
							<option value="1">룸 넘버</option>
							<option value="2">최대인원</option>
							<option value="3">시간당가격</option>
						</select> <input name="search_word" type="text" class="form-control"
							placeholder="Search" value="${search_word}">
						<button class="btn btn-primary" type="submit">검색</button>
					</div>
				</form>
				<a href="#" class="btn btn-primary btn-xs pull-right w_addbtn"><b>+</b>공간
							추가</a>
						<br>
				<table class="table table-striped custab">
					<thead>
						<tr>
							<th>No</th>
							<th>룸 넘버</th>
							<th>룸 이름</th>
							<th>최대인원</th>
							<th>시간당가격</th>
							<th class="text-center">수정/삭제</th>
						</tr>
					</thead>
					<tr>
						<td>1</td>
						<td>22</td>
						<td>스터디룸A</td>
						<td>8명</td>
						<td>20,000원</td>
						<td class="text-center"><a class='btn btn-info btn-xs'
							href="#"><span class="glyphicon glyphicon-edit"></span>수정</a> <a
							href="#" class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-remove"></span>삭제</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>22</td>
						<td>스터디룸B</td>
						<td>8명</td>
						<td>15,000원</td>
						<td class="text-center"><a class='btn btn-info btn-xs'
							href="#"><span class="glyphicon glyphicon-edit"></span>수정</a> <a
							href="#" class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-remove"></span>삭제</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>22</td>
						<td>소회의실</td>
						<td>8명</td>
						<td>10,000원</td>
						<td class="text-center"><a class='btn btn-info btn-xs'
							href="#"><span class="glyphicon glyphicon-edit"></span>수정</a> <a
							href="#" class="btn btn-danger btn-xs"><span
								class="glyphicon glyphicon-remove"></span>삭제</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
<script>
	
</script>
