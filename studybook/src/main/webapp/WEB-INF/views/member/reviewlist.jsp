<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
	font-family: "맑은 고딕";
}

body {
	background-color: #f2f2f2;
}

.w_div {
	display: inline-block;
}

.w_title {
	margin-top: 100px;
	margin-bottom: 70px;
	font-size: 32px;
	text-align: center;
}

.w_card {
	border: 1px solid #C1C1C1;
	padding: 20px;
	background: white;
	margin-bottom:25px;
}

.w_img {
width:140px;	
}

.w_content {
	line-height: 24px;
	font-size: 12px;
	color: #555555;
}

.w_badge {
	font-size: 12px;
	margin-bottom: 13px;
}

.w_padding {
	padding-left: 20px;
}

.w_name {
	font-size: 24px;
	color: #333333;
}

.w_time {
	font-size: 24px;
	color: #333333;
	font-size: 12px;
}

.w_btn {
	line-height: 24px;
	font-size: 12px;
}

.w_center-block {
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	margin-bottom: 20px;
}
.w_topmargin{
margin-top:30px;}
.w_margin-top{
margin-top:50px;
}
</style>
</head>
<body>
	<p class=w_title>후기 관리</p>
	<div class=container>
	<%--후기 데이터가 있는 경우 --%>
	<c:if test="${listcount>0}">
	<c:forEach var="m" items="${reviewlist}">
		<div class="w_card">
			<div class="row">
				<div class="col-md-2">
					<a href="#" class="thumbnail"> <img class="card-img-top w_img"
											src="resources/image/room/${m.FILE_NAME}">
					</a>
				</div>
				<div class="col-md-6 w_padding">
					<span class="badge badge-secondary w_badge">예약번호: ${m.r_code}</span>
					<p class="w_name">${m.ROOM_NAME}</p>
					<br>
					<p class="w_time">${m.reserve_date} ${m.start_time}~${m.end_time}시, <c:set var="start" value="${m.start_time}"/><c:set var="end" value="${m.end_time}"/><c:set var="result" value="${end-start}"/><c:out value="${result}"/>시간</p>

				</div>
				<div class="col-md-2">
					<p class="w_content">후기 등록 날짜</p>
					<p>${m.review_date}</p>
				</div>
				<div class="col-md-2">
					<p class="pull-right w_btn">
						<a href="ReviewModify.re?review_code=${m.review_code}">수정</a> | 
						<a href="ReviewDelete.re?review_code=${m.review_code}">삭제</a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<hr>
					<p class="w_content">${m.content}</p>

				</div>
			</div>
		</div>
		</c:forEach>
		<div class="row">
		<div class="col">
			<div class="w_center-block w_topmargin">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page <= 1 }">
								<li class="page-item"><a class="page-link current" href="#">이전&nbsp;</a></li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="myReviewList.re?page=${page-1}&key=${member.key}"
									class="page-link">이전</a>&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="page-item"><a class="page-link current"
										href="#">${a}</a></li>
								</c:if>
								<c:if test="${a != page }">
									<li class="page-item"><a
										href="myReviewList.re?page=${a}&key=${member.key}"
										class="page-link">${a}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= maxpage }">
								<li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a></li>
							</c:if>
							<c:if test="${page < maxpage }">
								<li class="page-item"><a
									href="myReviewList.re?page=${page+1}&key=${member.key}"
									class="page-link ">&nbsp;다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</div>
		</c:if>
		<%--후기 리스트가 없는 경우 --%>
		<c:if test="${listcount==0}">
					<p class="w_p w_margin-top">작성된 후기가 없습니다.</p>
				</c:if>
		
	</div>
</body>
</html>
