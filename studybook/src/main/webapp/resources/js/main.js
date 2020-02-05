$(document).ready(function(){
	$('.m_month').text(month());
	$('#m_write_date').click(function(){
		if($('.jsCalendar').css("display") == "none"){
			$('.jsCalendar').css("display", "inline-grid");
		} else {
			$('.jsCalendar').css("display", "none");
			$('.m_main_select').eq(0).css("position", "");
		}
	})
	
	$('.m_main_select').eq(1).click(function(){
		if($('#m_main_starttime').css("display") == 'none'){
			$('#m_main_starttime').css("display", "inline-grid");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(1).css("position", "relative");
		} else {
			$('#m_main_starttime').css("display", "none");
			$('.m_main_select').eq(1).css("position", "");
		}
	})
	
	$('.m_main_select').eq(2).click(function(){
		if($('#m_main_endtime').css("display") == 'none'){
			$('#m_main_endtime').css("display", "inline-grid");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(2).css("position", "relative");
		} else {
			$('#m_main_endtime').css("display", "none");
			$('.m_main_select').eq(2).css("position", "");
		}
	})
	
	$('.m_main_select').eq(3).click(function(){
		if($('#m_main_count').css("display") == 'none'){
			$('#m_main_count').css("display", "inline-grid");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(3).css("position", "relative");
		} else {
			$('#m_main_count').css("display", "none");
			$('.m_main_select').eq(3).css("position", "");
		}
	})
	
	// calendar 만들기
	// Get the element
    var element = document.getElementById("my-calendar");
    // Create the calendar
	var myCalendar = jsCalendar.new(element);
	
    // 검색 - 달력 눌렀을 때 날짜 표시
    myCalendar.onDateClick(function(event, date){
    	var date2str = jsCalendar.tools.dateToString(date, "yyyy-MM-DD");
    	var new_today = new Date();
    	var year = new_today.getFullYear();
    	var month = (1+new_today.getMonth());
    	var day = new_today.getDate();
    	var today = new Date(year+', '+month+', '+day);
    	
    	if(date.getTime()< today.getTime()){
    		alert('오늘 날짜부터 선택해주세요.');
    		return false;
    	} else {
	 		myCalendar.clearselect();
			myCalendar.select([date]);
    	}
    	
    	if(date.getTime() == today.getTime()){
    		var now_hour = new_today.getHours();
    		
    		$('#m_main_starttime ul li').each(function(){
    			var starttime = $(this).text();
    			var hour=starttime.substring(0, starttime.length-1);
    			if(parseInt(hour)-1 < parseInt(now_hour)){
    				$(this).addClass("m_black");
    			}
    		})
    		
    		$('#m_main_endtime ul li').each(function(){
    			var endtime = $(this).text();
    			var hour=endtime.substring(0, endtime.length-1);
    			if(parseInt(hour)-2 < parseInt(now_hour)){
    				$(this).addClass("m_black");
    			}
    		})
    	} else {
    		$('#m_main_starttime ul li').each(function(){
    			$(this).removeClass("m_black");
    		})
    		$('#m_main_endtime ul li').each(function(){
    			$(this).removeClass("m_black");
    		})
    	}
    	
    	$('#m_write_date').empty();
    	$('#m_write_date').append('<i class="far fa-calendar-alt"></i>');
    	$('#m_write_date').append(date2str);
    	$('#m_write_date').append('<i class="fas fa-chevron-down"></i>');
    	$('#m_write_date').css('padding','10px');
    	$('#m_write_date').css('font-weight','bold');
    	$('#m_write_date').css('font-size','18px');
    	$('.jsCalendar').css("display", "none");
    	$('#date').val(date2str);
    });
	
    // 검색 - 시간 눌렀을 때
	$('#m_main_starttime').children().children().click(function(){
		if($(this).hasClass('m_black')){
			alert('가능한 시간을 선택하세요.');
			return false;
		}
		var starttime = $(this).text();
		$('#m_write_starttime').empty();
		$('#m_write_starttime').append('<i class="far fa-clock"></i>');
		$('#m_write_starttime').append(starttime);
		$('#m_write_starttime').append('<i class="fas fa-chevron-down"></i>');
		$('#m_write_starttime').css('font-weight','bold');
		$('.m_write>i:nth-child(1)').css('margin-right', '0');
		$('.m_write>i:nth-child(2)').css('margin-left', '0');
		$(this).css('font-size', '14px');
		$('#starttime').val(starttime.substring(0, starttime.length-1));
	})
	
	$('#m_main_endtime').children().children().click(function(){
		if($(this).hasClass('m_black')){
			alert('가능한 시간을 선택하세요.');
			return false;
		}
		var endtime = $(this).text();
		$('#m_write_endtime').empty();
		$('#m_write_endtime').append('<i class="far fa-clock"></i>');
		$('#m_write_endtime').append(endtime);
		$('#m_write_endtime').append('<i class="fas fa-chevron-down"></i>');
		$('#m_write_endtime').css('font-weight','bold');
		$('.m_write>i:nth-child(1)').css('margin-right', '0');
		$('.m_write>i:nth-child(2)').css('margin-left', '0');
		$(this).css('font-size', '14px');
		$('#endtime').val(endtime.substring(0, endtime.length-1));
	})

	// 검색 - 인원 눌렀을 때
	$('#m_main_count').children().children().click(function(){
		$('#m_write_count').empty();
		$('#m_write_count').append('<i class="fas fa-user"></i>');
		$('#m_write_count').append($(this).text());
		$('#m_write_count').append('<i class="fas fa-chevron-down"></i>');
		$('#m_write_count').css('font-weight','bold');
		$('.m_write>i:nth-child(1)').css('margin-right', '0');
		$('.m_write>i:nth-child(2)').css('margin-left', '0');
		$(this).css('font-size', '14px');
	})
	
	$('#m_main_count').children().children().eq(0).click(function(){
		$('#MIN_MEMBER').val('');
		$('#MAX_MEMBER').val('4');
	})
	
	$('#m_main_count').children().children().eq(1).click(function(){
		$('#MIN_MEMBER').val('4');
		$('#MAX_MEMBER').val('');
	})
	
	$('#m_main_count').children().children().eq(2).click(function(){
		$('#MIN_MEMBER').val('8');
		$('#MAX_MEMBER').val('');
	})
	
	$('#m_main_count').children().children().eq(3).click(function(){
		$('#MIN_MEMBER').val('12');
		$('#MAX_MEMBER').val('');
	})
	
	$('.jsCalendar').css("width", $('#m_write_date'));
	$('#m_main_time').css("width", $('#m_write_time'));
	$('#m_main_count').css("width", $('#m_write_count'));
	
	$(document).resize(function(){
		$('.jsCalendar').css("width", $('#m_write_date'));
		$('#m_main_time').css("width", $('#m_write_time'));
		$('#m_main_count').css("width", $('#m_write_count'));
	})
    
    // carousel - optional
    $('#blogCarousel').carousel({
          interval: 3000
    });
    
    // 스터디 추천공간 1페이지 불러오기
    getList(1);
	
	// 카카오지도 api 시작
	// 카카오지도 api 키워드로 장소 검색하기
	var mapContainer = document.getElementById('j_map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('서울특별시 중구 남대문로 120', function(result, status) {
	    // 정상적으로 검색이 완료됐으면
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;font-weight:bold">StudyBook</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }
	     
	     $('#j_map').children().children().children().children().children().click(function(){
		   	 window.open("https://place.map.kakao.com/276378404");
		    })
			
		$('#j_map').children().children().children().children().children().css('cursor','pointer');
		// 카카오지도 api 끝
	});
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
})// ready() end

	function setPaging(href, digit){
		output+="<li class='page-item'>";
		gray = "";
		if (href  == "#") {
			gray=" current";// 현재 페이지에 회색이 나오도록 하기 위함
		}
		anchor = "<a class='page-link"+gray+"'" + href + ">" + digit + "</a></li>";
		output += anchor;
	}// setPaging() end
    
    function getList(page){
		$.ajax({
			type:"post",
			url:"getRoomList.net",
			data : {"page" : page},
			dataType:"json",
			cache: false,
			success:function(rdata){
				if(rdata.listcount > 0){
					$("#j_main_room").empty();
					output = "";
					output += '<p>스터디북의 추천공간</p>';
					output += '<div class="row">';
					$(rdata.roomlist).each(
						function(index, item){
							output += '<div class="col-md-4">';
							output += '<div class="wrapper">';
							output += '<div class="tile job-bucket">';
							output += '<div class="front">'
							output += '<div class="card" onClick="javascript:location.href=' + "'";
							output += 'room_detail.ro?room_code=' + item.room_CODE + "'" + '">';
							output += '<img class="card-img-top img-fluid rounded mx-auto d-block" src="resources/image/room/' + item.file_NAME + '">';
	  						output += '<div class="card-body">';
	  						output += '<p class="card-text">';
	  						output += '<span class="j_room_name">' + item.room_NAME + '</span>';
	  						output += '<span class="j_room_count">최대 ' + item.max_MEMBER + "인</span>";
	  						output += '</P>';
	  						output += '<p class="card-text">';
	  						output += '<span class="j_room_pay"><span class="j_room_pay_hour">' + item.hour_COST + '</span> 원/시간</span>';
	  						output += '<span class="j_room_tag">' + item.hashtag + '</span>';
	  						output += '</p></div></div></div></div></div></div>';
	  						if(index == rdata.roomlist.length-1){
	  							if((index+1)%3==1){
	  								output += '<div class="col-md-4"></div>';
	  		  						output += '<div class="col-md-4"></div>';
	  							} else if((index+1)%3==2){
	  								output += '<div class="col-md-4"></div>';
	  							}
	  						}
						})
					output += '</div>';
					output += '<br><br>';
					
					// 페이지네이션 시작
					output += '<div id = "center-block" class="center-block">';
					output += '<div class="row">';
					output += '<div class="col">';
					output += '<ul class="pagination">';
		            
		            digit = '&lt';
		            href="";   
		            if (rdata.page > 1) {
		               href = 'href=javascript:getList(' + (rdata.page - 1) + ')';
		            }
		            setPaging(href, digit);
		            
		            for (var i = rdata.startpage; i <= rdata.endpage; i++) {
		               digit = i;
		               href="#";
		               if (i != rdata.page) {
		                 href = 'href="javascript:getList(' + i + ')"';
		               }
		               setPaging(href, digit);
		            }
		            
		            digit = '&gt';
		            href="";
		            if (rdata.page < rdata.maxpage) {
		               href = 'href=javascript:getList(' + (rdata.page + 1) + ')';
		            } 
		            setPaging(href, digit);
		            
		            output += '</ul></div></div></div>'
		            
		            $("#j_main_room").append(output);
				} else {
					$("#j_main_room").empty();
					$("#j_main_room").append("<font size=5>등록된 방이 없습니다.</font>");
				}
			}, // success end
			error : function() {
		         console.log('roomlist ajax 에러')
		    }
		});// ajax end
	}// getList() end
    
    function search(){
    	var date = $('#date').val();
    	var starttime = $('#starttime').val();
    	var endtime = $('#endtime').val();
    	var MIN_MEMBER = $('#MIN_MEMBER').val();
    	var MAX_MEMBER = $('#MAX_MEMBER').val();
    	
    	if(date==''){
    		alert('날짜를 선택해 주세요');
    		return false;
    	}else if(starttime==''){
    		alert('시작 시간을 선택해 주세요');
    		return false;
    	}else if(endtime==''){
    		alert('끝나는 시간을 선택해 주세요');
    		return false;
    	} else if(parseInt(starttime) >= parseInt(endtime)){
    		alert('시간을 확인해 주세요');
    		return false;
    	} else if(MIN_MEMBER=='' && MAX_MEMBER==''){
    		alert('인원수를 선택해 주세요');
    		return false;
    	}    	
    	
    	window.location.href='RoomSearch.ro?date='+date+'&starttime='+starttime+'&endtime='+endtime
    	+'&MIN_MEMBER='+MIN_MEMBER+'&MAX_MEMBER='+MAX_MEMBER;
    }
    
    function month(){
    	const today = new Date();
    	const month = today.getMonth() + 1;
    	return month;
    }