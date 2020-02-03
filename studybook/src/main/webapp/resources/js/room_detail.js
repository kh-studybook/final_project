$(document).on('click','.number-spinner button',
			function() {
				var btn = $(this), oldValue = btn.closest('.number-spinner')
						.find('input').val().trim(), newVal = 0;

				if (btn.attr('data-dir') == 'up') {
					newVal = parseInt(oldValue) + 1;

				} else {
					if (oldValue > 1) {
						newVal = parseInt(oldValue) - 1;

					} else {
						newVal = 0;
					}
				}
				btn.closest('.number-spinner').find('input').val(newVal);
				$("#extra_num_span").text(newVal);
				$("#extra_num").val(newVal);
				$("#extra_num_price").text(1000*newVal);
				var extra_price=$("#extra_num_price").text();
				var room_price=$("#total_time_price").text();
				$("#total_cost_span").text(parseInt(extra_price)+parseInt(room_price));
				$("#total_cost").val(parseInt(extra_price)+parseInt(room_price));
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
		            $(".e_review_list").text("");
		        	 
		            output = "";
		            
		            $(data.reviewlist).each(
		               function(index, item) {
		            	  output += "<li class='e_rlist'><div class='e_rbox_mine'><div class='e_pf_info'><div class='e_pf_pic'>";
		                  output += "<img src='resources/image/profile/"+item.profile+"'></div>";
		                  output += "<h2 class='e_guest_name'>"+item.name+"</h2></div>";
		                  output += "<div class='e_review_info'>"
		                	 if(mem_key==item.mem_key){
		                		 output+="<span class='e_review_manage'><a href='#'>수정</a>/";
		                		 output+="<a href='#'>삭제</a></span>";
		                	 }
		                  output += "<p class='e_p_reivew'>"+item.content+"</p>";
		                  output += "<div class='e_rbox_info_base'><span class='e_time_info'>이용 날짜 : ";
		                  output += item.review_date.substring(0,10)+"</span></div></div></div></li>";
		               
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
		
		$(".carousel-indicators li:first-child").addClass("active");
		$(".carousel-inner div:first-child").addClass("active");
		
		go(1);
		
		var mem_key=$("#mem_key").val();
		
		var time_check=0;
			$(".swiper-slide").click(function(){
				console.log("time_check="+time_check)
				var date=$("#reserve_date_span").text();
				console.log(date)
				
				if(date==""){
					alert("날짜를 먼저 선택해주세요");	
				}else{
				if(time_check==0){

					div_color();
					
					$(".swiper-wrapper").find('input').attr("name","time_slide");
					/*$(".swiper-wrapper").each(function(){
						$(this).find('input').attr("name","time_slide");
					})*/
					var time=$(this).find($("input")).val();
					console.log("시작시간"+time)
					//$(this).css("background","#855FD4");
					$(this).addClass("e_active");
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
					if(parseInt(start_time)>=parseInt(end_time)){
						alert("잘못된 선택입니다.");
						location.reload();
					}
					
					var total_time=end_time-start_time;
					$("#select_time_span").text(total_time);
					var time_price=$("#time_price").text();
					$("#total_time_price").text((time_price*total_time));
					
					
						for(var i=parseInt(start_time);i<=parseInt(end_time);i++){
							console.log("for문의 i값="+i)
							if($(".swiper-slide").find($("input[id="+i+"]")).parent().hasClass("not_active")==true){
								alert("이미 예약된 시간을 포함하였습니다.\n다시 골라주세요!");
								history.go(0);
								break;
							}
							console.log($(".swiper-slide").find($("input[id="+i+"]")).val());
							//$(".swiper-slide").find($("input[id="+i+"]")).parent().css("background","#855FD4");
							//$(".swiper-slide").find($("input[id="+i+"]")).parent().css("color","white");
							$(".swiper-slide").find($("input[id="+i+"]")).parent().addClass("e_active");
						}
					var extra_price=$("#extra_num_price").text();
					var room_price=$("#total_time_price").text();
					$("#total_cost_span").text(parseInt(extra_price)+parseInt(room_price));
					$("#total_cost").val(parseInt(extra_price)+parseInt(room_price));
					time_check=0;
					console.log("time_check="+time_check)
					}
				}
			});
			
		$(".e_to_reserve_page").click(function(){
			location.href="room_reserve.re";
		})
		
	});
	
function div_color(){
	console.log("여기는 div_color")
	$(".swiper-slide").removeClass("e_active");
	if(!$(".swiper-slide").hasClass("not_active")){
		$(".swiper-slide").css("background","#57D7D5");
		$(".swiper-slide").css("color","black");
	}
}
 
	function reserve_ajax(data) {
		   console.log(data)
		   console.log("reserve_ajax")
		    $.ajax({
  			      type : "POST",
  			      data : data,
  			      url : "reserve_time_check.re",
  			      dataType : "json",
  			      cache : false,
  			      success : function(data) {
  			    	  console.log(data)
  			      
  			         if (data!=null) { // 총갯수가 0개이상인 경우
  			        	 console.log("data 0개 이상")
  			            $(data).each(
  			               function(index, item) {
  			            	 $('.swiper-wrapper input[name=time_slide]').each(function(){
  			       					var hour=this.value;
  			       					if (parseInt(hour) >= parseInt(item.start_time) 
  			       							&& parseInt(hour) <= parseInt(item.end_time)) { 
  			       					console.log("예약되어있는 시간:"+this.value);
  			       					$(this).parent().addClass("not_active");
  			       								}
  			       				}) ;
  			               }
  			              )
  			       }else {
  			            	console.log("예약되어있는 시간이 없다. == 모든 시간 예약 가능");
  			         }
  			      }, //success end
  			      error : function() {
  			         console.log('에러')
  			      }
  			   });// ajax end
		  
		   }
