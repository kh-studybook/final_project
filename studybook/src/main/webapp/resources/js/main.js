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
    
    function getList(){
		$.ajax({
			type:"post",
			url:"getRoomList.net",
			data : {"page" : page},
			dataType:"json",
			contentType:"application/json;charset=UTF-8",
			success:function(rdata){
				if(rdata.length>0){
					$(".front").empty();
					output = '';
					$(rdata).each(function(){
						output += '<div class="card" onClick="javascript:location.href=';
						output += 'room_detail.ro?room_code=' + this.ROOM_CODE + '">';
						output += '<img class="card-img-top img-fluid rounded mx-auto d-block" src="resources/image/room/' + this.FILE_NAME + '">';
  						output += '<div class="card-body">';
  						output += '<p class="card-text">';
  						output += '<span class="j_room_name">' + this.ROOM_NAME + '</span>';
  						output += '<span class="j_room_count">최대 ' + this.MAX_MEMBER + "인</span>";
  						output += '</P>';
  						output += '<p class="card-text">';
  						output += '<span class="j_room_pay"><span class="j_room_pay_hour">' + this.HOUR_COST + '</span> 원/시간</span>';
  						output += '<span class="j_room_tag">' + this.HASHTAG + '</span>';
  						output += '</p></div></div>';
						  						});
					$(".front").append(output);
				} else {
					$(".front").text("등록된 스터디룸이 없습니다.");
				}
			}
		});// ajax end
	}// function end

	$('.page-link').click(function(){
		getList();
	})
})