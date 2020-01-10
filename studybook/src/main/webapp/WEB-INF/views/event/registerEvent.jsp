<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<style>
* {box-sizing: border-box; font-family:"맑은 고딕"}

/** 글자 관련*/
.p_title{font-family:"맑은 고딕"; text-align:center; maxLength:200}
#p_event_content{font-size : 12px; font-color : #7F7F7F;  maxLength : 4000; height:200px}

/** 입력 폼 관련*/
input[type=text], select, textarea {width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 4px; resize: vertical;}
label {padding: 12px 12px 12px 0; display: inline-block;}
input[type=date]{height:3rem;}

/** 버튼 관련*/
.p_submit, .p_reset{width:43%; padding: 12px; border: none; border-radius: 4px; cursor: pointer; opacity:0.7}
.p_submit{background-color: #7F56D2; color:white;}
.p_reset{background-color: #d2d2d2; } 
.p_submit:hover, .p_reset:hover{opacity:1}
#eventPic_uploadfile{border: none;}

/** 전체 폼 관련*/
.p {border-radius: 5px; padding: 20px;}
.col-25 {float: left; width: 25%; margin-top: 6px;}
.col-75 {float: left; width: 75%; margin-top: 6px;}

/** 썸네일 관련*/
.p_avatar{width:200px; height:200px;}

/* Clear floats after the columns */
.row:after { content: ""; display: table; clear: both;}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {.col-25, .col-75, input[type=submit] {width: 100%;margin-top: 0;}}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
	$(function(){
		
		//썸네일 이미지 변경하기
		$('#eventPic_uploadfile').on('change', preview);
		
		function preview(e){
			var file = e.target.files[0];//File 객체 리스트에서 첫번째 File 객체를 가져옵니다.
			
			//file.type : 파일의 형식(MIME타입 - 예)text/html)
			if (!file.type.match('image.*')) {//파일 타입이 image인지 확인합니다.
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
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
				$("#eventPic_image").attr("src", e.target.result);
			}//reader.onload end
		}//function preview end
		
		
		//textarea 글자 수 보여주기
		$('textarea').keyup(function(){
			var inputLength = $(this).val().length;
			var remain = 4000 - inputLength;
			$('#p_event_content').text("남은 글자 수 : " + remain + "/4000");
		});
		
		//등록시 필수 항목 입력 여부 검사
		$(".p_submit").click(function(){
			if (("#eventPic_uploadfile").attr("src") == "resources/image/default_thumnail.png"){
				alert("이벤트의 썸네일을 등록해주세요.");
				return false;				
			}
			
			if (("#event_title").val() = "") {
				alert("이벤트의 이름을 200자 이하로 입력해주세요.");
				$("#event_content").focus();
				return false;
			}
			
			if (("#event_date").val() == "") {
				alert("이벤트의 날짜를 입력해주세요.");
				return false;
			}
			
			if (("#event_start option:selected").val() == "none") {
				alert("이벤트의 시작 시간을 선택해주세요.");
				$("#event_start").focus();
				return false;
			}
		
			if (("#event_end option:selected").val() == "none") {
				alert("이벤트의 종료 시간을 선택해주세요.");
				$("#event_end").focus();
				return false;
			}
			
			if (("#event_start option:selected").val() == ("#event_end option:selected").val()) {
				alert("이벤트의 시간 시간과 종료 시간은 같을 수 없습니다.\n 종료 시간을 다시 선택해주세요.");
				$("#event_end option:eq(0)").attr("selected", "selected");
				return false;
			}
			
			
			if (("#event_content").val() == "") {
				alert("이벤트의 세부 내용을 4000자 이하로 입력해주세요.");
				$("#event_content").focus();
				return false;
			}		
			
		});
	});
</script>
</head>
<body>
<h2 class = "p_title">이벤트 등록</h2>

<div class="p container">
  <form method="post" action="EventAddAction.eve" enctype="multipart/form-data">
  
	<!--  썸네일 등록 -->
   <div class="row">
      <div class="col-25">
        <label for="event_title">썸네일등록</label>
      </div>
      
      <div class="col-75">
      	<label for = "eventPic_uploadfile">
        	<input type="file" name="eventPic_uploadfile" id = "eventPic_uploadfile" accept="image/gif, image/jpeg, image/png" value = "이미지 등록"> 
        	<img src="resources/image/default_thumnail.png" id = "eventPic_image" class="p_avatar">
        </label>
      </div>
    </div>
  
  	<!--  이벤트명 등록 -->
    <div class="row">
      <div class="col-25">
        <label for="event_title">이벤트명</label>
      </div>
      <div class="col-75">
        <input type="text" id="event_title" name="event_title" placeholder="이벤트명">
      </div>
    </div>
    
    <!--  이벤트 날짜 등록 -->
    <div class="row">
      <div class="col-25">
        <label for="event_date">이벤트 날짜</label>
      </div>
      <div class="col-75">
        <input type="date" id="event_date" name="event_date" class = "form-control">
      </div>
    </div>

    <!--  이벤트 시작 시간 등록 -->    
    <div class="row">
      <div class="col-25">
        <label for="country">이벤트 시작시간</label>
      </div>
      <div class="col-75">
		<select id = "event_start">
			<option value = "none" selected>이벤트 시작시간</option>
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
			<option value = "none" selected>이벤트 종료 시간</option>
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

    <!--  이벤트 세부 내용 등록 -->     
    <div class="row">
      <div class="col-25">
        <label for="event_content">세부내용</label>
      </div>
      <div class="col-75">
        <textarea id="event_content" name="event_content" placeholder="이벤트 내용을 4000자까지 입력해주세요."></textarea>
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
</body>