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
	#event_comment_text{font-weight:bold;font-family:"맑은 고딕"; font-size:18px;}
	.p_title{font-family:"맑은 고딕"; text-align:center; font-size:32px; maxLength:20}
	
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
	#delete_modify_btn{padding:10px; z-index:10; float:right;}
	#delete_modify_btn:after{clear:both}
	#event_modify_btn, #event_modify_btn{color:black}
	#event_modify_btn:hover{cursor: pointer; color: #3EF4F3; text-decoration:none;}
	#event_delete_btn:hover{cursor: pointer; color: #3EF4F3; text-decoration:none;}
	#event_delete_btn:visited{color:black}
	
	/** comment 관련!! */
	#event_comment_write{background-color:#7F56D2; border:0px; opacity:0.8; color:white; width:20%;}
	#event_comment_write:hover{opacity:1}
	#comment_content{width:80%;}
		
</style>
<script>
	$(function(){

	//게시글 상세보기로 이동하기!!
	$(".click_detail").click(function(){
		var event_num = $(this).find($("input[name=event_num]")).val();
		location.href = "EventDetailAction.eve?num="+parseInt(event_num);
		console.log(event_num);
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
	
	
	/** comment 시작*/
	$("#comment table").hide();
	
	function getList(){
		$.ajax({
			type : "post",
			url : "CommentList.bo",
			data : {"event_num" : $("#BOARD_RE_REF").val()},
			dataType : "json",
			success : function(rdata){
				if (rdata.length > 0) {
					$("#comment table").show();
					$("#comment thead").show();
					$("#comment tbody").empty();
					$("#message").text('');
					output = '';
					$(rdata).each(function(){
						img = '';
						if($("#loginid").val() == this.id){//로그인한 아이디와 글쓴 사람의 아이디가 같을 때
							img = "<img src = 'image/pencil2.png' width='15px' " 
								+ "class='update'>"
							+ "<img src = 'image/remove.png' width='15px' "
							 	+ "class='remove'>"
							+ "<input type = 'hidden' value = '" + this.num
							+ "' > ";									 
						} 
						output += "<tr><td>" + this.id + "</td>";
						output += "<td>" + this.content + "</td>";
						output += "<td>" + this.reg_Date + img + "</td></tr>";
					});
					$("#comment tbody").append(output);
				} else {
					$("#message").text("등록된 댓글이 없습니다.");
					$("#comment thead").hide();
					$("#comment tbody").empty();
				}
				$("#count").text(rdata.length);
			}
		});
	}//getList end
	
	$(".start").click(function(){
		getList();
	});//click end
	//댓글 버튼을 눌렀을 때 댓글 목록 가져오기
	
	//글자수 4000자 제한
	$("#content").on('input', function(){
		length = $(this).val().length;
		if (length > 4000) {
			lenght = 4000;
			content = content.substring(0, length);
		}
		$(".float-left").text(length + "/4000");
	});//content input end
	
	//등록 또는 수정완료 버튼을 클릭한 경우
	//버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
	//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
	$("#write").click(function(){
		buttonText = $("#write").text();
		content = $("#content").val();
		$(".float-left").text('총 4000자까지 가능합니다.');
		if (buttonText == "등록") {//댓글을 추가하는 경우
			url = "CommentAdd.bo";
			data = {"content" : content,
					"mem_key" : $("#mem_key").val(),
					"event_num" : $("#event_num").val()};		
		} else {//댓글을 수정하는 경우
			url = "CommentUpdate.bo";
			data = {"num" : num, "content" : content};
			$("#write").text("등록");//다시 등록으로 변경
		}

		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result){
				$("#content").val('');
				if (result == 1) {
					getList();
				}
			}
			
		});//ajax end
	});//write end
	
	//pencil2.png를 클릭하는 경우(수정)
	$("#comment").on('click', '.update', function(){
		before = $(this).parent().prev().text();
		$("#content").focus().val(before);
		num = $(this).next().next().val();//수정할 댓글번호를 저장
		$("#write").text("수정완료");//등록 버튼의 라벨을 '수정완료'로 변경
		$(this).parent().parent().css('background', 'lightgray');
	});//pendil2 end
	
	//remove.png를 클릭하는 경우
	$("#comment").on('click', 'remove', function(){
		var num = $(this).next().val();//댓글 번호
		
		$.ajax({
			type : "post",
			url : "CommentDelete.bo",
			data : {"num" :  num},
			success : function(result){
				if (result == 1) {
					getList();
				}
			}
		})
	})//remove end
	
	
	});
</script>
</head>
<body>
	<br><br>
	<div class = "container">
	<input type = "hidden" id = "mem_key" name = "mem_key" value = "${mem_key}">
	<input type = "hidden" id = "key" name = "key" value = "${key}">
	<input type = "hidden" id = "event_num" name = "event_num" value = "${eventdata.event_num}">
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
		<div class = "img_avatar"><img class = "p_avatar" src = "resources/upload${eventdata.event_pic}"></div>
   	</div>
   	<br>
   	<br>
   	<div class = "event_content_view" style="text-align:center">
   		${eventdata.content}   	
   	</div>
   	<br>
   	<hr>	
   	<p id = "event_comment_text">댓글</p><br>
   	<div id = "comment" class = "row">
		<textarea rows = 8 id = "comment_content" maxLength = "50"></textarea>
		<button id = "event_comment_write" class = "float-right">댓글 등록</button>
		<br>
		<table class = "table table_striped"><!-- #comment table -->
			<thead>
				<tr>사진&nbsp;닉네임</tr>
				<tr>날짜</tr>
			</thead>
			<tbody>
				<tr>내용</tr>
			</tbody>
		</table>
			<div id = "message"></div>
	</div>	  		  
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