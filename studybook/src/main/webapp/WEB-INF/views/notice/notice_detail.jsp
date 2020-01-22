<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice view</title>

<style>
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
   	$(function(){
   	
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
   		
   	});
</script>
</head>


<body>
<input type="hidden" id="memberkey" value="${key }" name="memberkey">


<p class=s_title></p>

   <div class="container">
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
               
           <!-- 이 부분에 c test 넣기 관리자만 보이게 -->
               <a href="NoticeModifyView.bo?num=${noticedata.NOTICE_NUM }">
                  <button class="modifybtn">수정</button>
               </a>
               
               <a href="#">
                  <button class="deletebtn" data-toggle="modal" 
                  				data-target="#myModal">삭제</button>
               </a>

            <!-- 여기까지 -->
               <a href="NoticeList.bo">
                  <button class="listbtn">list</button>
               </a>
               
              
         </tr>
      </table>
      
      	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">


				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="NoticeDeleteAction.bo"
						method="post">
						<div class="form-group">
							<label for="pwd">비밀번호</label> 
						</div>
						<button type="submit" class="submitbtn">Submit</button>
					    <button type="button" class="closebtn">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
   </div>
</body>
</html>