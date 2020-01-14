<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
</head>
<body>
	<div id="m_main_header">
		<div>
			<p>"1월 스터디<br>공간 예약 서두르세요!"</p>
		</div>
		<div class="m_main_header_column">
			<div class="m_main_select" onClick="">
				<i class="far fa-calendar-alt"></i>
				모임 날짜
				<i class="fas fa-chevron-down"></i>
			</div>
			<div class="m_main_select" onClick="">
				<i class="far fa-clock"></i>
				시간
				<i class="fas fa-chevron-down"></i>
			</div>
			<div class="m_main_select" onClick="">
				<i class="fas fa-user"></i>
				인원
				<i class="fas fa-chevron-down"></i>
			</div>
			<button id="m_main_search" class="m_main_select">검색</button>
		</div>
		<div class="m_main_header_column">
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
        	<div id="m_main_time">
	        	<input type="checkbox" id="m_main_time_all" name="m_main_time" />
			    <label for="m_main_time_all"><span></span>전체</label>
				<p></p>
		
			    <input type="checkbox" id="m_main_time_morning" name="m_main_time" />
			    <label for="m_main_time_morning"><span></span>오전(09~12시)</label>
			    <p></p>
			    
			    <input type="checkbox" id="m_main_time_afternoon" name="m_main_time" />
			    <label for="m_main_time_afternoon"><span></span>오후(12~18시)</label>
			    <p></p>
			    
			    <input type="checkbox" id="m_main_time_evening" name="m_main_time" />
			    <label for="m_main_time_evening"><span></span>저녁(18~22시)</label>
        	</div>
        	<div id="m_main_time">
        		<input type="checkbox" id="m_main_count_1" name="m_main_count" />
			    <label for="m_main_count_1"><span></span>4명 이하</label>
				<p></p>
				
			    <input type="checkbox" id="m_main_count_4" name="m_main_count" />
			    <label for="m_main_count_4"><span></span>4 ~ 8명</label>
			    <p></p>
			    
			    <input type="checkbox" id="m_main_count_8" name="m_main_count" />
			    <label for="m_main_count_8"><span></span>8 ~ 12명</label>
			    <p></p>
			    
			    <input type="checkbox" id="m_main_count_12" name="m_main_count" />
			    <label for="m_main_count_12"><span></span>12명 이상</label>
        	</div>
        	<div class="m_main_result"></div>
		</div>
	</div>
</body>
</html>