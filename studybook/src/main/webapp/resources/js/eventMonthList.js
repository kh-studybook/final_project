$(document).ready(function(){
    // 스터디룸 검색 결과 1페이지 불러오기
    getList(1);
})// ready() end

	function setPaging(href, digit){
		output+="<li class='page-item'>";
		gray = "";
		if (href  == "#") {
			gray=" current";// 현재 페이지에 회색이 나오도록 하기 위함
		}
		anchor = "<a class='page-link"+gray+"'" + href + ">" + digit + "</a></li>";
		output += anchor;
	}// setPaging() end
    
function getList(page){
	$.ajax({
		type:"post",
		url:"getEventList.eve",
		data : {"page" : page},
		dataType:"json",
		cache: false,
		success:function(rdata){
			if(rdata.listcount > 0){
				$("#j_main_room").empty();
				output = "";
				output += '<div class="row">';
				$(rdata.list).each(
					function(index, item){
						output += '<div class="col-md-4">';
						output += '<div class="wrapper">';
						output += '<div class="tile job-bucket">';
						output += '<div class="front">'
						output += '<div class="card" onClick="javascript:location.href=' + "'";
						output += 'EventDetailAction.eve?event_num=' + item.event_num + "'" + '">';
						output += '<img class="card-img-top img-fluid rounded mx-auto d-block" src="resources/upload/' + item.event_pic + '">';
  						output += '<div class="card-body">';
  						output += '<p class="card-text">';
  						output += '<span class="j_room_name">' + item.title + '</span>';
  						output += '</P>';
  						output += '<p class="card-text">';
  						output += '<span class="j_room_count">' + item.event_date.substr(0,10) + "</span>"
  						output += '<span class="j_room_pay">' + item.event_start + '시 ~ ' + item.event_end + '시</span>';
  						output += '<span class="j_room_tag">' + item.event_room + '</span>';
  						output += '</p></div></div></div></div></div></div>';
  						if(index == rdata.list.length-1){
  							if((index+1)%3==1){
  								output += '<div class="col-md-4"></div>';
  		  						output += '<div class="col-md-4"></div>';
  							} else if((index+1)%3==2){
  								output += '<div class="col-md-4"></div>';
  							}
  						}
					})
				output += '</div>';
				output += '<br><br>';
				
				// 페이지네이션 시작
				output += '<div id = "center-block" class="center-block">';
				output += '<div class="row">';
				output += '<div class="col">';
				output += '<ul class="pagination">';
	            
	            digit = '&lt';
	            href="";   
	            if (rdata.page > 1) {
	               href = 'href=javascript:getList(' + (rdata.page - 1) + ')';
	            }
	            setPaging(href, digit);
	            
	            for (var i = rdata.startpage; i <= rdata.endpage; i++) {
	               digit = i;
	               href="#";
	               if (i != rdata.page) {
	                 href = 'href="javascript:getList(' + i + ')"';
	               }
	               setPaging(href, digit);
	            }
	            
	            digit = '&gt';
	            href="";
	            if (rdata.page < rdata.maxpage) {
	               href = 'href=javascript:getList(' + (rdata.page + 1) + ')';
	            } 
	            setPaging(href, digit);
	            
	            output += '</ul></div></div></div>'
	            
	            $("#j_main_room").append(output);
			} else {
				output = '';
				output += '<div class="row">';
				output += '<div class="col-md-12">';
				output += '<div id="m_none"><p>이번 달에 등록된 이벤트가 없습니다.</p></div>';
				output += '</div></div>';
				$("#j_main_room").empty();
				$("#j_main_room").append(output);
			}
		}, // success end
		error : function() {
	         console.log('eventlist ajax 에러')
	    }
	});// ajax end
}// getList() end