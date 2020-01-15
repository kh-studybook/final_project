<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
	<script src="resources/js/main.js"></script>
</head>
<body>
	<div id="m_main_header">
		<div>
			<p>"1월 스터디<br>공간 예약 서두르세요!"</p>
		</div>
		<div class="m_main_header_column">
			<div class="m_main_select" onClick="">
				<div class="m_write" id="m_write_date">
					<i class="far fa-calendar-alt"></i>
					모임 날짜
					<i class="fas fa-chevron-down"></i>
				</div>
				<div class="e_calendar">
            	<div class="month">
                	<a href="#" class="e_nav"> <i class="fas fa-angle-left"></i></a>
						<div>January <span class="year">2019</span></div>
                           <a href="#" class="e_nav"><i class="fas fa-angle-right"></i></a>
                        </div>
                        <div class="e_days">
                           <span>Mon</span> <span>Tue</span> <span>Wed</span> <span>Thu</span>
                           <span>Fri</span> <span>Sat</span> <span>Sun</span>
                        </div>
                        <div class="e_dates">
                           <button>
                              <time>1</time>
                           </button>
                           <button>
                              <time>2</time>
                           </button>
                           <button>
                              <time>3</time>
                           </button>
                           <button>
                              <time>4</time>
                           </button>
                           <button>
                              <time>5</time>
                           </button>
                           <button>
                              <time>6</time>
                           </button>
                           <button>
                              <time>7</time>
                           </button>
                           <button>
                              <time>8</time>
                           </button>
                           <button>
                              <time>9</time>
                           </button>
                           <button>
                              <time>10</time>
                           </button>
                           <button>
                              <time>11</time>
                           </button>
                           <button>
                              <time>12</time>
                           </button>
                           <button>
                              <time>13</time>
                           </button>
                           <button>
                              <time>14</time>
                           </button>
                           <button>
                              <time>15</time>
                           </button>
                           <button>
                              <time>16</time>
                           </button>
                           <button>
                              <time>17</time>
                           </button>
                           <button class="e_today">
                              <time>18</time>
                           </button>
                           <button>
                              <time>19</time>
                           </button>
                           <button>
                              <time>20</time>
                           </button>
                           <button>
                              <time>21</time>
                           </button>
                           <button>
                              <time>22</time>
                           </button>
                           <button>
                              <time>23</time>
                           </button>
                           <button>
                              <time>24</time>
                           </button>
                           <button>
                              <time>25</time>
                           </button>
                           <button>
                              <time>26</time>
                           </button>
                           <button>
                              <time>27</time>
                           </button>
                           <button>
                              <time>28</time>
                           </button>
                           <button>
                              <time>29</time>
                           </button>
                           <button>
                              <time>30</time>
                           </button>
                           <button>
                              <time>31</time>
                           </button>
            	</div>
        	</div>
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
	<div id="j_main_room">
		<p>스터디북의 추천공간</p>
		<c:forEach var="list" items="${list}" varStatus="status">
			<div class="card">
				<a href="Room_detail.ro?room_code=${list.ROOM_CODE}">
				<img class="card-img-top" src="resources/image/room/${list.FILE_NAME }">
				</a>
				<div class="card-body">
				<p class="card-text">
					<span class="j_room_name">${list.ROOM_NAME}</span>
				  	<span class="j_room_count">최대 ${list.MAX_MEMBER}인</span>
				  	<span class="j_room_pay"><span class="j_room_pay_hour">${list.HOUR_COST}</span> 원/시간</span>
				  	<span class="j_room_tag">${list.HASHTAG}</span>
				</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>