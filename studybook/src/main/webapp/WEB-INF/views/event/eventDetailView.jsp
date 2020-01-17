<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<meta charset="UTF-8">
<title>EventDetailView.jsp</title>
<style>
	/** a 태그 관련!!!! */
	a{text-decoragion:none;}
	
	/** 글자 관련 */
	.event_title_view{font-family:"맑은 고딕"; font_size:32px; text-align:center}
	#event_comment_text{font-weight:bold;font-family:"맑은 고딕";}
	.p_title{font-family:"맑은 고딕"; font-weight:bold; text-align:center; font-size:32px; maxLength:20}
	
	/** 위치 관련 */
	.motifyEvent{text-align:right;}
</style>
</head>
<body>
	<br><br><br><br><br><br><br><br>
	<div class = "container">
	<input type = "hidden" id = "mem_key" name = "mem_key" value = 0><!--  추후 확인 : mem_key -->
	<!-- 상단 메뉴 -->
   	<div class="row">
      <div class="col-md-8"><a href = "event_list.eve">메인페이지</a><span>>이벤트 홍보</span></div>
      <div class="col-md-4"></div>
   	</div>
   	<br>
	
	<div class = "event_title_view">
		<p class= "p_title">[이벤트제목]${eventdata.title}<p><br>
		<p>${fn:substring(eventdata.event_date,0,11)}&nbsp;&nbsp;${eventdata.event_start}에서 ${eventdata.event_end}까지
		&nbsp;${eventdata.event_room}<br>
		<!-- 추후 확인 : 글쓴이 넣는 방법 -->
	</div>
	<hr>	
	<div class="row">
    	<div class="col-md-4"></div>
    	<div class="col-md-4">${eventdata.event_pic}</div>
    	<div class="col-md-4"></div>
   	</div>
   	<br>
   	
   	<div class = "event_content_view" style="text-align:center">
   		${eventdata.content}   	
   	</div>
   	<hr>	
   	<p id = "event_comment_text">댓글</p><br>
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