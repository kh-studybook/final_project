<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>EventDetailView.jsp</title>
<style>
	/** a 태그 관련!! */
	a{text-decoragion:none;}
	
	/** 글자 관련 */
	.event_title_view{font-family:"맑은 고딕"; font_size:32px; text-align:center}
	#event_comment_text{font-weight:bold;font-family:"맑은 고딕"; font-size:32p;x}
	
	/** 위치 관련 */
	.motifyEvent{text-align:right;}
</style>
</head>
<body>
	<div class = "p container">
	<input type = "hidden" id = "mem_key" name = "mem_key" value = "${mem_key}">
	<!-- 상단 메뉴 -->
   	<div class="row">
      <div class="col-md-4"><a href = "event_list.jsp">메인페이지</a>></div><!-- 추구 확인 : 주소 확인 -->
      <div class="col-md-4"><h5>이벤트 홍보</h5></div>
      <div class="col-md-4"></div>
   	</div>
   	<br>
	
	<div class = "event_title_view">
		<b>[이벤트 제목]</b>${eventdata.title}<br>
		<p>${eventdata.event_date}&nbsp;&nbsp;${eventdata.event_start}에서 ${eventdata.event_end}까지
		&nbsp;${eventdata.event_room}<br>
		<!-- 추후 확인 : 글쓴이 넣는 방법 -->
	</div>
		
	<div class="row">
    	<div class="col-md-4"></div>
    	<div class="col-md-4">${eventdata.event_pic}</div>
    	<div class="col-md-4"></div>
   	</div>
   	<br>
   	
   	<div class = "event_content_view">
   		${eventdata.content}   	
   	</div>
   	<hr>	
   	<p id = "event_comment_text">댓글</p>
   	<div id = "comment"><!--  추구 확인 : 여기서부터 다시 하기 -->
		<button class = "btn btn-info float-left">총 50자까지 가능합니다.</button>
		<button id = "write" class = "btn btn-info float-right">등록</button>
		<textarea rows = 3 class = "form-control" id = "content" maxLength = "50"></textarea>
		<table class = "table table_striped"><!-- #comment table -->
		<thead>
			<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
		</thead>
		<tbody>
		</tbody>
		</table>
		<div id = "message"></div>
	</div>	
   		   
		
		
		<div class = "motifyEvent">
			<a>수정</a><a>삭제</a>
		</div>
		<hr>
	
	</div>
</body>