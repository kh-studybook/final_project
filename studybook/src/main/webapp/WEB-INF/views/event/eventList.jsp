<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
<meta charset="UTF-8">
<style>
body {background-color: #f2f2f2;}	
/** 글자 관련!!!!*/
.p_title {font-family: "맑은 고딕"; text-align: center; font-size: 32px;}
.p_p_title {font-family: "맑은 고딕";text-align: center;font-size: 16px;}
#nocontent{font-size:24px; font-weight:bold; margin:10; color:#56D7D6; text-align:center}

/** 버튼 관련*/
#p_register_event {border-radius: 5px;border: none;background-color: #7F56D2;
	color: white;width: 20%; padding: 12px;position: relative;top: 10%;left: 70%;}
#delete_modify_btn{padding:10px; z-index:10; float:right;}
#delete_modify_btn:after{clear:both}
#event_modify_btn, #event_modify_btn{color:black}
#event_modify_btn:hover{cursor: pointer; color: #3EF4F3; text-decoration:none;}
.event_delete_btn:hover{cursor: pointer; color: #3EF4F3; text-decoration:none;}
.event_delete_btn:visited{color:black}

/** 카드 관련 */
.card-img-top{height:200px; border-radius:0px;}
.wrapper{width:350px; height:300px; margin:20px; background-color:white;}
.title_z_index{padding:10px; color:white; font-size:16px; text-align:center; top:50%; margin-top:-10rem; position:relative; z-index:10}
.title_z_index_big{font-size:24px; font-weight:bold; height: 48px;}
.card_contents{padding:10px; padding-bottom:0px; font-family:"맑은 고딕"}
.click_detail{cursor:pointer}
		
/**  모달 관련 */
.p_modal-title {font_size: 36px;font-weight: bold; width:100%}

/** 페이지 네이션*/
.center-block {display: flex;justify-content: center}
</style>
<script>
	$(function() {
		//글쓰기 이동 & 미로그인시에 로그인 화면으로 이동
		$("#p_register_event").click(function() {
			if ("${mem_key}" != null) {
				location.href = "registerEvent.eve?mem_key="+ ${mem_key};
			} else {
				location.href = "/login.mem";
			}
		});//p_register_event end

		//게시글 상세보기로 이동하기
		$(".click_detail").click(function(){
			var event_num = $(this).find($("input[name=event_num2]")).val();
			console.log("event_num = " + event_num);
			location.href = "EventDetailAction.eve?event_num=" + parseInt(event_num) ;
		});
		
		
		$(".event_delete_btn").click(function(){
			var deletecode = $(this).attr("id");
			var event_num = deletecode.split("_")[1];
			console.log(event_num);
			$("input[name=event_num]").val(event_num);	
		});
		
		///이벤트 삭제하기 - 추후 확인
		$("#deletemodal").on("show.bs.modal", function(){
			
			event_num = $("input[name=event_num]").val();
			console.log("삭제할 event_num" + event_num);
			
				$(".deletemodalSubmit").click(function(){
					console.log("delete");
					location.href = "EventDeleteAction.eve?event_num=" + parseInt(event_num);
				});
			
			$("#deletemodal > .btn-light").click(function(){
				event_num.val();
				$("input[name=event_num]").val('');
			});
		});		
	});//function end
</script>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<br> <br>
				<p class="p_title">이벤트 홍보 게시판</p>
				<br> <br>
				<p class="p_p_title">여러분의 이벤트를 등록해주시면 메인에 홍보해드립니다.</p>
				<br><br>

				<input type="hidden" name="mem_key" id="mem_key" value="${mem_key}">
				<input type = "hidden" id = "key" name = "key" value = "${key}">
			</div>
		</div>
		<%-- 게시글이 있는 경우 --%>
		<c:if test="${listcount > 0}">

				<div class="row">
					<c:set var="num" value="${listcount - (page - 1)*9}" />
					<c:forEach var="b" items="${eventlist}">
						<!-- eventlist를 Bean의 형식으로 b에 담아 춢력 -->

						<div class="col-md-4">
							<div class="wrapper">
								<div class = "click_detail">
								<input type = "hidden" value = "${b.event_num}" name  = "event_num2">
								
							    <div class="front">
      								<div class = "card-img">
      									<div style = "filter: brightness(80%)">
        									<img class="card-img-top" src="resources/upload${b.event_pic}">
        								</div>
        								<br><br>
        								<div class = "title_z_index"><p class = "title_z_index_big">${b.title}</p><br>
        									<p>${fn:substring(b.event_date,0,11)}<br>${b.event_start}&nbsp;~&nbsp;${b.event_end}&nbsp;<br>
        									<span>${b.event_room}</span></p>
        								</div>
        							</div>
        							<div class="card_contents">
    								
        								<p>${b.title}</p>
        								<p style = "padding-top:5px">${fn:substring(b.event_date,0,11)}&nbsp;${b.event_start}&nbsp;~&nbsp;${b.event_end}&nbsp;
        								<span style = "color : #7F56D2">${b.event_room}</span></p>
        								<p style = "padding-top:5px">${b.event_writer}</p>
									</div>
    							</div>
								
								</div>
								
								<c:if test = "${mem_key == '999'||b.mem_key == mem_key}">
							  	<div id = "delete_modify_btn">
									<a id="event_modify_btn" href = "EventModifyView.eve?num=${b.event_num}">수정</a> | 
									<a id="eventdelete_${b.event_num}" class = "event_delete_btn" data-toggle="modal" data-target="#deletemodal">삭제</a>
								</div>
								</c:if>
							</div>  
						</div>
					</c:forEach>
				</div>
				
				<br><br>
				<!--  페이지네이션 -->
				<div id = "center-block" class="center-block">
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<c:if test="${page <= 1}">
									<li class="page-item"><a class="page-link" href="#">이전&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${page >1}">
									<li class="page -item"><a
										href="event_list.eve?page = ${page-1}" class="page-link">이전</a>&nbsp;
									</li>
								</c:if>

								<!-- 중간에 숫자 부분 -->
								<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<c:if test="${a == page}">
										<li class="page-item"><a class="page-link current"
											href="#">${a}</a></li>
									</c:if>
									<c:if test="${a != page}">
										<li class="page-item"><a href="event_list.eve?page=${a}"
											class="page-link">${a}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${page >= maxpage}">
									<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
									</li>
								</c:if>
								<c:if test="${page < maxpage}">
									<li class="page-item"><a
										href="event_list.eve?page=${page+1}" class="page-link">&nbsp;다음</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
		</c:if>
		<%-- 게시글이 없는 경우 --%>
		<c:if test="${listcount == 0}">
			<p id = "nocontent">등록된 글이 없습니다. 글을 등록해주세요.</p><br>
			<br><br><br><br><br><br>
		</c:if>

		<button id="p_register_event">이벤트등록</button>
		<br><br>
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