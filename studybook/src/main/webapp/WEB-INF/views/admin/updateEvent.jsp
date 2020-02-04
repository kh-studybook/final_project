<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
* {
	font-family: "맑은 고딕";
	font-size: 14px;
}

.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin-bottom: 30px;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
	box-shadow: 3px 3px 2px #ccc;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}

.w_title {
	font-size: 32px;
	font-weight: bold;
}

form {
	width: 350px;
	text-align: center;
	display: inline-block;
}

select {
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

li .current {
	background: #faf7f7;
	color: gray;
}

.table td {
	vertical-align: middle;
}

.w_p {
	font-size: 24px;
}

.w_span {
	font-size: 14px;
	margin-top: 20px;
}

.w_center-block {
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	margin-bottom: 20px;
}
.w_margin-top{
margin-top:50px;
}
</style>
<script>
	
</script>
</head>
<body>
	<div class="container w_wrap">
		<div class="row">
			<div class="col">
				<p class="w_title">이벤트 관리</p>
				<br>

				<form action="AdminEventList.eve">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>회원키</option>
							<option value="1">이벤트 번호</option>
							<option value="2">제목</option>
							<option class = "content" value="3">내용</option>
						</select> <input name="search_word" type="text" class="form-control"
							placeholder="Search" value="${search_word}">
						<button class="btn btn-primary" type="submit">검색</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<%--멤버 리스트가 있는 경우 --%>
				<c:if test="${listcount>0}">
					<p class="w_span">총 이벤트 수: ${listcount}</p>
					<table class="table table-striped custab">
						<thead>
							<tr>
								<th>No</th>
								<th>이벤트번호</th>
								<th>제목</th>
								<th>날짜</th>
								<th>장소</th>
								<th>상세보기</th>
								<th class="text-center">반려/승인</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="num" value="${(page-1)*10+1}" />
							<c:forEach var="m" items="${eventlist}">
								<tr>
									<td><c:out value="${num}" /> 
									<c:set var="num" value="${num+1}" /></td>
									<td>${m.event_num}</td>
									<td>${m.title}</td>
									<td>${fn:substring(m.event_date,0,11)}</td>
									<td>${m.event_room}</td>
									<td><a class='btn btn-secondary' href="EventDetailAction.eve?event_num=${m.event_num}">상세보기</a></td>
									<td class="text-center">
										<!-- 아무것도 선택 안 했을 때 -->
										<c:if test = "${m.event_status == 0}">
											<a class='btn btn-danger btn-xs' href="AdminEvent.eve?event_num=${m.event_num}">반려</a> 
											<a class="btn btn-info btn-xs" href="AdminEvent2.eve?event_num=${m.event_num}">승인</a>
										</c:if>
										<!--  승인 했을 때 -->
										<c:if test = "${m.event_status == 1}">
											<a class='btn btn-danger btn-xs' href="AdminEvent.eve?event_num=${m.event_num}">반려</a> 
										</c:if>
										<!--  반려 했을 때 -->
										<c:if test = "${m.event_status == 2}"> 
											<a class="btn btn-info btn-xs" href="AdminEvent2.eve?event_num=${m.event_num}">승인</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="w_center-block">
						<div class="row">
							<div class="col">
								<ul class="pagination">
									<c:if test="${page <= 1 }">
										<li class="page-item"><a class="page-link"
											href="#">이전&nbsp;</a></li>
									</c:if>
									<c:if test="${page > 1 }">
										<li class="page-item"><a
											href="AdminEventList.eve?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
											class="page-link">이전</a>&nbsp;</li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<c:if test="${a == page }">
											<li class="page-item"><a class="page-link current"
												href="#">${a}</a></li>
										</c:if>
										<c:if test="${a != page }">
											<li class="page-item"><a
												href="AdminEventList.eve?page=${a}&search_field=${search_field}&search_word=${search_word}"
												class="page-link">${a}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${page >= maxpage }">
										<li class="page-item"><a class="page-link"
											href="#">&nbsp;다음</a></li>
									</c:if>
									<c:if test="${page < maxpage }">
										<li class="page-item"><a
											href="AdminEventList.eve?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
											class="page-link ">&nbsp;다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
				<%--멤버 리스트가 없는 경우 --%>
				<c:if test="${listcount==0}">
					<p class="w_p w_margin-top">검색 결과가 없습니다.</p>
				</c:if>

			</div>
		</div>
	</div>
</body>
<script>
	
</script>
