<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="resources/css/room_detail.css" />


</head>
<body>
	<div class="row">
		<div class="col-md-7">
			<div class="e_inner_detail">
				<h2 class="e_room_name">ROOM 512</h2>
				<p class="e_sub-desc">ROOM 512 간단 소개 부분 입니당</p>
				<div class="e_tags">
					<span class="e_tag">#스터디</span> <span class="e_tag">#회의</span> <span
						class="e_tag">#세미나</span>
				</div>

				<div class="e_container">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="resources/image/default_thumnail.png" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="resources/image/default_thumnail.png" alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="resources/image/default_thumnail.png" alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>


				<!-- 사진 밑 설명 부분 -->
				<div class="e_text_box">
					<h3 class="e_h_copy">ROOM 512 간단 소개 부분 입니당</h3>
					<h4 class="e_h_intro">공간 소개</h4>
					<p class="e_p_intro">
						-공간 소개1<br> -공간 소개2<br> -공간 소개3<br>
					</p>
				</div>
				<div class="e_text_box">
					<h4 class="e_h_intro">시설 안내</h4>

				</div>

				<div class="e_text_box">
					<h4 class="e_h_intro">예약시 주의 사항</h4>

				</div>

				<div class="e_text_box">
					<h4 class="e_h_intro">환불 규정</h4>

				</div>
			</div>
		</div>

		<!-- 오른쪽 흰 배너 -->
		<div class="col-md-5">
			<div class="e_aside">
				<div class="e_right_room_detail">
					<h2 class="e_head">공간 정보</h2>
					<ul class="e_list_detail">
						<li><span class="e_tit">공간 유형</span> <span class="e_data">
								<span>회의실</span> <span>세미나실</span> <span>스터디룸</span>
						</span></li>

						<li><span class="e_tit">예약시간</span> <span class="e_data">최소
								1시간 부터 </span></li>

						<li><span class="e_tit">예약인원</span> <span class="e_data">최소
								1명~최대 24명 </span></li>
					</ul>

					<div class="e_facility_wrap">
						<ul class="e_facility_list">
							<li><i class="sp_icon ico_table"></i> <span
								class="e_txt_name">의자/<em class="br">테이블</em></span></li>
							<li><i class="sp_icon ico_mirror"></i> <span
								class="e_txt_name">전신거울<!----></span></li>
							<li><i class="sp_icon ico_food"></i> <span
								class="e_txt_name">음식물<em class="br">반입가능</em></span></li>
							<li><i class="sp_icon ico_nonsmocking"></i> <span
								class="e_txt_name">금연<!----></span></li>
							<li><i class="sp_icon ico_tvnprojector"></i> <span
								class="e_txt_name">TV/<em class="br">프로젝터</em></span></li>
							<li><i class="sp_icon ico_wifi"></i> <span
								class="e_txt_name">인터넷/<em class="br">WIFI</em></span></li>
						</ul>
					</div>
				</div>

				<div class="e_room_reserve">
					<h2 class="e_head">날짜 선택</h2>
					<div class="e_calendar_out">
					<div class="e_calendar">
						<div class="month">
							<a href="#" class="e_nav"> <i class="fas fa-angle-left"></i></a>

							<div>
								January <span class="year">2019</span>
							</div>
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
					</div> <!-- e_calendar end -->
					</div>
					
					<div class="e_color_desc">
						<span class="e_color_disable">예약불가</span> 
						<span class="e_color_today">오늘</span>
						<span class="e_color_select">선택</span>
					</div>
				
					<h2 class="e_head">시간 선택</h2>
						<div class="wrap">

  <div class="scrollbar">
    <div class="handle">
      <div class="mousearea"></div>
    </div>
  </div>

  <div class="frame" id="basic">
    <ul class="clearfix">
      <li>9</li>
      <li>10</li>
      <li>11</li>
      <li>12</li>
      <li>13</li>
      <li>14</li>
      <li>15</li>
      <li>16</li>
      <li>17</li>
      <li>18</li>
      <li>19</li>
      <li>20</li>
      <li>21</li>
      <li>22</li>
      <li>23</li>

    </ul>
  </div>
				</div>
				<!-- e_room_reserve end -->
			</div>
			<!-- aside end -->
		</div>
	</div>
	</div>
	
</body>
</html>
