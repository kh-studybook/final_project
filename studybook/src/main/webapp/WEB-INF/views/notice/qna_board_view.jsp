<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
   th {text-align:center}
   #myModal{
   display:none;
   	}
   	#count{
   		position:relative;
   		top:-10px;
   		left:-10px;
   		background:orange;
   		color:white;
   		border-radius:30%;
   		}
   </style>
   <script>
   	$(function(){
   		$("form").submit(function(){
   			if($("#board_pass").val()==''){
   				alert("비밀번호를 입력하세요");
   				$("#board_pass").focus();
   				return false;
   			}
   		});
   		
   		$(".start").click(function(){
   			getList();
   		});
   		
   		$("#content").on('input',function(){
   			length=$(this).val().length;
   			if(length>50){
   				length=50;
   				content=content.substring(0,length);
   			}
   			$(".float-left").text(length+"/50");
   		});
   		
   		$("#comment table").hide();
   		
   		function getList(){
   			$.ajax({
   				type:"post",
   				url:"CommentList.bo",
   				data:{"BOARD_RE_REF" : $("#BOARD_RE_REF").val()},
   				dataType:"json",
   				success:function(rdata){
   					if(rdata.length>0){
   						$("#comment table").show();
   						$("#comment thead").show();
   						$("#comment tbody").empty();
   						$("#message").text("");
   						output="";
   						$(rdata).each(function(){
   							img='';
   							if($("#loginid").val()==this.id){
   								img="<img src='resources/image/pencil2.png' width='15px' class='update'>"
   									+"<img src='resources/image/remove.png' width='15px' class='remove'>"
   									+"<input type='hidden' value='"+this.num+"'>";
   							}
   							output+="<tr><td>"+this.id+"</td>";
   							output+="<td>"+this.content+"</td>";
   							output+="<td>"+this.reg_date+img+"</td></tr>";
   							
   						});
   						$("#comment tbody").append(output);
   						
   					}else{
   						$("#message").text("등록된 댓글이 없습니다.");
   						$("#comment thead").hide();
   						$("#comment tbody").empty();
   					}
   					$("#count").text(rdata.length);
   				}
   			});
   		}
   		
   		$("#write").click(function(){
   			buttonText=$("#write").text();
   			content=$("#content").val();
   			$(".float-left").text("총 50자까지가능합니다.");
   			if(buttonText=='등록'){
   				url="CommentAdd.bo";
   				data={"content":content, "id":$("#loginid").val(), "BOARD_RE_REF" : $("#BOARD_RE_REF").val()};
   			}else{
   				url="CommentUpdate.bo";
   				data={"num":num , "content":content};
   				$("#write").text("등록");
   			}
   			
   			$.ajax({
   				type:"post",
   				url:url,
   				data:data,
   				dataType:"json",
   				success:function(result){
   					$("#content").val("");
   					if(result==1){
   						getList();
   					}
   				}
   			});
   		});
   		
   		$("#comment").on('click','.update',function(){
   			before=$(this).parent().prev().text(); //선택한 내용 가져옴
   			$("#content").focus().val(before); //textarea에 수정전 내용 보냄
   			num=$(this).next().next().val();  //수정할 댓글번호 저장
   			$("#write").text("수정 완료"); //등록버튼 라벨을 수정완료로 변경
   			$(this).parent().parent().css("background","lightgray");
   		});
   		
   		$("#comment").on('click','.remove',function(){
   			var num=$(this).next().val(); //댓글 번호
   			
   			$.ajax({
   				type:"post",
   				url:"CommentDelete.bo",
   				data:{"num" : num},
   				success:function(result){
   					if(result==1){
   						getList();
   					}
   				}
   			});
   		});
   	
   	});
   </script>
</head>
<body>
<input type="hidden" id="loginid" value="${id }" name="loginid">
   <div class="container">
      <table class="table table-striped">
         <tr>
            <th colspan="2">MVC 게시판-view페이지</th>
         </tr>
         
         <tr>
            <td><div>글쓴이</div></td>
            <td>${boarddata.BOARD_NAME }</td>
         </tr>
         
         <tr>
            <td>제목</td>
            <td>${boarddata.BOARD_SUBJECT }</td>
         </tr>
         
         <tr>
            <td>내용</td>
            <td><textarea class="form-control" rows="5" readOnly style="width:102%">${boarddata.BOARD_CONTENT }</textarea></td>
         </tr>
         
         <c:if test="${!empty boarddata.BOARD_FILE }">
         <tr>
            <td>
               <div>첨부파일</div>
            </td>
            <td>
               <img src="image/down.png" width="20px">
               <a href="BoardFileDown.bo?filename=${boarddata.BOARD_FILE}&original=${boarddata.BOARD_ORIGINAL}">${boarddata.BOARD_ORIGINAL}</a>
            </td>
         </tr>
         </c:if>
         
         <tr>
            <td></td>
            <td colspan="2" class="center">
            	<button class="btn btn-primary start">댓글</button>
            	<span id="count">${count }</span>
               
            <c:if test="${boarddata.BOARD_NAME == id || id == 'admin' }">
               <a href="BoardModifyView.bo?num=${boarddata.BOARD_NUM }">
                  <button class="btn btn-info">수정</button>
               </a>
               
               <a href="#">
                  <button class="btn btn-danger" data-toggle="modal" 
                  				data-target="#myModal">삭제</button>
               </a>
            </c:if>
            
               <a href="BoardList.bo">
                  <button class="btn btn-primary">목록</button>
               </a>
               
               <a href="BoardReplyView.bo?num=${boarddata.BOARD_NUM }">
                  <button class="btn btn-success">답변</button>
               </a>
         </tr>
      </table>
      
      	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">


				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="BoardDeleteAction.bo"
						method="post">
						<input type="hidden" name="num" value="${param.num}" id="BOARD_RE_REF">
						<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE }">
						<div class="form-group">
							<label for="pwd">비밀번호</label> 
							   <input type="password"
								class="form-control" placeholder="Enter password"
								name="BOARD_PASS" id="board_pass">
						</div>
						<button type="submit" class="btn btn-primary" >Submit</button>
					    <button type="button" class="btn btn-danger">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
		<div id="comment">
			<button class="btn btn-info float-left">총 50자 까지 가능합니다.</button>
			<button id="write" class="btn btn-info float-right">등록</button>
				<textarea rows=3 class="form-control" id="content" maxLength="50"></textarea>
				
				<table class="table table-striped">
					<thead>
						<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<div id="message"></div>
		</div>
   </div>
</body>
</html>