<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-n-head="">
<title data-n-head="true">StudyBook</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/room_detail.css" />
</head>
<body>
	<div class="wrap">
		<div class="inner_width">
			<div class="h_area">
				<div class="h_space">
					<h2 class="space_name">B101</h2>
				</div>
				<p class="sub-desc">가성비 끝판왕! 인원 상관없이 9만9천원</p>
				<div class="tags">
					<span class="tag">#스터디</span> 
					<span class="tag">#회의</span>
					<span class="tag">#세미나</span>
				</div>
			</div>

			<div class="detail_forms">
				<div class="box_form right_fixed detail_space">
					<div class="ly_right_wrap meet">
						<div class="ly_right_fixed">
							<div class="heading">
								<h3>세부공간 선택</h3>
							</div>
							<div class="scroll_box">
								<div class="scroll_inner">
									<div class="space_info_wrap active">
										<ul class="list_detail">
											<li><span class="tit">공간 유형</span> 
											<span class="data">
													<span>회의실</span> <span>세미나실</span> <span>스터디룸</span>
											</span></li>

											<li><span class="tit">예약시간</span>
											 <span class="data">최소 1시간 부터 </span></li>

											<li><span class="tit">예약인원</span> <span class="data">
													최소 1명~최대 24명 </span></li>
										</ul>

										<div class="facility_wrap">
											<ul class="facility_list">
												<li><i class="sp_icon ico_table"></i> <span
													class="txt_name"> 의자/<em class="br">테이블</em>
												</span></li>
												<li><i class="sp_icon ico_table"></i> <span
													class="txt_name"> 음식물<em class="br">반입가능</em>
												</span></li>
												<li><i class="sp_icon ico_table"></i> <span
													class="txt_name"> 내부<em class="br">화장실</em>
												</span></li>
												<li><i class="sp_icon ico_table"></i> <span
													class="txt_name"> 금연 </span></li>
											</ul>
										</div>

										<h2 class="meetspace-heading">예약선택</h2>
										<div class="meetspace-option">
											<article class="box_form meetspace-calandar">
												<div class="heading">
													<h3>날짜 선택</h3>
													<!---->
												</div>
												<div class="reserve_calendar_wrap timely">
													<div class="calendar_tit">
														<a class="btn_month_prev"><span
															class="sp_icon ico_month_prev">이전달</span></a> <strong><em>2020</em>.<em>01</em></strong>
														<a class="btn_month_next"><span
															class="sp_icon ico_month_next">다음달</span></a>
													</div>
													<div class="calendar">
														<table>
															<caption class="blind">달력 테이블</caption>
															<colgroup>
																<col span="7" style="width: auto;">
															</colgroup>
															<thead>
																<tr>
																	<th>SUN</th>
																	<th>MON</th>
																	<th>TUE</th>
																	<th>WED</th>
																	<th>THU</th>
																	<th>FRI</th>
																	<th>SAT</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="disable"><a><span class="date">29</span></a></td>
																	<td class="disable"><a><span class="date">30</span></a></td>
																	<td class="disable"><a><span class="date">31</span></a></td>
																	<td class="disable"><a><span class="date">1</span></a></td>
																	<td class="disable"><a><span class="date">2</span></a></td>
																	<td class="disable"><a><span class="date">3</span></a></td>
																	<td class="disable"><a><span class="date">4</span></a></td>
																</tr>
																<tr>
																	<td class="disable"><a><span class="date">5</span></a></td>
																	<td class="disable"><a><span class="date">6</span></a></td>
																	<td class="disable"><a><span class="date">7</span></a></td>
																	<td class="disable"><a><span class="date">8</span></a></td>
																	<td class="today"><a><span class="date">9</span></a></td>
																	<td class=""><a><span class="date">10</span></a></td>
																	<td class=""><a><span class="date">11</span></a></td>
																</tr>
																<tr>
																	<td class=""><a><span class="date">12</span></a></td>
																	<td class=""><a><span class="date">13</span></a></td>
																	<td class=""><a><span class="date">14</span></a></td>
																	<td class=""><a><span class="date">15</span></a></td>
																	<td class=""><a><span class="date">16</span></a></td>
																	<td class=""><a><span class="date">17</span></a></td>
																	<td class=""><a><span class="date">18</span></a></td>
																</tr>
																<tr>
																	<td class=""><a><span class="date">19</span></a></td>
																	<td class=""><a><span class="date">20</span></a></td>
																	<td class=""><a><span class="date">21</span></a></td>
																	<td class=""><a><span class="date">22</span></a></td>
																	<td class=""><a><span class="date">23</span></a></td>
																	<td class=""><a><span class="date">24</span></a></td>
																	<td class=""><a><span class="date">25</span></a></td>
																</tr>
																<tr>
																	<td class=""><a><span class="date">26</span></a></td>
																	<td class=""><a><span class="date">27</span></a></td>
																	<td class=""><a><span class="date">28</span></a></td>
																	<td class=""><a><span class="date">29</span></a></td>
																	<td class=""><a><span class="date">30</span></a></td>
																	<td class=""><a><span class="date">31</span></a></td>
																	<td class=""><a><span class="date">1</span></a></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="color_desc">
													<span class="color_disable">예약불가</span> <span
														class="color_today">오늘</span> <span class="color_select">선택</span>
												</div>
											</article>
											<article class="box_form">
												<!---->
												<!---->
												<!---->
												<!---->
											</article>

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="photo_box_wrap type9">
					<div class="detail_box v slide_wrap">
						
					</div>
					<div class="text_box">
						<h3 class="h_copy">당신만의 공간으로 새로운 도전을 시작하세요</h3>
						<h4 class="h_intro">공간 소개</h4>
						<p class="p_intro">
						-공간 소개1<br>
						-공간 소개2<br>
						-공간 소개3<br>
						</p>
					</div>
					<div class="text_box">
						<h4 class="h_intro">시설 안내</h4>
						
					</div>
					
					<div class="text_box">
						<h4 class="h_intro">예약시 주의 사항</h4>
						
					</div>
					
					<div class="text_box">
						<h4 class="h_intro">환불 규정</h4>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>