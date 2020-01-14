<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<style>
	/** 글자 관련!!!!*/
	.p_title{font-family:"맑은 고딕"; text-align:center; font-size:32px;}
	.p_p_title{font-family:"맑은 고딕"; text-align:center; font-size:16px;}
	
	/** 버튼 관련 : 추후 글쓰기 버튼 위치 다시 확인하기*/
	#p_register_event{border-radius:5px; border:none; background-color: #7F56D2; color:white; width:20%; padding: 12px; position:relative; top:10%; left:90%;}
	.insert_delete_btn{position:relative; top:90%; left:80%}
	
	/** 카드 관련 */
	.card{padding:10px; margin:10px; }	
	#event_modify_btn:hover, #event_delete_btn:hover{cursor:pointer; color:#3EF4F3}
	
	/**  모달 관련 */
	.p_modal-title{font_size:36px; font-weight:bold;}
	.p_container{padding:20px}
</style>
<script>
	$(function(){
		//글쓰기 이동 & 미로그인시에 로그인 화면으로 이동
		$("#p_register_event").click(function (){
    		if("${mem_key}" != null){
      			location.href = "registerEvent.eve";
    		} else {
       		location.href = "/login.mem";
    		}
 		});//p_register_event end
 		
	     //게시글 삭제 버튼 클릭 했을 때
	     $("#event_delete_btn").click(function() {
	        $("#deletetype").val("board");
	     });
	      
	     //게시글 수정 버튼 클릭 했을 때
         $("#event_modify_btn").click(function() {
            location.href = "EventModifyView.eve";//추후 확인 : 가지고 가야 할 정보
         });
	     
	     //게시글 상세보기로 이동하기
	     $(".card").click(function(){
	    	 location.href = "EventDetailAction.eve";//추후 확인 : 가지고 가야 할 정보 	 
	     });
	     
 	
	});//function end
</script>
</head>
<body>
	<div class = "p_container">
	<br><br>
	<p class = "p_title">이벤트 홍보 게시판</p><br><br>
	<p class = "p_p_title">여러분의 이벤트를 등록해주시면 메인에 홍보해드립니다.</p>
	
	<input type="hidden" name="mem_key" id="mem_key" value=0><!--  추후 확인 : admin 0 -->
	
	<%-- 게시글이 있는 경우 --%>
	<c:if test = "${listcount > 0}">
	
	<div class = "p_evenList">
		
	<div class = "row">
		<c:set var = "num" value = "${listcount - (page - 1)*9}"/>
		<c:forEach var = "b" items = "${eventlist}">
			<c:out value = "${num}"/>
			<c:set var = "num" value = "${num - 1}"/>
	
		
		<div class = "col-sm-4">
			<div class="card">
  				<img class="card-img-top" src="${b.event_pic}" alt="${b.title}"><!-- 추후 확인 : src와 alt 넣기 -->
  				<div class="card-body">
    				<p class="card-text1">${b.title}</p><!-- 이벤트 제목 -->
    				<p class="card-text2">${b.event_date}&nbsp;${b.event_start}&nbsp;${b.event_room}</p><!-- 날짜, 시간, 장소 -->
    				<p class="card-text3"></p><!-- 작성자 -->
    			<div class = "insert_delete_btn">
    				<a id = "event_modify_btn">수정</a> | 
    				<a id = "event_delete_btn" data-toggle="modal" data-target="#deletemodal">삭제</a></div>
  				</div>
			</div>
		</div>


		</c:forEach>
	</div>
	
	<!--  페이지네이션 -->
			<div class = "center-block">
			<div class = "row">
				<div class = "col">
					<ul class = "pagination">
						<c:if test = "${page <= 1}">
							<li class = "page-item">
							<a class = "page-link" href = "#">이전&nbsp;</a>
							</li>
						</c:if>
						<c:if test = "${page >1}">
							<li class = "page -item">
							<a href = "event_list.eve?page = ${page-1}"
								class = "page-link">이전</a>&nbsp;
							</li>
						</c:if>				
					
						<!-- 중간에 숫자 부분 -->
						<c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
							<c:if test = "${a == page}">
							<li class = "page-item">
							<a class = "page-link current" href = "#">${a}</a>
							</li>
							</c:if>
							<c:if test = "${a != page}">
							<li class = "page-item">
							<a href = "event_list.eve?page=${a}" class = "page-link">${a}</a>
							</li>
							</c:if>
						</c:forEach>
						
						<c:if test = "${page >= maxpage}">
							<li class = "page-item">
							<a class = "page-link" href = "#">&nbsp;다음</a>
							</li>
						</c:if>
						<c:if test = "${page < maxpage}">
							<li class = "page-item">
							<a href = "event_list.eve?page=${page+1}"
								class = "page-link">&nbsp;다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>	
	

	</div>
	
	</c:if>
	<%-- 게시글이 없는 경우 --%>
	<c:if test = "${listcount == 0}">
		<font size = 5 margin = "10">등록된 글이 없습니다.</font>
	</c:if>
	
		<button id = "p_register_event">글등록</button>
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
					<form id=deletemodalForm action="EventDeleteAction.eve" method="post">
						<input type="hidden" name="modaleventnum" value="${event_num}" id="event_num"> 
						<input type="submit" class="btn btn-dark" id="deletemodalSubmit" value=삭제>
					    <input type="button" class="btn btn-light" data-dismiss="modal" value=취소>
					</form>
				</div>
			</div>
		</div>
		</div>
	
</body>
