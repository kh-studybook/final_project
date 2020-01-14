$(document).ready(function(){
	$('#m_write_date').click(function(){
		if($('.e_calendar').css("display") == "none"){
			$('.e_calendar').css("display", "inline-grid");
		} else {
			$('.e_calendar').css("display", "none");
			$('.m_main_select').eq(0).css("position", "");
		}
	})
	
	$('.m_main_select').eq(1).click(function(){
		if($('#m_main_time').css("opacity") == '0'){
			$('#m_main_time').css("opacity", "1");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(1).css("position", "relative");
		} else {
			$('#m_main_time').css("opacity", "0");
			$('.m_main_select').eq(1).css("position", "");
		}
	})
	
	$('.m_main_select').eq(2).click(function(){
		if($('#m_main_count').css("opacity") == '0'){
			$('#m_main_count').css("opacity", "1");
			$('.m_main_select').eq(0).css("position", "");
			$('.m_main_select').eq(2).css("position", "relative");
		} else {
			$('#m_main_count').css("opacity", "0");
			$('.m_main_select').eq(2).css("position", "");
		}
	})
	
	$('.e_dates').children().click(function(){
		$('#m_write_date').empty();
		$('#m_write_date').append($(this).text());
		$('#m_write_date').append(" ");
		$('#m_write_date').append($('.month').children().next().text())
		$('#m_write_date').append('<i class="fas fa-chevron-down"></i>');
		$(this).parent().parent().prev().css('padding','10px');
		$('.e_calendar').css("display", "none");
	})
	
	$('#m_main_time').children().children().click(function(){
		$('#m_write_time').empty();
		$('#m_write_time').append($(this).text());
		$('#m_write_time').append('<i class="fas fa-chevron-down"></i>');
		$(this).parent().parent().prev().css('padding','10px');
	})
	
	$('#m_main_count').children().children().click(function(){
		$('#m_write_count').empty();
		$('#m_write_count').append($(this).text());
		$('#m_write_count').append('<i class="fas fa-chevron-down"></i>');
		$(this).parent().parent().prev().css('padding','10px');
	})
})