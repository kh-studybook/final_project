<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script>
	$(document).on(
			'click',
			'.number-spinner button',
			function() {
				var btn = $(this), oldValue = btn.closest('.number-spinner')
						.find('input').val().trim(), newVal = 0;

				if (btn.attr('data-dir') == 'up') {
					newVal = parseInt(oldValue) + 1;

				} else {
					if (oldValue > 1) {
						newVal = parseInt(oldValue) - 1;

					} else {
						newVal = 1;
					}
				}
				btn.closest('.number-spinner').find('input').val(newVal);
				$("#extra_num").text(newVal);
				$("#extra_num_price").text(1000*newVal);
				var extra_price=$("#extra_num_price").text();
				var room_price=$("#total_time_price").text();
				$("#total_price").text(parseInt(extra_price)+parseInt(room_price));
				return false;
			});
	
	
	
	$(document).ready(function(){
		var time_check=0;
		$(".swiper-slide").click(function(){
			
			if(time_check==0){
				
				$(".swiper-slide").css("background","#57D7D5");
				$(".swiper-wrapper").find('input').removeAttr('name');
				
				var time=$(this).find($("input")).val();
				console.log("시작시간"+time)
				$(this).css("background","#855FD4");
				$(this).find($("input")).attr("name","start_time");
				time_check=1;
				
			}else if(time_check==1){
				var time2=$(this).find($("input")).val();
				console.log("종료시간"+time2)
				$(this).find($("input")).attr("name","end_time");
				
				var start_time=$(".swiper-slide").find($("input[name=start_time]")).val();
				$("#start_time_span").text(start_time);	
				var end_time=$(".swiper-slide").find($("input[name=end_time]")).val();
				$("#end_time_span").text(end_time);
				
				var total_time=end_time-start_time;
				$("#select_time_span").text(total_time);
				var time_price=$("#time_price").text();
				$("#total_time_price").text((time_price*total_time));
				
				
					for(var i=parseInt(start_time);i<=parseInt(end_time);i++){
						console.log("for문의 i값="+i)
						console.log($(".swiper-slide").find($("input[id="+i+"]")).val());
						$(".swiper-slide").find($("input[id="+i+"]")).parent().css("background","#855FD4");
					}
				var extra_price=$("#extra_num_price").text();
				var room_price=$("#total_time_price").text();
				$("#total_price").text(parseInt(extra_price)+parseInt(room_price));
				time_check=0;
			}
		});
		
	});
</script>


</head>
<body>
	<form action="room_reserve.ro">
		<input type="hidden" name="room_code" value="${room_code }">
		<div class="container">
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

						<div class="e_text_box">
							<h4 class="e_h_intro">
								이용 후기 <span class="e_review_count">10개</span>
							</h4>

							<div class="e_review_box">
								<ul class="e_review_list">
									<!-- 리뷰 1번째 -->
									<li class="e_rlist">
										<div class="e_rbox_mine">
											<div class="e_pf_info">
												<div class="e_pf_pic">
													<img src="resources/image/profile/default.png"
														style="width: 80px;">
												</div>

												<h2 class="e_guest_name">긍졍화</h2>
											</div>
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
									<!-- 리뷰 1 end -->

									<!-- 리뷰 2번째 -->
									<li class="e_rlist">
										<div class="e_rbox_mine">
											<div class="e_pf_info">
												<div class="e_pf_pic">
													<img src="resources/image/profile/default.png"
														style="width: 80px;">
												</div>

												<h2 class="e_guest_name">긍졍화</h2>
											</div>
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



								</ul>


								<div class="pagination p1">
									<ul>
										<a href="#"><li><</li></a>
										<a class="is-active" href="#"><li>1</li></a>
										<a href="#"><li>2</li></a>
										<a href="#"><li>3</li></a>
										<a href="#"><li>4</li></a>
										<a href="#"><li>5</li></a>
										<a href="#"><li>6</li></a>
										<a href="#"><li>></li></a>
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
								<h2 class="e_head">
									날짜 선택
									<div class="e_head_right">
										<span id="reserve_date_span">2019-12-18</span> <input
											type="hidden" name="reserve_date" id="reserve_date">
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
									<p class="e_plus_num">1시간당 <span id="time_price">10000</span>원</p>
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
											<span class="e_price_name">추가 인원(<span id="extra_num">0</span>명)</span> 
											<span class="e_price"><span id="extra_num_price">0</span>원</span>
										</div>
										<hr>
										<div class="e_price_div">
											<span class="e_total_price"><span id="total_price">0</span>원</span>
											<input type="hidden" name="total_cost">
										</div>
									</div>

									<div class="e_to_reserve_button">
										<button type="submit" onclick="room_reserve.ro"
											class="e_to_reserve_page">예약하기</button>
									</div>
								</div>
								<!-- aside end -->
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>
	
 <script src="resources/js/swiper.min.js"></script>
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
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;

		    return [year, month, day].join('-');
		}
   
   	myCalendar.onDateClick(function(event, date){
    	 $("#reserve_date_span").text(formatDate(date));
    	 console.log(this)
    	 
    	});

   

  </script>

</body>
</html>
