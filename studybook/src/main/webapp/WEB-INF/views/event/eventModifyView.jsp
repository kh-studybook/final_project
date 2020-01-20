<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<style>
* {box-sizing: border-box; font-family:"맑은 고딕"}

/** 글자 관련!!!!*/
.p_title{font-family:"맑은 고딕"; text-align:center; font_size:32px;}
#event_title{maxLength:200;}
#p_event_content{font-size : 12px; font-color : #7F7F7F;  maxLength : 4000; min-height:200px;}
textarea::placeholder, input[type=text]::placeholder{color:black;}
.col-25 > label {font-weight:bold;}
.pp_locate{text-decoration:none; font-size:12px;}

/** 입력 폼 관련*/
input[type=text], select, #event_content {width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 4px; resize: vertical;}
label {padding: 12px 12px 12px 0; display: inline-block;}
input[type=date]{height:3rem;}

/** 버튼 관련*/
.p_submit, .p_reset{width:43%; padding: 12px; border: none; border-radius: 4px; cursor: pointer; opacity:0.7}
.p_submit{background-color: #7F56D2; color:white;}
.p_reset{background-color: #d2d2d2;} 
.p_submit:hover, .p_reset:hover{opacity:1}
#eventPic_uploadfile{border: none;}

/** 전체 폼 관련*/
.p {border-radius: 5px; padding: 20px;}
.col-25 {float: left; width: 25%; margin-top: 6px;}
.col-75 {float: left; width: 75%; margin-top: 6px;}

/** 썸네일 관련*/
.p_avatar{width:200px; height:200px; border-radius: 5px}
#eventPic_button{border:none; border-radius: 5px; display:inline-block; width:200px; background-color:#56D7D6; color:white; margin-top:5px; text-align:center;}

/* Clear floats after the columns */
.row:after { content: ""; display: table; clear: both;}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {.col-25, .col-75, input[type=submit] {width: 100%;margin-top: 0;}}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src = "https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
	$(function(){
		//textarea 자동 크기조절
		autosize($("textarea"));
		
		//이벤트 날짜 가져오기

		//이벤트 시작 시간 가져오기
		$("#event_start").val("${event_start}").attr("selected", true);
		//이벤트 종료 시간 가져오기
		
		//이벤트 장소 가져오기
		
		
		
		//썸네일 이미지 변경하기
		$('#eventPic_uploadfile').on('change', preview);
		
		function preview(e){
			var file = e.target.files[0];//File 객체 리스트에서 첫번째 File 객체를 가져옵니다.
			
			//file.type : 파일의 형식(MIME타입 - 예)text/html)
			if (!file.type.match('image.*')) {//파일 타입이 image인지 확인합니다.
				alert("확장자는 이미지 확장자만 가능합니다.");
				return false;
			}
			
			//파일 크기 제한 하기
			var maxSize = 5 * 1024 * 1024;
			var fileSize = file.getSize;
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
			
			if ($("#event_date").val() == "") {
				alert("이벤트의 날짜를 입력해주세요.");
				$("#event_date").focus();
				return false;
			}
						
			if ($("#event_start option:selected").val() == "none") {
				alert("이벤트의 시작 시간을 선택해주세요.");
				$("#event_start").focus();
				return false;
			}
		
			if ($("#event_end option:selected").val() == "none") {
				alert("이벤트의 종료 시간을 선택해주세요.");
				$("#event_end").focus();
				return false;
			}
			
			if ($("#event_start option:selected").val() == $("#event_end option:selected").val()) {
				alert("이벤트의 시간 시간과 종료 시간은 같을 수 없습니다.\n종료 시간을 다시 선택해주세요.");
				$("#event_end option:eq(0)").prop("selected", true);
				$("#event_end").focus();
				return false;
			}
			
			if ($("#event_start option:selected").val() > $("#event_end option:selected").val()) {
				alert("이벤트의 시간 시간은 종료 시간보다 늦을 수 없습니다.\n시간을 다시 선택해주세요.");
				$("#event_start option:eq(0)").prop("selected", true);
				$("#event_end option:eq(0)").prop("selected", true);
				$("#event_start").focus();
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
		});//유효성 검사 끝
		
	});
</script>
</head>
<body>
<div class="p container">
	<!-- 상단 메뉴 -->
   	<div class="row pp_locate"">
      <div class="col-md-8"><a href = "event_list.eve">이벤트 홍보 게시판</a><span>>이벤트 수정 페이지</span></div>
      <div class="col-md-4"></div>
   	</div>
   	<br>
   	
<h2 class = "p_title">이벤트 수정</h2>


  <form method="post" action="EventModifyAction.eve" enctype="multipart/form-data" id = "p_event_modify_form">
  	<!--  작성자 추후 멤버키 다시 변경하기 admin 0 -->
 	<input name = "mem_key" id = "mem_key" value = 0 type = "hidden">
  
	<!--  썸네일 등록 -->
   <div class="row">
      <div class="col-25">
        <label for="event_title">썸네일등록</label>
      </div>
      
      <div class="col-75">
      	<label for = "eventPic_uploadfile">
        	<input type="file" name="eventPic_uploadfile" id = "eventPic_uploadfile" accept="image/gif, image/jpeg, image/png" 
        	style = "display:none"><!-- 파일 선택하는 부분 --> 
        	<img src="resources/upload/${eventdata.event_pic}" id = "eventPic_image" class="p_avatar"><!-- 이미지 -->
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
        <input type="text" id="event_title" name="event_title" placeholder="이벤트명" value = "${eventdata.title}">
      </div>
    </div>
    
    <!--  이벤트 날짜 등록 -->
    <div class="row">
      <div class="col-25">
        <label for="event_date">이벤트 날짜</label>
      </div>
      <div class="col-75">
        <input type="date" id="event_date" name="event_date" class = "form-control" value = "${eventdata.event_date}">
      </div>
    </div>

    <!--  이벤트 시작 시간 등록 -->    
    <div class="row">
      <div class="col-25">
        <label for="country">이벤트 시작 시간</label>
      </div>
      <div class="col-75">
		<select id = "event_start">
			<option value = "none">이벤트 시작시간</option>
			<option value = "09:00">09:00</option>
			<option value = "10:00">10:00</option>
			<option value = "11:00">11:00</option>
			<option value = "12:00">12:00</option>
			<option value = "13:00">13:00</option>
			<option value = "14:00">14:00</option>
			<option value = "15:00">15:00</option>	
			<option value = "16:00">16:00</option>	
			<option value = "17:00">17:00</option>	
			<option value = "18:00">18:00</option>
			<option value = "19:00">19:00</option>	
			<option value = "20:00">20:00</option>					
		</select>
      </div>
    </div>
 
    <!--  이벤트 종료 시간 등록 -->     
    <div class="row">
      <div class="col-25">
        <label for="country">이벤트 종료시간</label>
      </div>
      <div class="col-75">
		<select id = "event_end">
			<option value = "none">이벤트 종료 시간</option>
			<option value = "10:00">10:00</option>
			<option value = "11:00">11:00</option>
			<option value = "12:00">12:00</option>
			<option value = "13:00">13:00</option>
			<option value = "14:00">14:00</option>
			<option value = "15:00">15:00</option>	
			<option value = "16:00">16:00</option>	
			<option value = "17:00">17:00</option>	
			<option value = "18:00">18:00</option>
			<option value = "19:00">19:00</option>	
			<option value = "20:00">20:00</option>			
			<option value = "21:00">21:00</option>					
		</select>
      </div>
    </div>
    
       	<!--  이벤트 장소 -->     
    <div class="row">
      <div class="col-25">
        <label for="country">이벤트 장소</label>
      </div>
      <div class="col-75">
		<select id = "event_room" name = "event_room">
			<option value = "none">이벤트 장소</option>
			<option value = "스터디룸A">스터디룸A</option>
			<option value = "스터디룸B">스터디룸B</option>
			<option value = "스터디룸C">스터디룸C</option>	
			<option value = "스터디룸D">스터디룸D</option>	
			<option value = "스터디룸E">스터디룸E</option>	
			<option value = "스터디룸F">스터디룸F</option>					
		</select>
      </div>
    </div>

    <!--  이벤트 세부 내용 등록 -->     
    <div class="row">
      <div class="col-25">
        <label for="event_content">세부내용</label>
      </div>
      <div class="col-75">
        <textarea id="event_content" name="event_content" placeholder="이벤트 내용을 4000자까지 입력해주세요.">${eventdata.content}</textarea>
        <span id = "p_event_content"></span>
      </div>
    </div>

	<!--  취소 및 등록 버튼 -->    
    <br>
    <div class="p container" style="display: inline-block; text-align: center;">
    	<button type = "reset" class = "p_reset">취소</button>
      	<button type = "submit" class = "p_submit">글등록</button>
    </div>
  </form>
</div>
<br><br><br><br>
</body>