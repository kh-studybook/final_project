<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
	<link rel="stylesheet" href="resources/css/jsCalendar.css">
	<script src="resources/js/jsCalendar.js"></script>
	<script src="resources/js/main.js"></script>
</head>
<body>
	<div id="m_main_header">
		<div class="container">
			<div class="row">
				<div class="col-md">
					<p class="m_header_text">"1월 스터디<br>공간 예약 서두르세요!"</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md">
					<div class="m_main_header_column">
						<div class="m_main_select" onClick="">
							<div class="m_write" id="m_write_date">
								<div>
									<i class="far fa-calendar-alt"></i>
									모임 날짜
								</div>
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="my-calendar" class="e_calendar"></div>
	            		</div>
						<div class="m_main_select" onClick="">
							<div class="m_write" id="m_write_time">
								<i class="far fa-clock"></i>
								시간
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_time">
								<ul>
									<li>전체</li>
									<li>오전(09~12시)</li>
									<li>오후(12~18시)</li>
									<li>저녁(18~22시)</li>
								</ul>
				        	</div>
						</div>
						<div class="m_main_select" onClick="">
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
						<button id="m_main_search" class="m_main_select">검색</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div id="j_main_room" class="container">
		<p>스터디북의 추천공간</p>
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
		<div id = "center-block" class="center-block">
			<div class="row">
				<div class="col">
					<ul class="pagination">
						<c:if test="${page <= 1}">
							<li class="page-item"><a class="page-link" href="#">&lt;</a>
							</li>
						</c:if>
						<c:if test="${page >1}">
							<li class="page -item"><a
								href="main.net?page = ${page-1}" class="page-link">&lt;</a>
							</li>
						</c:if>

						<!-- 중간에 숫자 부분 -->
						<c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a == page}">
								<li class="page-item"><a class="page-link current"
									href="#">${a}</a></li>
							</c:if>
							<c:if test="${a != page}">
								<li class="page-item"><a href="main.net?page=${a}"
									class="page-link">${a}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${page >= maxpage}">
							<li class="page-item"><a class="page-link" href="#">&gt;</a>
							</li>
						</c:if>
						<c:if test="${page < maxpage}">
							<li class="page-item"><a
								href="main.net?page=${page+1}" class="page-link">&gt;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
				
		
		<%-- 게시글이 없는 경우 --%>
		<c:if test="${listcount == 0}">
			<font size=5 margin="10">등록된 공간이 없습니다.</font>
		</c:if>
		
		<div class="row">
			<div class="j_event_title">UPCOMING EVENT</div>
		</div>
		
		<%-- 이벤트 있는 경우 --%>
		<c:if test="${event_listcount > 0}">
			<div class="row j_event_more_div">
				<div class="j_event_more" onClick="javascript:location.href='event_list.eve'">더보기</div>
			</div>
			
			<!-- Carousel -->
			<div class="row">
				<div class="container">
	            <div class="row blog">
	                <div class="col-md-12">
	                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">
	                        <ol class="carousel-indicators">
	                            <li data-target="#blogCarousel" data-slide-to="0" class="active">&lt</li>
	                            <li data-target="#blogCarousel" data-slide-to="1">&gt</li>
	                        </ol>
	
	                        <!-- Carousel items -->
	                        <div class="carousel-inner">
	
	                            <div class="carousel-item active">
	                                <div class="row">
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                </div>
	                                <!--.row-->
	                            </div>
	                            <!--.item-->
	
	                            <div class="carousel-item">
	                                <div class="row">
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                    <div class="col-md-3">
	                                        <a href="#">
	                                            <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                </div>
	                                <!--.row-->
	                            </div>
	                            <!--.item-->
	
	                        </div>
	                        <!--.carousel-inner-->
	                    </div>
	                    <!--.Carousel-->
	                </div>
	            </div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${event_listcount == 0}">
			<div class="row">
				<div class="col-md-4">
					<font size=5 margin="10">등록된 이벤트가 없습니다.</font>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>