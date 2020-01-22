$(document).ready(function(){
	room_total_cost=$(".e_total_price_div:eq(0) .e_total_price").text();
	$(".e_total_price_div:eq(2) .e_total_price").text(room_total_cost);
	
})

$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 0;
	
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
	var food_code=$(this).closest('.e_product-info').find("input[name=food_code_info]").val();
	var product_price=$(this).closest('.e_product-info').find("span[name=product_price]").text();
	
	if(newVal>=1){
		
		if(!$("li[name=food_code_"+food_code+"]").length){
			var product_name=$(this).closest('.e_product-info').find('h1[name=product_text]').text();
			
			console.log("상품이름 : "+product_name)
			console.log("상품 가격 : "+product_price)
			
			output="<li name='food_code_"+food_code+"'>";
			
			output+="<input type='hidden' name='food_code' value='"+food_code+"'>";
			output+="<input type='hidden' name='count' value="+newVal+">";
			output+="<input type='hidden' name='food_total_cost' value="+product_price*newVal+">";
			
			output+="<div class='e_food_price_div'><span class='e_tit'>";
			output+=product_name+"</span><span class='e_drink_num'>";
			output+=newVal;
			output+="</span><span class='e_data'>";
			output+=product_price*newVal;
			output+="</span></div></li>"
				
			$(".food_list").append(output);
		}
		$("li[name=food_code_"+food_code+"] .e_drink_num").text(newVal);
		$("li[name=food_code_"+food_code+"] .e_data").text(newVal*product_price);
		$("li[name=food_code_"+food_code+"]").find("input[name=count]").val(newVal);
		$("li[name=food_code_"+food_code+"]").find("input[name=food_total_cost]").val(product_price*newVal);
			console.log("음식 코드:"+food_code)
			console.log("음식 갯수 : "+ $("li[name=food_code_"+food_code+"]").find("input[name=count]").val())
			console.log("음식 가격 : "+ $("li[name=food_code_"+food_code+"]").find("input[name=food_total_cost]").val())
		
	}else if(newVal==0){
		$(".food_list").find("li[name=food_code_"+food_code+"]").remove();
	
	}
	
	var total_price=0;	
	for(var i=0;i<parseInt($(".e_food_price_div .e_data").length);i++){
		total_price+=parseInt($(".e_food_price_div .e_data:eq("+i+")").text());
	}
	
	$(".e_total_price_div:eq(1) .e_total_price").text(total_price);
	$(".e_total_price_div:eq(2) .e_total_price").text(parseInt(total_price)+parseInt(room_total_cost));
	
	return false;
});


	
