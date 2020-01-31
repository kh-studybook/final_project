<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 캘린더 css 불러오기 -->
	<link rel="stylesheet" href="resources/css/jsCalendar.css">
	<!-- room_search css 불러오기 -->
	<link rel="stylesheet" type="text/css" href="resources/css/room_search.css" />
	<!-- 캘린더 js 불러오기 -->
	<script src="resources/js/jsCalendar.js"></script>
	<!-- room_search.js 불러오기 -->
	<script src="resources/js/room_search.js"></script>
</head>
<body>
<div id="m_hidden">
	<input type="hidden" name="date" id="date" value="${date}">
	<input type="hidden" name="starttime" id="starttime" value="${starttime}">
	<input type="hidden" name="endtime" id="endtime" value="${endtime}">
	<input type="hidden" name="MIN_MEMBER" id="MIN_MEMBER" value="${MIN_MEMBER}">
	<input type="hidden" name="MAX_MEMBER" id="MAX_MEMBER" value="${MAX_MEMBER}">
</div>
<div id="m_main_header">
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
		
	</div>
</body>
</html>