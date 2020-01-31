<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice detail view</title>

<style>

* {
	box-sizing: border-box;
	font-family: "맑은 고딕";   
}

body {
	background-color: #f2f2f2;
}

.contentwrap {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

.contentarea {
	background-color: white;
    width: 50%;
    min-width: 420px;
    height: auto;
}

.realcontent {
	margin-left: 200px;
    margin-right: 200px;
}

.s_title {
	margin-top: 30px;
	margin-bottom: 35px;
	font-size: 32px;
	text-align: center;
}

.s_container {
	display: flex;
	justify-content: center;
}
   
.title {
	font-size: 24px;
	text-align: center;
}

.date {
	font-size:14px;
	text-align: center;
}
   
.content {
	border:0px;
	font-size:14px;
}
   
th {
	text-align:center
}

.float-right {
	float:right;
}

.center {
	text-align:center;
}

.table td, .table th {
    border-top: 0px;
}

.modifybtn, .deletebtn {
	background-color: #ffffff;
	border: 0px;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
	color: #7F56D2;	
}

.modifybtn:hover, .deletebtn:hover {
	text-decoration: none;
	border: 0px;
	color: #56D7D6;
}

.listbtn {
	width: 330px;
	height: 43px;
	line-height:43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 50px;
	margin-bottom: 50px;
	border: none;
	cursor: pointer;
	
}

.listbtn:hover {
	opacity: 70%;
}
		

/* Modal for delete*/		    

#myModal {
   display:none;
}


.modal-dialog {
    max-width: 500px;
    margin: 1.75rem auto;
    margin-top: 200px;
}

.deleteForm {
	margin-top: 70px;
    text-align: center;
}    
    
.form-group {
	margin-bottom : 70px;
}    

.deletecheckbtn {
	width: 150px;
	height: 43px;
	line-height: 43px;
	background-color: #7F56D2;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	margin-left:10px;
	border: none;
	cursor: pointer;
}

.mdclosebtn {
	width: 150px;
	height: 43px;
	line-height: 43px;
	background-color: #56D7D6;
	color: white;
	margin-top: 10px;
	margin-bottom: 180px;
	border: none;
	cursor: pointer;
}

.deletecheckbtn:hover, .mdclosebtn:hover {
	opacity: 70%;
}


</style>

<script>
  
$(function() {


})
</script>
</head>


<body>

<div class=contentwrap>

<div class=contentarea>

<div class=realcontent>

<input type="hidden" id="memberkey" value="${key }" name="memberkey">
<p class=s_title></p>

   <div class="s_container">
      <table class="table">

         <tr>
            <td class=title>${noticedata.NOTICE_TITLE }</td>
         </tr>
         <tr>
            <td class=date>${noticedata.NOTICE_DATE }</td>
         </tr>
         <tr>
            <td>
            <textarea class="content" rows="20" readOnly style="width:100%">${noticedata.NOTICE_CONTENT }</textarea>
            </td>
         </tr>
         
         <tr>
            <td class=float-right>

               <a href="NoticeModifyView.bo?num=${noticedata.NOTICE_NUM }">
                  <button class="modifybtn">수정</button>
               </a>
               
               <a href=#>
                  <button class="deletebtn" data-toggle="modal" data-target="#myModal">삭제</button>
               </a>

            </td>
         </tr>
         
         <tr>

			<c:if test="${member.key!= '999' }">
            <td class=center>        
            <a href="NoticeList.bo"><button class="listbtn">리스트</button></a>
            </td>
            </c:if>	
            
           	<c:if test="${member.key== '999' }">
            <td class=center>        
            <a href="noticeadmin.bo"><button class="listbtn">리스트</button></a>
            </td>
            </c:if>	
         </tr>
      </table> 
</div> 
 
 </div>
 </div>
 </div>
 
 <!-- 모달모달 -->
      
      	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form name="deleteForm" action="NoticeDeleteAction.bo?num=${noticedata.NOTICE_NUM }" method="post"
					class=deleteForm>
						<div class="form-group">
							<span class=q>정말 삭제하시겠습니까.</span>
						</div>
						<button type="submit" class="deletecheckbtn">확인</button>
					    <button type="button" class="mdclosebtn">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>