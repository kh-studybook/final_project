<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- main css 불러오기 -->
	<link rel="stylesheet" type="text/css" href="resources/css/room_search.css" />
</head>
<body>
<div id="m_search_header">
<div class="container">
	<div class="row">
		<div class="col-md">
			<div class="m_main_header_column">
				<div class="m_main_select">
					<div class="m_write" id="m_write_date">
						<div>
							<i class="far fa-calendar-alt"></i>
							모임 날짜
						</div>
						<i class="fas fa-chevron-down"></i>
					</div>
					<div id="my-calendar" class="e_calendar"></div>
	            </div>
				<div class="m_main_select">
					<div class="m_write" id="m_write_time">
						<i class="far fa-clock"></i>
						시간
						<i class="fas fa-chevron-down"></i>
					</div>
					<div id="m_main_time">
						<ul>
							<li>전체(09~22시)</li>
							<li>오전(09~12시)</li>
							<li>오후(12~18시)</li>
							<li>저녁(18~22시)</li>
						</ul>
				    </div>
				</div>
				<div class="m_main_select">
					<div class="m_write" id="m_write_count">
						<i class="fas fa-user"></i>
						인원
						<i class="fas fa-chevron-down"></i>
					</div>
					<div id="m_main_count">
						<ul>
							<li>4명 이하</li>
							<li>4 ~ 8명</li>
							<li>8 ~ 12명</li>
							<li>12명 이상</li>
						</ul>
				   	</div>
				</div>
				<button id="m_main_search" class="m_main_select" onclick="location.href='RoomSearch.ro'">검색</button>
			</div>		
		</div>
	</div>
</div>
</div>
	<div id="j_main_room" class="container">
		<div class="row">
		<c:if test="${listcount > 0}">
			<c:forEach var="list" items="${list}" varStatus="status">
				<div class="col-md-4">
					<div class="wrapper">
						<div class="tile job-bucket">
						<div class="front">
							<div class="card" onClick="javascript:location.href='room_detail.ro?room_code=${list.ROOM_CODE}'">
	      						<img class="card-img-top img-fluid rounded mx-auto d-block" src="resources/image/room/${list.FILE_NAME }">
	        					<div class="card-body">
	        						<p class="card-text">
		        						<span class="j_room_name">${list.ROOM_NAME}</span>
									  	<span class="j_room_count">최대 ${list.MAX_MEMBER}인</span>
								  	</p>
								  	<p class="card-text">
									  	<span class="j_room_pay"><span class="j_room_pay_hour">${list.HOUR_COST}</span> 원/시간</span>
									  	<span class="j_room_tag">${list.HASHTAG}</span>
	      							</p>
	      						</div>
      						</div>
    					</div>
					</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
		
		<br><br>
		<!--  페이지네이션 -->
		<c:if test="${listcount > 0}">
		<div id="center-block" class="center-block">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">&lt;</a></li>

						<!-- 중간에 숫자 부분 -->
						<c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a == page}">
								<li class="page-item"><a class="page-link current">${a}</a></li>
							</c:if>
							<c:if test="${a != page}">
								<li class="page-item"><a class="page-link">${a}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page >= maxpage}">
							<li class="page-item"><a class="page-link" href="#">&gt;</a>
							</li>
						</c:if>
						<c:if test="${page < maxpage}">
							<li class="page-item"><a
								href="javascript:go('${page+1}')" class="page-link">&gt;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		</c:if>
				
		
		<%-- 게시글이 없는 경우 --%>
		<c:if test="${listcount == 0}">
		<div class="row">
			<div class="col-md-12">
				<div id="m_none"><p>예약 가능한 공간이 없습니다.</p><p>다른 조건으로 검색해보시겠어요?</p></div>
			</div>
		</div>
		</c:if>
	</div>
</body>
</html>