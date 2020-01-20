<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<meta charset="UTF-8">
<title>EventDetailView.jsp</title>
<style>
	/** a 태그 관련!!!! */
	.p_locate{text-decoration:none; font-size:12px;}
	
	/** 글자 관련 */
	.event_title_view{font-family:"맑은 고딕"; font_size:32px; text-align:center}
	#event_comment_text{font-weight:bold;font-family:"맑은 고딕";}
	.p_title{font-family:"맑은 고딕"; font-weight:bold; text-align:center; font-size:32px; maxLength:20}
	
	/** 위치 관련 */
	.motifyEvent{text-align:right;}
	
	/** 이미지 관련 */
	.p_avatar{width:300px; height:200px;}
	.img_avatar{display:block; margin:0 auto}
	
	/**  모달 관련 */
	.p_modal-title {font_size: 36px;font-weight: bold;}
	
	/** 버튼 관련*/
	#p_register_event {border-radius: 5px;border: none;background-color: #7F56D2;
		color: white;width: 20%; padding: 12px;position: relative;top: 10%;left: 70%;}
	#event_modify_btn:hover, #event_delete_btn:hover {cursor: pointer;color: #3EF4F3}
	#delete_modify_btn{padding:10px; z-index:10; float:right;}
	#delete_modify_btn:after{clear:both}
	#event_modify_btn:visited{color:black}	
	#event_delete_btn:visited{color:black}
</style>
<script>
	$(function(){

	//게시글 상세보기로 이동하기
	$(".click_detail").click(function(){
		var event_num = $(this).find($("input[name=event_num]")).val();
		location.href = "EventDetailAction.eve?num="+parseInt(event_num);
	});

	//이벤트 삭제하기
	$("#deletemodal").on("show.bs.modal", function(){
		var event_num = $("input[name=event_num]").val();
		$("input[name=event_num]").val(event_num);
		console.log(event_num);
	
	$(".deletemodalSubmit").click(function(){
		console.log("delete");
		location.href = "EventDeleteAction.eve?num="+parseInt(event_num);
			});
		});
	});
</script>
</head>
<body>
	<br><br><br><br><br><br><br><br>
	<div class = "container">
	<input type = "hidden" id = "mem_key" name = "mem_key" value = 0><!--  추후 확인 : mem_key -->
	<input type = "hidden" name = "event_num" value = "${eventdata.event_num}">
	<!-- 상단 메뉴 -->
   	<div class="row p_locate">
      <div class="col-md-8"><a href = "event_list.eve">이벤트 홍보 게시판</a><span>>이벤트 상세 페이지</span></div>
      <div class="col-md-4"></div>
   	</div>
   	<br><br><br>
	
	<div class = "event_title_view">
		<p class= "p_title">[이벤트제목] ${eventdata.title}<p><br>
		<p>${fn:substring(eventdata.event_date,0,11)}&nbsp;&nbsp;${eventdata.event_start}에서 ${eventdata.event_end}까지
		&nbsp;<span style = "color:#7F56D2">${eventdata.event_room}</span><br><br>
		${event_writer}
		
		<div id = "delete_modify_btn">
				<a id="event_modify_btn" href = "EventModifyView.eve?num=${eventdata.event_num}">수정</a> | 
				<a id="event_delete_btn" data-toggle="modal" data-target="#deletemodal">삭제</a>
		</div>
		<br><br>
	</div>
	<hr>	
	<div class="row">
		<div class = "img_avatar"><img class = "p_avatar" src = "resources/upload/${eventdata.event_pic}"></div>
   	</div>
   	<br>
   	<br>
   	<div class = "event_content_view" style="text-align:center">
   		${eventdata.content}   	
   	</div>
   	<br>
   	<hr>	
   	<p id = "event_comment_text">댓글</p><br>
   	<div id = "comment"><!--  추후확인 : 여기서부터 다시 하기 -->
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
	
		<!--  삭제 모달 -->
	<div class="modal" id="deletemodal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<p class="p_modal-title">게시글 삭제</p>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">정말로 삭제하시겠습니까?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<form id=deletemodalForm>
						<input type="hidden" name="event_num">  
						<input type="button" class="btn btn-dark deletemodalSubmit" value=삭제> 
						<input type="button" class="btn btn-light" data-dismiss="modal" value=취소>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>