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
<form action="room_reserve_page.re" method="post">
		<input type="hidden" name="room_code" id="room_code" value="${room.ROOM_CODE }">
		<c:if test="${!empty mem_key}">
		<input type="hidden" name="mem_key" id="mem_key" value="${mem_key}">
		</c:if>
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
								<c:forEach var="gallery" items="${gallerylist}" varStatus="status">
									<li data-target="#carouselExampleIndicators" data-slide-to="${status.index}"
										class="active"></li>
								</c:forEach>
								</ol>
								<div class="carousel-inner">
									<c:forEach var="gallery" items="${gallerylist}" varStatus="status">
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="resources/image/room/${gallery.FILE_NAME }" alt="First slide">
									</div>
									</c:forEach>
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
							<p class="e_p_intro">
								${room.FAC_INTRO }
							</p>
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">예약시 주의 사항</h4>
							<ol class="e_info_list">
								<li>
								<Strong class="e_tit">1</Strong>
								<span class="e_data">빔프로젝터가 필요할 경우 반드시 사전에 요청해주시기 바랍니다.</span>
								</li>
								<li>
								<Strong class="e_tit">2</Strong>
								<span class="e_data">이용 2시간 전 이용관련 상세 안내 문자 드립니다.</span>
								</li>
								<li>
								<Strong class="e_tit">3</Strong>
								<span class="e_data">공간의 기물파손시에는 해당하는 비용이 청구될 수 있습니다.</span>
								</li>
								<li>
								<Strong class="e_tit">4</Strong>
								<span class="e_data">9:00 ~ 22:00  외 이용 필요 시 전화 문의 주세요.</span>
								</li>
								<li>
								<Strong class="e_tit">5</Strong>
								<span class="e_data">무인으로 운영되어 CCTV가 설치 되어있으며 분실, 파손, 입실, 퇴실 여부만 확인하는 용도로 사용하고 있습니다.</span>
								</li>
								
							</ol>
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">환불 규정</h4>
								<p class="e_txt_notice e_refund">
								이용당일(첫 날) 이후에 환불 관련 사항은 전화로 직접 문의하셔야 합니다.<br>
								결제 후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)
								</p>
							<ol class="e_info_list">
								<li><strong class="e_tit">이용 8일 전</strong>
								 <span class="e_data">총 금액의 100% 환불</span> 
								 </li>
								 <li><strong class="e_tit">이용 7일 전</strong> 
								 <span class="e_data">총 금액의 90% 환불</span>
								 </li>
								 <li><strong class="e_tit">이용 6일 전</strong> 
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 5일 전</strong> 
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 4일 전</strong>
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 3일 전</strong>
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 2일 전</strong>
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 전날</strong>
								 <span class="e_data">환불 불가</span>
								 </li>
								 <li><strong class="e_tit">이용 당일</strong>
								 <span class="e_data">환불 불가</span>
								 </li>
								</ol>
						</div>

						<div class="e_text_box">
							<h4 class="e_h_intro">
								이용 후기 <span class="e_review_count"></span>
							</h4>

							<div class="e_review_box">
								<ul class="e_review_list">
									
								</ul>
								<div class="pagination p1">
									<ul>
										 
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
											최소 ${room.MIN_HOUR }시간 부터 </span></li>

									<li><span class="e_tit">예약인원</span> <span class="e_data">최소
											${room.MIN_MEMBER }명~최대 ${room.MAX_MEMBER }명 </span></li>
								</ul>

								<div class="e_facility_wrap">
									<ul class="e_facility_list">
										<c:if test="${room_ex.ALCOHOL==1}">
										<li><i class="sp_icon ico_alcohol"><img src="resources/image/room_ex/alcohol.PNG"></i> 
										<span class="e_txt_name">주류<em class="br">반입</em></span></li>
										</c:if>
										<c:if test="${room_ex.MIC==1}">
										<li><i class="sp_icon ico_table"><img src="resources/image/room_ex/mic.PNG"></i> <span
											class="e_txt_name">마이크/<em class="br">음향</em></span></li>
										</c:if>
										
										<c:if test="${room_ex.CHAIR==1}">
										<li><i class="sp_icon ico_food"><img src="resources/image/room_ex/chair.PNG"></i> <span
											class="e_txt_name">의자/<em class="br">테이블</em></span></li>
										</c:if>
										<c:if test="${room_ex.FOOD==1}">
										<li><i class="sp_icon ico_nonsmocking"><img src="resources/image/room_ex/food.PNG"></i> <span
											class="e_txt_name">음식물<em class="br">반입</em></span></li>
										</c:if>
										<c:if test="${room_ex.TOILET==1}">
										<li><i class="sp_icon ico_nonsmocking"><img src="resources/image/room_ex/toilet.PNG"></i> <span
											class="e_txt_name">내부<em class="br">화장실</em></span></li>
										</c:if>
										<c:if test="${room_ex.SMOKING==1}">
										<li><i class="sp_icon ico_nonsmocking"><img src="resources/image/room_ex/smoking.PNG"></i> <span
											class="e_txt_name">금연<!----></span></li>
										</c:if>
										<c:if test="${room_ex.PARKING==1}">
										<li><i class="sp_icon ico_nonsmocking"><img src="resources/image/room_ex/parking.PNG"></i> <span
											class="e_txt_name">주차<!----></span></li>
										</c:if>
										<c:if test="${room_ex.TV==1}">
										<li><i class="sp_icon ico_tvnprojector"><img src="resources/image/room_ex/tv.PNG"></i> <span
											class="e_txt_name">TV/<em class="br">프로젝터</em></span></li>
										</c:if>
										<c:if test="${room_ex.BOARD==1}">
										<li><i class="sp_icon ico_tvnprojector"><img src="resources/image/room_ex/board.PNG"></i> <span
											class="e_txt_name">화이트보드</em></span></li>
										</c:if>
										<c:if test="${room_ex.WIFI==1}">
										<li><i class="sp_icon ico_wifi"><img src="resources/image/room_ex/wifi.PNG"></i> <span
											class="e_txt_name">인터넷/<em class="br">WIFI</em></span></li>
										</c:if>
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

									
								<div id="my-calendar"></div>									
								
								
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
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="9" value="9">09:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="10" value="10">10:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="11" value="11">11:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="12" value="12">12:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="13" value="13">13:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="14" value="14">14:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="15" value="15">15:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="16" value="16">16:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="17" value="17">17:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="18" value="18">18:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="19" value="19">19:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="20" value="20">20:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="21" value="21">21:00</div>
										<div class="swiper-slide"><input type="hidden" name="time_slide" id="22" value="22">22:00</div>
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
											<span class="e_price_name">추가 인원(<span name="extra_num_span" id="extra_num_span">0</span>명)</span> 
											<span class="e_price"><span name="extra_num_price" id="extra_num_price">0</span>원</span>
											<input type="hidden" name="extra_num" id="extra_num" value="0">
										</div>
										<hr>
										<div class="e_price_div">
											<span class="e_total_price"><span name="total_cost_span" id="total_cost_span">0</span>원</span>
											<input type="hidden" name="total_cost" id="total_cost" >
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

		    return [year, month, day].join('.')+"("+ weekName[E]+")";
		}
  
 		myCalendar.onDateClick(function(event, date){
 			$(".swiper-wrapper").find('input').attr("name","time_slide");
 			$(".swiper-slide").removeClass("not_active");
 			$(".swiper-slide").removeClass("active");
 	 		console.log("클릭한 날짜 :"+formatDate(date))
 	 		var today=new Date();
 	 		console.log("오늘:"+formatDate(today))
 				if(formatDate(date)<formatDate(today)){
 					alert("오늘 이후를 골라주세요");
 					
 				}else{
  				$("#reserve_date_span").text(formatDate(date));
  	 			$("#reserve_date").val(formatDate(date));
  	 			myCalendar.clearselect();
  				myCalendar.select([date]);
  				
  				//날짜별로 예약되어있는 시간 알아내기
  				
  				$(".swiper-slide").removeClass("not_active");
  				var search="room_code="+${room.ROOM_CODE}+"&search_date="+formatDate(date).substring(0,10);
  				reserve_ajax(search);
  	 		
  				
  				
  				
  				
 			}
  				
  				
  	 
  	});
</script>


</body>
</html>
