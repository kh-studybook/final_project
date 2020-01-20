

$(document).on(
			'click',
			'.number-spinner button',
			function() {
				var btn = $(this), oldValue = btn.closest('.number-spinner')
						.find('input').val().trim(), newVal = 0;

				if (btn.attr('data-dir') == 'up') {
					newVal = parseInt(oldValue) + 1;

				} else {
					if (oldValue > 1) {
						newVal = parseInt(oldValue) - 1;

					} else {
						newVal = 1;
					}
				}
				btn.closest('.number-spinner').find('input').val(newVal);
				$("#extra_num").text(newVal);
				$("#extra_num_price").text(1000*newVal);
				var extra_price=$("#extra_num_price").text();
				var room_price=$("#total_time_price").text();
				$("#total_price").text(parseInt(extra_price)+parseInt(room_price));
				return false;
			});
	
	function go(page) {
	   var room_code=$("#room_code").val();
	   var data = "room_code=" + room_code + "&state=ajax&page=" + page;
	   ajax(data);
	}
	
	function setPaging(href, digit){
		output+="";
		gray = "";
		if (href  == "#") {
			gray="is-active";//현재 페이지에 회색이 나오도록 하기 위함
		}
		anchor = "<a class = '"+gray+"'" + href + "><li>" + digit + "</li></a>";
		output += anchor;
		console.log(output)
	}
	
	function ajax(data) {
		   console.log(data)
		   output = "";
		   $.ajax({
		      type : "POST",
		      data : data,
		      url : "getReviewList.re",
		      dataType : "json",
		      cache : false,
		      success : function(data) {
		    	  console.log(data)
		         $(".e_text_box").find(".e_review_count").text(data.listcount+"개");

		         if (data.listcount > 0) { // 총갯수가 0개이상인 경우
		            /*$(".e_review_list").remove();*/
	
		            output = "";
		            
		            $(data.reviewlist).each(
		               function(index, item) {
		            	  output += "<li class='e_rlist'><div class='e_rbox_mine'><div class='e_pf_info'><div class='e_pf_pic'>";
		                  output += "<img src='"+item.profile+"'></div>";
		                  output += "<h2 class='e_guest_name'>"+item.name+"</h2></div>";
		                  output += "<div class='e_review_info'>"
		                	 if(mem_key==item.mem_key){
		                		 output+="<span class='e_review_manage'><a href='#'>수정</a>/";
		                		 output+="<a href='#'>삭제</a></span>";
		                	 }
		                  output += "<p class='e_p_reivew'>"+item.content+"</p>";
		                  output += "<div class='e_rbox_info_base'><span class='e_time_info'>";
		                  output += item.review_date+"</span></div></div></div></li>";
		               
		               })
		        
		          
		            $('.e_review_list').append(output);//table 완성
		            
		          $(".pagination").empty(); //페이징 처리
		            output = "";
		            
		            digit = '<'
		            href="";   
		            if (data.page > 1) {
		               href = 'href=javascript:go(' + (data.page - 1) + ')';
		            }
		            setPaging(href, digit);
		            
		            for (var i = data.startpage; i <= data.endpage; i++) {
		               digit = i;
		               href="#";
		               if (i != data.page) {
		                  href = 'href=javascript:go(' + i + ')';
		               } 
		               setPaging(href, digit);
		            }
		            
		            digit = '>';
		            href="";
		            if (data.page < data.maxpage) {
		               href = 'href=javascript:go(' + (data.page + 1) + ')';
		            } 
		            setPaging( href, digit);
		            
		            $('.pagination').append(output)
		         }//if(data.listcount) end
		         
		         else {
		            $(".e_review_list").remove();
		            $(".e_review_box").remove();
		            $('.e_review_box').append("<font size=5>등록된 글이 없습니다.</font>");
		         }
		      }, //success end
		      error : function() {
		         console.log('에러')
		      }
		   })// ajax end
		 } //function end
	
	$(document).ready(function(){
		 go(1);
		
		var mem_key=$("#mem_key").val();
		
		var time_check=0;
		$(".swiper-slide").click(function(){
			
			if(time_check==0){
				
				$(".swiper-slide").css("background","#57D7D5");
				$(".swiper-slide").css("color","black");
				$(".swiper-wrapper").find('input').removeAttr('name');
				
				var time=$(this).find($("input")).val();
				console.log("시작시간"+time)
				$(this).css("background","#855FD4");
				$(this).find($("input")).attr("name","start_time");
				time_check=1;
				
			}else if(time_check==1){
				var time2=$(this).find($("input")).val();
				console.log("종료시간"+time2)
				$(this).find($("input")).attr("name","end_time");
				
				var start_time=$(".swiper-slide").find($("input[name=start_time]")).val();
				$("#start_time_span").text(start_time);	
				var end_time=$(".swiper-slide").find($("input[name=end_time]")).val();
				$("#end_time_span").text(end_time);
				
				var total_time=end_time-start_time;
				$("#select_time_span").text(total_time);
				var time_price=$("#time_price").text();
				$("#total_time_price").text((time_price*total_time));
				
				
					for(var i=parseInt(start_time);i<=parseInt(end_time);i++){
						console.log("for문의 i값="+i)
						console.log($(".swiper-slide").find($("input[id="+i+"]")).val());
						$(".swiper-slide").find($("input[id="+i+"]")).parent().css("background","#855FD4");
						$(".swiper-slide").find($("input[id="+i+"]")).parent().css("color","white");
					}
				var extra_price=$("#extra_num_price").text();
				var room_price=$("#total_time_price").text();
				$("#total_price").text(parseInt(extra_price)+parseInt(room_price));
				time_check=0;
			}
		});	
		
		$(".e_to_reserve_page").click(function(){
			location.href="room_reserve.re";
		})
	
	});
 
	
