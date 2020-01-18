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
	
	
	
	$(document).ready(function(){
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
		
	});
 
	
