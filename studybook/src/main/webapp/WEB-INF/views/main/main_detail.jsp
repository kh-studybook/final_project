<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 캘린더 css 불러오기 -->
	<link rel="stylesheet" href="resources/css/jsCalendar.css">
	<!-- main css 불러오기 -->
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
	<!-- 카카오지도 services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96ef4dc13ca9a8b7e395102cddc78d5f&libraries=services"></script>
	<!-- 카카오지도 api 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96ef4dc13ca9a8b7e395102cddc78d5f"></script>
	<!-- 캘린더 js 불러오기 -->
	<script src="resources/js/jsCalendar.js"></script>
	<!-- main js 불러오기 -->
	<script src="resources/js/main.js"></script>
</head>
<body>
<input type="hidden" name="date" id="date" value="">
<input type="hidden" name="starttime" id="starttime" value="">
<input type="hidden" name="endtime" id="endtime" value="">
<input type="hidden" name="MIN_MEMBER" id="MIN_MEMBER" value="">
<input type="hidden" name="MAX_MEMBER" id="MAX_MEMBER" value="">
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
							<div class="m_write" id="m_write_starttime">
								<i class="far fa-clock"></i>
								START
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_starttime">
								<ul>
									<li>9시</li>
									<li>10시</li>
									<li>11시</li>
									<li>12시</li>
									<li>13시</li>
									<li>14시</li>
									<li>15시</li>
									<li>16시</li>
									<li>17시</li>
									<li>18시</li>
									<li>19시</li>
									<li>20시</li>
									<li>21시</li>
								</ul>
				        	</div>
						</div>
						<div class="m_main_select">
							<div class="m_write" id="m_write_endtime">
								<i class="far fa-clock"></i>
								END
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_endtime">
								<ul>
									<li>10시</li>
									<li>11시</li>
									<li>12시</li>
									<li>13시</li>
									<li>14시</li>
									<li>15시</li>
									<li>16시</li>
									<li>17시</li>
									<li>18시</li>
									<li>19시</li>
									<li>20시</li>
									<li>21시</li>
									<li>22시</li>
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
						<button id="m_main_search" class="m_main_select" onclick="search()">검색</button>
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
			<font>등록된 공간이 없습니다.</font>
		</c:if>
		
	</div>
	
	<div class="container"  id="j_main_event">
		<div class="row">
			<div class="col-md-center j_event_title">UPCOMING EVENT</div>
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
	             
	                        <!-- Carousel items -->
	                        <div class="carousel-inner">
	                            <div class="carousel-item active">
	                            	<div class="row">
	                            	<c:forEach var="list" items="${eventlist}" varStatus="status">
	                                	<div class="col-md-4">
		                               		<div class="j_event" onclick="javascript:location.href='EventDetailAction.eve?num=${list.event_num}'">
			                                   	<img class="col-md" src="resources/upload/${list.event_pic}">
			                                    <div class="col-md j_event_inner">
					                                <div class="j_event_name">${list.title}</div>
					                                <br><br><br>
					                                <div class="j_event_date">${list.event_date},</div>
					                                <div class="j_event_date">${list.event_room}</div>
				                                </div>
		                                    </div>
	                                    </div>
	                                <c:if test="${status.last}">
	                                </div>
	                                </c:if>
	                                </c:forEach>
	                                <!--.row-->
	                            </div>
	                            <!--.item-->
	
								<c:if test="${!empty eventlist2}">
								<!-- event 좌우 버튼 -->
								<ol class="carousel-indicators">
		                            <li data-target="#blogCarousel" data-slide-to="0" class="active">&lt</li>
		                            <li data-target="#blogCarousel" data-slide-to="1">&gt</li>
		                        </ol>
		                        
	                            <div class="carousel-item">
	                            	<div class="row">
	                                <c:forEach var="list" items="${eventlist2}" varStatus="status">
	                                	<div class="col-md-4">
	                                        <a href="EventDetailAction.eve?num=${list.event_num}">
	                                            <img src="resources/upload/${list.event_pic}" style="max-width:100%;">
	                                        </a>
	                                    </div>
	                                <c:if test="${status.last}">
	                                </div>
	                                </c:if>
	                                </c:forEach>
	                                <!--.row-->
	                            </div>
	                            </c:if>
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
				<div class="col-md-center">
					<font>등록된 이벤트가 없습니다.</font>
				</div>
			</div>
		</c:if>
	</div>
	
	<%-- 찾아오시는 길 --%>
	<div class="container" id="j_main_root">
		<div class="row">
			<div class="col-md-center j_event_title">찾아오시는 길</div>
		</div>
		<div class="row">
			<div class="col-md-8" id="j_map">
				카카오지도API 예정
			</div>
			<div class="col-md-4">
				<p class="j_room_name">스터디북</p>
				<p class="j_address">
					<br>
					<br>
					서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
					<br>
					<br>
					T: 1544-9970 / F: 02-722-0858
					<br>
					<br>
					<br>
					버스 : 우리은행 종로지점 정류장
					<br>
					<br>
					지선버스 163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62
					<br>
					<br>
					마을버스 7017 / 7021 / 7022
					<br>
					<br>
					간선버스 8110
					<br>
					<br>
					지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M
				</p>
			</div>
		</div>
	</div>
</body>
</html>