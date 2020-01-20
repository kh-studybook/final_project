<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="resources/css/room_detail.css" />
<link rel="stylesheet" type="text/css" href="resources/css/swiper.min.css" />
<link rel="stylesheet" href="resources/css/jsCalendar.css">
<script src="resources/js/jsCalendar.js"></script>
<script src="resources/js/swiper.min.js"></script>
<script src="resources/js/room_detail.js"></script>
</head>
<body>
<form action="room_reserve.re">
		<input type="hidden" name="room_code" id="room_code" value="2">
		<input type="hidden" name="mem_key" id="mem_key" value="${key}">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div class="e_inner_detail">
						<h2 class="e_room_name">${room.ROOM_NAME }</h2>
						<p class="e_sub-desc">${room.ROOM_INFO}</p>
						<div class="e_tags">
							
							<c:set var="keywordArr" value="${fn:split(room.HASHTAG,'#')}"></c:set>
							<c:forEach var="word" items="${keywordArr}">
 								<span class="e_tag">#${word}</span>
							</c:forEach>
												
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
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>


						<!-- 사진 밑 설명 부분 -->
						<div class="e_text_box">
							<h3 class="e_h_copy">${room.ROOM_INFO }</h3>
							<h4 class="e_h_intro">공간 소개</h4>
							<p class="e_p_intro">
								${room.ROOM_INTRO }
							</p>
						</div>
						<div class="e_text_box">
							<h4 class="e_h_intro">시설 안내</h4>
								${room.FAC_INTRO }
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">예약시 주의 사항</h4>
								
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">환불 규정</h4>
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">
								이용 후기 <span class="e_review_count"></span>
							</h4>

							<div class="e_review_box">
								<ul class="e_review_list">
									
			<%-- 
									<!-- 리뷰 1번째 -->
									<li class="e_rlist">
										<div class="e_rbox_mine">
											<div class="e_pf_info">
												<div class="e_pf_pic">
													<img src="resources/image/profile/default.png">
												</div>

												<h2 class="e_guest_name">긍졍화</h2>
											</div>
											<div class="e_review_info">
												<class="e_review_manage"> <a href="#">수정</a>/<a
													href="#">삭제</a>
											<div class="e_review_info">
												<span class="e_review_manage"> <a href="#">수정</a>/<a
													href="#">삭제</a>
												</span>
												<p class="e_p_review">너무 이쁘게 잘 꾸며놓으시고 좋았어요 ! 안에 식기류, 풍선,
													거울, 냉장고, 토스트기, 커피포트, 커피머신, 블루투스 스피커까지 다 있어요 ! 단점은 화장실이 없어서
													공원 화장실까지 가야한다는 건데 그래도 좋았어요 ㅎㅎㅎㅎ 파티 어떻게 준비해야 될지 모르시겠다면 이쁘게
													꾸며져있는 실버라 스튜디오 추천드려요 ✨💛</p>
												<!---->

												<div class="e_rbox_info_base">
													<span class="e_time_info"> 2020.01.09 23:12:50 </span>
												</div>
											</div>
										</div>
									</li>
									<!-- 리뷰 2 end -->

 --%>
								</ul>
								<div class="pagination p1">
									<ul>
		<!-- 							
										<a href="#"><li><</li></a>
										<a class="is-active" href="#"><li>1</li></a>
										<a href="#"><li>2</li></a>
										<a href="#"><li>3</li></a>
										<a href="#"><li>4</li></a>
										<a href="#"><li>5</li></a>
										<a href="#"><li>6</li></a>
										<a href="#"><li>></li></a>
										 -->
										 
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>

				<!-- 오른쪽 흰 배너 -->
				<div class="col-md-5">
					<div class="e_aside_outer">
						<div class="e_aside">
							<div class="e_right_room_detail">
								<h2 class="e_head">공간 정보</h2>
								<ul class="e_list_detail">
									<li><span class="e_tit">공간 유형</span> <span class="e_data">
											<span>${room.ROOM_TYPE}</span>
									</span></li>

									<li><span class="e_tit">예약시간</span> <span class="e_data">
											최소 1시간 부터 </span></li>

									<li><span class="e_tit">예약인원</span> <span class="e_data">최소
											${room.MIN_MEMBER }명~최대 ${room.MAX_MEMBER }명 </span></li>
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
								<h2 class="e_head">
									날짜 선택
									<div class="e_head_right">
										<span id="reserve_date_span"></span> 
										<input type="hidden" name="reserve_date" id="reserve_date">
									</div>
								</h2>

									
								<div id="my-calendar" date-format="yyyy-##-dd"></div>									
								
								
							</div>
							
								<div class="e_color_desc">
									<span class="e_color_disable">예약불가</span> <span
										class="e_color_today">오늘</span> <span class="e_color_select">선택</span>
								</div>

							
								<h2 class="e_head">
									시간 선택
									<p class="e_plus_num">1시간당 <span id="time_price">${room.HOUR_COST }</span>원</p>
									<div class="e_head_right_div">
										<span class="select_date" id="start_time_span">0</span>시 ~ 
										<span class="select_date" id="end_time_span">0</span>시 , 
											<span class="select_time" id="select_time_span">0</span>시간
									</div>
								</h2>
								<!-- 시간 선택 -->

								<div class="swiper-container">
									<div class="swiper-wrapper">
										<div class="swiper-slide"><input type="hidden" id="9" value="9">9:00</div>
										<div class="swiper-slide"><input type="hidden" id="10" value="10">10:00</div>
										<div class="swiper-slide"><input type="hidden" id="11" value="11">11:00</div>
										<div class="swiper-slide"><input type="hidden" id="12" value="12">12:00</div>
										<div class="swiper-slide"><input type="hidden" id="13" value="13">13:00</div>
										<div class="swiper-slide"><input type="hidden" id="14" value="14">14:00</div>
										<div class="swiper-slide"><input type="hidden" id="15" value="15">15:00</div>
										<div class="swiper-slide"><input type="hidden" id="16" value="16">16:00</div>
										<div class="swiper-slide"><input type="hidden" id="17" value="17">17:00</div>
										<div class="swiper-slide"><input type="hidden" id="18" value="18">18:00</div>
										<div class="swiper-slide"><input type="hidden" id="19" value="19">19:00</div>
										<div class="swiper-slide"><input type="hidden" id="20" value="20">20:00</div>
										<div class="swiper-slide"><input type="hidden" id="21" value="21">21:00</div>
										<div class="swiper-slide"><input type="hidden" id="22" value="22">22:00</div>
									</div>
								</div>

									<!-- 시간 선택 끝 -->
									<!-- e_room_reserve end -->
									<div class="e_num_count">
										<h2 class="e_head">
											추가 예약 인원
											<p class="e_plus_num">1명 추가시 시간당 1000원</p>
										</h2>
										<div class="input-group number-spinner">
											<span class="input-group-btn">
												<button class="btn btn-default" data-dir="dwn">
													<span class="glyphicon glyphicon-minus">-</span>
												</button>
											</span> <input type="text" class="form-control text-center"
												value="0"> <span class="input-group-btn">
												<button class="btn btn-default" data-dir="up">
													<span class="glyphicon glyphicon-plus">+</span>
												</button>
											</span>
										</div>
									</div>

									<div class="e_total_price_div">
										<div class="e_price_div">
											<span class="e_price_name">공간 이용료</span> <span
												class="e_price"><span id="total_time_price">0</span>원</span>
										</div>
										<div class="e_price_div">
											<span class="e_price_name">추가 인원(<span name="extra_num" id="extra_num">0</span>명)</span> 
											<span class="e_price"><span name="extra_num_price" id="extra_num_price">0</span>원</span>
										</div>
										<hr>
										<div class="e_price_div">
											<span class="e_total_price"><span name="total_cost" id="total_price">0</span>원</span>
											<input type="hidden" name="total_cost">
										</div>
									</div>

									<div class="e_to_reserve_button">
										<button type="submit"
											class="e_to_reserve_page">예약하기</button>
									</div>
								</div>
								<!-- aside end -->
							</div>
						</div><!-- col-md-5 end -->
					</div>
				</div>
			</form>
	
	<script>

	var swiper = new Swiper('.swiper-container', {
    slidesPerView: 5,
    spaceBetween: 5,    
  });
  
// Get the element
  var element = document.getElementById("my-calendar");
  // Create the calendar
  var myCalendar=jsCalendar.new(element, "now",{
		 	  // language
  	  language : "en",
  	  // Enable/Disable date's number zero fill
  	  zeroFill : false,
  	  // Custom month string format
  	  // month: Month's full name "February"
  	  // ##: Month's number  "02"
  	  // #: Month's number  "2"
  	  // YYYY: Year  "2017"
  	  monthFormat : "month YYYY",
  	  // Custom day of the week string forma
  	  // day: Day's full name "Monday"
  	  // DDD: Day's first 3 letters "Mon"
  	  // DD: Day's first 2 letters "Mo"
  	  // D: Day's first letter  "M"
  	  dayFormat : "DDD",  	  
  	  // 1 = monday
  	  firstDayOfTheWeek: 1,
  	  // Enable/Disable month's navigation buttons.
  	  navigator : true,
  	  // both | left | right
  	  navigatorPosition : "both",
  	  // min date
	   	  // max date
	   	  min : "now",
  	  max : false  
  	});
 
  function formatDate(date) {
  	var weekName = ["일", "월", "화", "수", "목", "금", "토"];
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear(),
		        E =d.getDay();

		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;

		    return [year, month, day].join('-')+"("+ weekName[E]+")";
		}
  
 		myCalendar.onDateClick(function(event, date){
 		
 	 	
 		if(date<"now"){
 			alert("다음날짜를 골라주세요");
 		}
  	 $("#reserve_date_span").text(formatDate(date));
  	 $("#reserve_date").val(formatDate(date));
  	 myCalendar.clearselect();
  	 myCalendar.select([date]);
  	 
  	});
</script>


</body>
</html>
