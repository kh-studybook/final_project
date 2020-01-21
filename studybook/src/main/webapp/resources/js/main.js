$(document).ready(function(){
	$('#m_write_date').click(function(){
		if($('.jsCalendar').css("display") == "none"){
			$('.jsCalendar').css("display", "inline-grid");
		} else {
			$('.jsCalendar').css("display", "none");
			$('.m_main_select').eq(0).css("position", "");
		}
	})
	
	$('.m_main_select').eq(1).click(function(){
		if($('#m_main_time').css("opacity") == '0'){
			$('#m_main_time').css("opacity", "1");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(1).css("position", "relative");
		} else {
			$('#m_main_time').css("opacity", "0");
			$('.m_main_select').eq(1).css("position", "");
		}
	})
	
	$('.m_main_select').eq(2).click(function(){
		if($('#m_main_count').css("opacity") == '0'){
			$('#m_main_count').css("opacity", "1");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(2).css("position", "relative");
		} else {
			$('#m_main_count').css("opacity", "0");
			$('.m_main_select').eq(2).css("position", "");
		}
	})
	
	$('#my-calendar>table>tbody>tr>td').click(function(){
		$('#m_write_date').empty();
		$('#m_write_date').append($(this).text());
		$('#m_write_date').append(" ");
		$('#m_write_date').append($('.jsCalendar-title-name').text())
		$('#m_write_date').append('<i class="fas fa-chevron-down"></i>');
		$('#m_write_date').css('padding','10px');
		$('.jsCalendar').css("display", "none");
	})
	
	$('#m_main_time').children().children().click(function(){
		$('#m_write_time').empty();
		$('#m_write_time').append($(this).text());
		$('#m_write_time').append('<i class="fas fa-chevron-down"></i>');
		$(this).parent().parent().prev().css('padding','10px');
	})
	
	$('#m_main_count').children().children().click(function(){
		$('#m_write_count').empty();
		$('#m_write_count').append($(this).text());
		$('#m_write_count').append('<i class="fas fa-chevron-down"></i>');
		$(this).parent().parent().prev().css('padding','10px');
	})
	
	$('.jsCalendar').css("width", $('#m_write_date'));
	$('#m_main_time').css("width", $('#m_write_time'));
	$('#m_main_count').css("width", $('#m_write_count'));
	
	// Get the element
    var element = document.getElementById("my-calendar");
    // Create the calendar
    jsCalendar.new(element, "16/01/2020",{
            // language
         language : "ko",
         // Enable/Disable date's number zero fill
         zeroFill : false,
         // Custom month string format
         // month: Month's full name "February"
         // ##: Month's number "02"
         // #: Month's number "2"
         // YYYY: Year "2017"
         monthFormat : "month YYYY",
         // Custom day of the week string forma
         // day: Day's full name "Monday"
         // DDD: Day's first 3 letters "Mon"
         // DD: Day's first 2 letters "Mo"
         // D: Day's first letter "M"
         dayFormat : "DDD",
         // 1 = monday
         firstDayOfTheWeek: 1,
         // Enable/Disable month's navigation buttons.
         navigator : true,
         // both | left | right
         navigatorPosition : "both",
         // min date
           // max date
         max : false  
       });

    // carousel - optional
    $('#blogCarousel').carousel({
          interval: 5000
    });
    
    // 숫자 3자리마다 , 붙이는 함수
    function numberFormat(inputNumber) {
	    // return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	return Number(inputNumber).toLocalString('en').split(".")[0];
    }
    
    $('.page-link').click(function(){
		console.log(".page-link");
		if(this.innerText == '>'){
			var page = 2
		} else {
			var page = this.innerText;
		}
		getList(page);
	})
	
	/*
	//카카오지도 api 사용
	var container = document.getElementById('j_map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	//카카오지도 api 검색 사용
	var places = new kakao.maps.services.Places();
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	    }
	};

	places.keywordSearch('KH정보교육원 종로지점', callback);
	*/
	
	
	//카카오지도 api 키워드로 장소 검색하기
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
	});    
})//ready() end

	function setPaging(href, digit){
		output+="<li class='page-item'>";
		gray = "";
		if (href  == "#") {
			gray=" current";//현재 페이지에 회색이 나오도록 하기 위함
		}
		anchor = "<a class='page-link"+gray+"'" + href + ">" + digit + "</a></li>";
		output += anchor;
		console.log(output)
	}//setPaging() end
    
    function getList(page){
		console.log('page = ' + page);
		$.ajax({
			type:"post",
			url:"getRoomList.net",
			data : {"page" : page},
			dataType:"json",
			cache: false,
			success:function(rdata){
				console.log(rdata);
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
							output += '<div class="card" onClick="javascript:location.href=';
							output += 'room_detail.ro?room_code=' + item.room_CODE + '">';
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
						})
					output += '</div>';
					output += '<br><br>';
					
					//페이지네이션 시작
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
		            setPaging( href, digit);
		            
		            output += '</ul></div></div></div>'
		            
		            $("#j_main_room").append(output);
				} else {
					$(".front").empty();
					$(".front").append("<font size=5>등록된 이벤트가 없습니다.</font>");
				}
			}, //success end
			error : function() {
		         console.log('roomlist ajax 에러')
		    }
		});// ajax end
	}// getList() end