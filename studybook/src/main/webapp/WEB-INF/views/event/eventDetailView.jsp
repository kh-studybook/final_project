<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<meta charset="UTF-8">
<title>EventDetailView.jsp</title>
<link rel="stylesheet" type="text/css" href="resources/css/eventDetailView_css.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src = "https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script>
$(function(){

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
	
	/** comment 시작*/
	$("#comment_form").hide();
	
	getList();
	
	function getList(){
		var event_num = $("#event_num").val();
		var mem_key = $("#mem_key").val();
		console.log("event_num = " + event_num + " mem_key = " + mem_key);
		$.ajax({
			type : "post",
			url : "Event_commentList.eve",
			data : {"event_num" : $("#event_num").val(),
					"mem_key" : $("#mem_key").val()},
			dataType : "json",
			success : function(rdata){
				console.log("success event_num = " + event_num);
				if (rdata.listcount > 0) {
					console.log("댓글을 달을 event_num = " + event_num);
					$("#comment_form").empty();
					$("#comment_form").show();
					$("#comment_content").empty();
					$("#message").text('');
					output = '';
					
					$(rdata).each(function(){
						comment_btn = '';
						//현재 접속한 mem_key가 관리자이거나, 글쓴 men_key가 같을 때
						if("${mem_key}" == '999' || "${mem_key}" == mem_key){
							comment_btn = "<span class = 'comment_btn'><a id = 'eventCommentModify' class='updateComment'>수정</a><span class = 'pt'>|</span> "
							+ "<a id = 'eventCommentDelete' class='removeComment'>삭제</a> "
							+ "<input type = 'hidden' class = 'event_num' value = '" + rdata.event_num + "'> "
							+ "<input type = 'hidden' id = 'event_com_num' value = '" + rdata.event_com_num + "' ></span> ";									 
						} 
									
						
						output += "<div><span>" + rdata.commentWriter + comment_btn + "</span><br>";
						output += "<span>" +  moment(com_date).format("YYYY-MM-DD HH시 mm분 ss") + "</span><br><br>";
						output += "<span style = 'max-width:960px; word-break:break-all;' id = 'comment_content'>" + com_content + "</span>"
						+ "<span><img class = 'reply_img' src = 'resources/image/reply.png' width = 30px><span></div><br><hr>";
					});
					$("#comment_form").append(output);
					$("#comment_content").empty();
				} else {
					$("#message").text("등록된 댓글이 없습니다. 댓글을 달아주세요.");
					$("#comment_content").empty();
					$("#comment_form").hide();
				}
				
				//등록 또는 수정완료 버튼을 클릭한 경우
				//버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
				//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
				$("#event_comment_write").click(function(){
					//댓글 등록
					if ($("#event_comment_write").text() == "댓글 등록"){
						url = "Event_commentAdd.eve";
						data = {"com_content" : $("#comment_content").val(),
								"mem_key" : $("#mem_key").val(),
								"event_num" : $("#event_num").val()}
						
						$.ajax({
							type : "post",
							url : url,
							data : data,
							success : function(result){
								if (result == 1){
									$("#comment_content").val('');
									getList();
								}
							}
						});//ajax end						
					} 
					//댓글 수정
					else if ($("#event_comment_write").text() == "댓글 수정") {
						url = "Event_commentUpdate.eve";
						data = {"event_num" : $("#event_num").val(),
								"event_com_num" : event_com_num,
								"com_content" : $("#comment_content").val()}
						
					$.ajax({
						type : "post",
						url : url,
						data : data,
						success : function(result){
							if (result == 1){
								$("#event_comment_write").text("댓글 등록").css("background-color", "#7F56D2");
								$("#comment_content").val('');
								getList();
							}
						}
					});//ajax end	
					
					}
				});//write end
				
				
				//댓글 수정하기
				$(".updateComment").click(function(){
					if (confirm("댓글을 수정합니다.")){
						$("#event_comment_write").text("댓글 수정");
						$("#event_comment_write").css('backgroundColor', "#20B2AA");
						before = $(this).next().next().next().parent().parent().next().next().next().next().next().text();
						$("#comment_content").focus().val(before);//원래 글 가져오기
						event_com_num = $("#event_com_num").val();//수정할 댓글번호를 저장
					}
				});//수정하기 end
				
				
				//댓글 삭제하기
				$(".removeComment").click(function(){
					if (confirm("댓글을 삭제합니다.")){
						var event_com_num = $(this).next().next().val();//댓글 번호
						console.log("삭제한 event_com_num = " + event_com_num);
						
						$.ajax({
							type : "post",
							url : "Event_commentDelete.eve",
							data : {"event_com_num" :  event_com_num},
							success : function(result){
									if (result == 1) {
										alert("댓글을 삭제했습니다.");
										getList();
									}																		
							}
						})//ajax end
						
					}//if end
				});//삭제하기 end
				
				
				//대댓글 달기
				$(".reply_img").click(function(){
					var event_com_num = $(this).next().next().val();//댓글 번호
					
				});//대댓글 달기 end
				
		}
		});		
		
	};//getList end	

	autosize($("#comment_content"));
	
	//글자수 4000자 제한
	$("#comment_content").on('input', function(){
		length = $(this).val().length;
		if (length > 4000) {
			alert("댓글은 4000자까지 가능합니다.\n현재 입력된 글자수는 " + length + "입니다.");
			return false;
		}
	});//content input end
	
	
});
</script>
</head>
<body>
	<br><br>
	<div class = "container">
	<input type = "hidden" id = "mem_key" name = "mem_key" value = "${mem_key}">
	<input type = "hidden" id = "key" name = "key" value = "${key}">
	<input type = "hidden" id = "event_num" class = "event_num" name = "event_num" value = "${eventdata.event_num}">
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
		<c:if test = "${mem_key == '999'||mem_key == key}">
			<div id = "delete_modify_btn">
					<a id="event_modify_btn" href = "EventModifyView.eve?num=${eventdata.event_num}">수정</a> | 
					<a id="event_delete_btn" data-toggle="modal" data-target="#deletemodal">삭제</a>
		</div>
		</c:if>
		<br><br>
	</div>
	<hr>	
	<div class="row">
		<div class = "img_avatar"><img class = "p_avatar" id = "reply_img" src = "resources/upload${eventdata.event_pic}"></div>
   	</div>
   	<br>
   	<br>
   	<div class = "event_content_view" style="text-align:center">
   		${eventdata.content}   	
   	</div>
   	<br>
   	<hr>
   	<p id = "event_comment_text">댓글</p><br>
   	<div id = "comment_register" class = "row">
			<textarea rows = 8 id = "comment_content" maxLength = "40000"></textarea>
			<button id = "event_comment_write" class = "float-right">댓글 등록</button>
	</div>	  		  
		<br><br>
		
		<!-- #comment_form -->
		<div id = "comment_form">
		</div>			
		
		<!-- 댓글이 없을 때 멘트 출력 부분 -->
		<div id = "message"></div>
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