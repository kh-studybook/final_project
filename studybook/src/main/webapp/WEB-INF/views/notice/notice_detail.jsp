<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice view</title>

<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

.s_title {
	margin-top: 230px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}
   
   
th {
	text-align:center
}

#myModal {
   display:none;
}
   	
#count {
   	position:relative;
   	top:-10px;
   	left:-10px;
   	background:orange;
   	color:white;
   	border-radius:30%;
}
</style>

<script>
  
</script>
</head>


<body>
<input type="hidden" id="memberkey" value="${key }" name="memberkey">
<p class=s_title></p>

   <div class="s_container">
      <table class="table table-striped">

         <tr>
            <td>${noticedata.NOTICE_TITLE }</td>
         </tr>
         
         <tr>
            <td><textarea class="form-control" rows="5" readOnly style="width:102%">${noticedata.NOTICE_CONTENT }</textarea></td>
         </tr>
         
         <tr>
            <td></td>
            <td colspan="2" class="center">
               
           <!-- 관리자만 수정/삭제 가능 -->    
           <c:if test="${member.name== '손연수' }">
           
               <a href="NoticeModifyView.bo?num=${noticedata.NOTICE_NUM }">
                  <button class="modifybtn">수정</button>
               </a>
               
               <a href="#">
                  <button class="deletebtn" data-toggle="modal" 
                  				data-target="#myModal">삭제</button>
               </a>
            </c:if>
            <!-- 여기까지 -->
            
               <a href="NoticeList.bo"><button class="listbtn">리스트</button></a>
         </tr>
      </table>
      
      	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="NoticeDeleteAction.bo" method="post">
						<div class="form-group">
							<span>정말 삭제하시겠습니까.</span>
						</div>
						<button type="submit" class="submitbtn">확인</button>
					    <button type="button" class="closebtn">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
   </div>
</body>
</html>