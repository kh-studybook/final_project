<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
body {background-color: #f2f2f2 !important;}
* {font-family:"맑은 고딕"}

/** 글자 관련!!!!*/
.p_title{font-family:"맑은 고딕"; text-align:center; font_size:32px; maxLength:20}
.p_p_title {font-family: "맑은 고딕";text-align: center;font-size: 14px;}
#event_title{maxLength:200; font-size:14px !important}
#p_event_content{font-size : 12px; font-color : #7F7F7F;  maxLength : 4000; height:200px;}
textarea::placeholder, select, input[type=text]::placeholder{color:black; font-size:14px !important;}
.col-25 > label {font-weight:bold;}
#event_room option:eq(0){font-size:12px}

/** 입력 폼 관련*/
input[type=text], select, textarea {width: 100%; padding: 12px; border-radius: 4px; resize: vertical; border:1px solid darkgray}
.pp > label {display: inline-block;}
input[type=date]{height:3rem;}

/** 버튼 관련*/
.p_submit, .p_reset{width:20%; padding: 7px; border: none; border-radius: 4px; cursor: pointer; opacity:0.7}
.p_submit{background-color: #7F56D2; color:white;}
.p_reset{background-color: #d2d2d2;} 
.p_submit:hover, .p_reset:hover{opacity:1}
#eventPic_uploadfile{border: none;}

/** 전체 폼 관련*/
.p {border-radius: 5px; padding: 20px;}
.col-25 {float: left; width: 25%; margin-top: 6px;}
.col-75 {float: left; width: 75%; margin-top: 6px;}

/** 썸네일 관련*/
.p_avatar{width:200px; height:200px; border: 1px solid darkgray;}
#eventPic_button{border:none; border-radius: 5px; display:inline-block; width:200px; cursor:pointer;
				background-color:#56D7D6; color:white; padding:7px; margin-top:5px; padding-right:0px; text-align:center;}

.navbar-brand{display: flex !important; font-size: 24px !important; width: 150px; padding:0px}

/* Clear floats after the columns */
.row:after { content: ""; display: table; clear: both;}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {.col-25, .col-75, input[type=submit] {width: 100%;margin-top: 0;}}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src = "https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

	<!-- 캘린더 css 불러오기 -->
	<link rel="stylesheet" href="resources/css/jsCalendar.css">
	<!-- main css 불러오기 -->
	<link rel="stylesheet" type="text/css" href="resources/css/main2.css" />
	<!-- 캘린더 js 불러오기 -->
	<script src="resources/js/jsCalendar.js"></script>

<script>
	$(function(){
		$('#m_write_date').click(function(){
			if($('.jsCalendar').css("display") == "none"){
				$('.jsCalendar').css("display", "inline-grid");
			} else {
				$('.jsCalendar').css("display", "none");
				$('.m_main_select').eq(0).css("position", "");
			}
		})
		
		$('.m_main_select').eq(1).click(function(){
			if($('#m_main_starttime').css("opacity") == '0'){
				$('#m_main_starttime').css("opacity", "1");
				$('.m_main_select').eq(0).css("position", "");
				$('.m_main_select').eq(1).css("position", "relative");
			} else {
				$('#m_main_starttime').css("opacity", "0");
				$('.m_main_select').eq(1).css("position", "");
			}
		})
		
		$('.m_main_select').eq(2).click(function(){
			if($('#m_main_endtime').css("opacity") == '0'){
				$('#m_main_endtime').css("opacity", "1");
				$('.m_main_select').eq(0).css("position", "");
				$('.m_main_select').eq(2).css("position", "relative");
			} else {
				$('#m_main_endtime').css("opacity", "0");
				$('.m_main_select').eq(2).css("position", "");
			}
		})
		
		$('.m_main_select').eq(3).click(function(){
			if($('#m_main_count').css("opacity") == '0'){
				$('#m_main_count').css("opacity", "1");
				$('.m_main_select').eq(0).css("position", "");
				$('.m_main_select').eq(3).css("position", "relative");
			} else {
				$('#m_main_count').css("opacity", "0");
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
	    	}else{
		 		myCalendar.clearselect();
				myCalendar.select([date]);
	    	}
	    	
	    	
	    	if(date.getTime() == today.getTime()){
	    		var now_hour = new_today.getHours();
	    		
	    		$('#m_main_starttime ul li').each(function(){
	    			starttime = $(this).text();
	    			var hour=starttime.substring(0, starttime.length-1);
	    			if(parseInt(hour)-1 < parseInt(now_hour)){
	    				$(this).addClass("m_black");
	    			}
	    		})
	    		
	    		$('#m_main_endtime ul li').each(function(){
	    			endtime = $(this).text();
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
		
		$('.jsCalendar').css("width", $('.m_main_header_column').children().eq(0));
		$('#m_main_time').css("width", $('.m_main_header_column').children().eq(1));
		$('#m_main_count').css("width", $('.m_main_header_column').children().eq(2));
		
		
		
		//textarea 자동 크기조절
		autosize($("textarea"));
		
		var eventcheckid = false;
		
		//썸네일 이미지 변경하기
		$('#eventPic_uploadfile').on('change', preview);
		
		//이벤트명 20자까지 막기
		$("#event_title").keyup(function(){
			if ($("#event_title").val().length > 20) {
				alert("이벤트명을 20자 이하로 입력해주세요.");
				$("#event_title").val('');
				$("#event_title").focus();				
				return false;
			}
		});
		
		function preview(e){
			var file = e.target.files[0];//File 객체 리스트에서 첫번째 File 객체를 가져옵니다.
			
			//file.type : 파일의 형식(MIME타입 - 예)text/html)
			if (!file.type.match('image.*')) {//파일 타입이 image인지 확인합니다.
				alert("확장자는 이미지 확장자만 가능합니다.");
				return false;
			}
			
			//파일 크기 제한
			var maxSize = 5 * 1024 * 1024;
			var fileSize = file.size;
			console.log(fileSize + " : " + maxSize);
			if (fileSize > maxSize) {
				alert("5MB이하 파일만 등록할 수 있습니다.\n파일 용량을 확인해주세요.");
				return false;
			}
	
			//파일을 읽기 위한 객체 생성
			var reader = new FileReader();
			
			//DataURL 형식으로 파일을 읽어옵니다.
			//읽어온 결과는 reader 객체의 result 속성에 저장됩니다.
			reader.readAsDataURL(file);
			
			//읽기에 성공했을 때 실행되는 이벤트 핸들러
			reader.onload = function(e){
				//result : 읽기 결과가 저장됩니다.
				//reader.result 또는 e.target.result
				$("#eventPic_image").attr("src", e.target.result).css("opacity", 1);
			}//reader.onload end
			
			eventcheckid = true;
		}//function preview end		
		
		//textarea 글자 수 보여주기
		$('textarea').keyup(function(){
			var inputLength = $(this).val().length;
			var remain = 4000 - inputLength;
			$('#p_event_content').text("남은 글자 수 : " + remain + "/4000");
		});
		
		//reset 버튼 눌렀을 때 1. 남은 글자수 삭제하기 2. 이미지 삭제하기
		$(".p_reset").click(function(){
			$("#p_event_content").text("");
			$("#eventPic_image").prop("src", "resources/image/default_thumnail.png").css("opacity", 0.2);
		});
		
		//등록시 필수 항목 입력 여부 검사
		$("#p_event_write_form").submit(function(){
			if (eventcheckid == false){
				alert("이벤트의 썸네일을 등록해주세요.");
				return false;				
			}
			
			if ($("#event_title").val() == "") {
				alert("이벤트명을 20자 이하로 입력해주세요.");
				$("#event_title").focus();
				return false;
			}
			
			if ($("#event_room option:selected").val() == "none") {
				alert("이벤트의 장소를 입력해주세요.");
				$("#event_room").focus();
				return false;
			}
			
			if ($("#event_content").val() == "") {
				alert("이벤트의 세부 내용을 4000자 이하로 입력해주세요.");
				$("#event_content").focus();
				return false;
			}	
			
			//날짜 유효성 검사
			var date = $('#date').val();
	    	var starttime = $('#starttime').val();
	    	var endtime = $('#endtime').val();
	    	
			console.log("event_date : " + date + " / event_start : "  + starttime + " / event_end : " + endtime);
			
			if(date==''){
				alert('이벤트 날짜를 선택해 주세요');
				return false;
			}else if(starttime==''){
				alert('이벤트 시작 시간을 선택해 주세요');
				return false;
			}else if(endtime==''){
				alert('이벤트 종료 시간을 선택해 주세요');
				return false;
			} else if(parseInt(starttime) >= parseInt(endtime)){
				alert('이벤트 시작 시간은 종료 시간보다 빨라야 합니다. \n시간을 확인해 주세요');
				return false;
			} 

		});
				
	});
	

</script>
</head>
<body>
<div class="container pp">
<br>
<h2 class = "p_title">이벤트 등록</h2>
<br>
	<p style = "text-align:center; font-size:14px;">이벤트를 등록하시면 관리자의 승인을 거쳐 이벤트 홍보 게시판에 게시됩니다.</p>
  <form method="post" action="EventAddAction.eve" enctype="multipart/form-data" id = "p_event_write_form">
 	<input name = "mem_key" id = "mem_key" value = "${mem_key}" type = "hidden">
  	
	<!--  썸네일 등록 -->
   <div class="row">
      <div class="col-25">
        <label for="event_title">썸네일등록</label>
      </div>
      
      <div class="col-75">
      	<label for = "eventPic_uploadfile">
        	<input type="file" name="eventPic_uploadfile" id = "eventPic_uploadfile" accept="image/gif, image/jpeg, image/png" 
        	style = "display:none"><!-- 파일 선택하는 부분 --> 
        	<img src="resources/image/default_thumnail.png" id = "eventPic_image" class="p_avatar"><!-- 이미지 -->
        	<br>
        	<label for = "eventPic_uploadfile" id = "eventPic_button">이미지 등록</label>
        </label>
      </div>
    </div>
  
  	<!--  이벤트명 등록 -->
    <div class="row">
      <div class="col-25">
        <label for="event_title">이벤트명</label>
      </div>
      <div class="col-75">
        <input type="text" id="event_title" name="title" placeholder="이벤트명을 20자까지 입력해주세요.">
      </div>
    </div>
        
   	<!--  이벤트 장소 -->     
    <div class="row">
      <div class="col-25">
        <label for="country">이벤트 장소</label>
      </div>
      <div class="col-75">
		<select id = "event_room" name = "event_room">
         <option value = "none" selected>이벤트 장소</option>
         <c:forEach var="room_name" items="${roomlist}">
         <option value = "${room_name}" >${room_name}</option>
         </c:forEach>            
      </select>

      </div>
    </div>

	<div class = "row">
	<input type="hidden" name="event_date" id="date" value="">
	<input type="hidden" name="event_start" id="starttime" value="">	
	<input type="hidden" name="event_end" id="endtime" value="">

		<div class="col-25">
      	  <label for="country">이벤트 일시</label>
      	</div>
      	<div class="col-75">
      	<div class="m_main_header_column col-md">
		<div class="m_main_select col-md-6 form-control">
							<div class="m_write col-md" id="m_write_date">
								<div>
									<i class="far fa-calendar-alt"></i>
									모임 날짜
								</div>
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="my-calendar" class="e_calendar col-md" name = "event_date"></div>
	    </div>
	            		
		<div class="m_main_select col-md-3 form-control">
							<div class="m_write col-md" id="m_write_starttime">
								<i class="far fa-clock"></i>
								START
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_starttime" class="col-md" name = "event_start">
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
						
			<div class="m_main_select col-md-3 form-control">
							<div class="m_write col-md" id="m_write_endtime">
								<i class="far fa-clock"></i>
								END
								<i class="fas fa-chevron-down"></i>
							</div>
							<div id="m_main_endtime" class="col-md" name = "event_end">
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
								</ul>
				        	</div>
			</div>
	</div>
	</div>      	
    </div>


    <!--  이벤트 세부 내용 등록 -->     
    <div class="row">
      <div class="col-25">
        <label for="event_content">세부내용</label>
      </div>
      <div class="col-75">
        <textarea id="event_content" name="content" placeholder="이벤트 내용을 4000자까지 입력해주세요."></textarea>
        <span id = "p_event_content"></span>
      </div>
    </div>

	<!--  취소 및 등록 버튼 -->    
    <br>
    <div class="p container" style="display: inline-block; text-align: center;">
    	<button type = "reset" class = "p_reset">취소</button>
      	<button type = "submit" class = "p_submit">등록</button>
    </div>
  </form>
</div>
</body>