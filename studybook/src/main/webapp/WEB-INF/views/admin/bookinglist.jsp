<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<p class="w_title">예약관리</p>
				<br>

				<form action="ReserveAdList.re">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>예약 번호</option>
							<option value="1">룸 이름</option>
							<option value="2">예약자</option>
							<option value="3">고객 전화번호</option>
							<option value="4">고객 이메일</option>
						</select> <input name="search_word" type="text" class="form-control"
							placeholder="Search" value="${search_word}">
						<button class="btn btn-primary" type="submit">검색</button>
					</div>
				</form>
			
			</div>
		</div>
		<div class="row">
			<div class="col">
				<%--예약 데이터가 있는 경우 --%>
				<c:if test="${listcount>0}">
					<p class="w_span">총 예약 수: ${listcount}</p>
					<table class="table table-striped custab">
						<thead>
							<tr>
								<th>No</th>
								<th>예약 번호</th>
								<th>룸 이름</th>
								<th>예약자</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>시작</th>
								<th>끝</th>
								<th>추가</th>
								<th>금액</th>
								<th>예약 날짜</th>
								<th>상태</th>
								<th class="text-center">상세/수정</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="num" value="${(page-1)*10+1}" />
							<c:forEach var="m" items="${reservelist}">
								<tr>
									<td><c:out value="${num}" /> <c:set var="num"
											value="${num+1}" /></td>
									<td>${m.r_code}</td>
									<td>${m.room_name}</td>
									<td>${m.reserver_name}</td>
									<td>${m.reserver_phone}</td>
									<td>${m.reserver_email}</td>
									<td>${m.start_time}</td>
									<td>${m.end_time}</td>
									<td>${m.extra_num}명</td>
									<td>${m.total_cost}</td>
									<td>${m.reserve_date}</td>
									<c:if test="${m.status==1}">
									<td>정상</td>
									</c:if>
									<c:if test="${m.status==0}">
									<td>취소</td>
									</c:if>
									<td class="text-center"><a class='btn btn-info btn-xs'
										href="ReserveModify.re?r_code=${m.r_code}">상세/수정 </a>
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
										<li class="page-item"><a class="page-link current"
											href="#">이전&nbsp;</a></li>
									</c:if>
									<c:if test="${page > 1 }">
										<li class="page-item"><a
											href="ReserveAdList.re?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
											class="page-link">이전</a>&nbsp;</li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<c:if test="${a == page }">
											<li class="page-item"><a class="page-link current"
												href="#">${a}</a></li>
										</c:if>
										<c:if test="${a != page }">
											<li class="page-item"><a
												href="ReserveAdList.re?page=${a}&search_field=${search_field}&search_word=${search_word}"
												class="page-link">${a}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${page >= maxpage }">
										<li class="page-item"><a class="page-link current"
											href="#">&nbsp;다음</a></li>
									</c:if>
									<c:if test="${page < maxpage }">
										<li class="page-item"><a
											href="ReserveAdList.re?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
											class="page-link ">&nbsp;다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
				<%--예약 리스트가 없는 경우 --%>
				<c:if test="${listcount==0}">
					<p class="w_p w_margin-top">검색 결과가 없습니다.</p>
				</c:if>
			</div>
		</div>
	</div>
	
	
	
</body>
<script>
	
</script>
