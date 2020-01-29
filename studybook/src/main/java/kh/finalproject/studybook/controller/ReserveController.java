
package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Mail;
import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.service.MemberService;
import kh.finalproject.studybook.service.ReserveService;
import kh.finalproject.studybook.service.RoomService;
import kh.finalproject.studybook.task.SendMail;

@Controller
public class ReserveController {
	@Autowired
	private RoomService roomservice;

	@Autowired
	private ReserveService reserveservice;

	@Autowired
	private SendMail sendMail;

	// 리뷰 가져오기
	@ResponseBody
	@RequestMapping(value = "getReviewList.re")
	public Object getReview(@RequestParam(value = "page", defaultValue = "1", required = false) int page, int room_code)
			throws Exception {
		int limit = 3;
		int listcount = reserveservice.getreviewcount(room_code);
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / limit) * limit + 1;
		int endpage = startpage + limit - 1;
		if (endpage > maxpage)
			endpage = maxpage;
		List<ReviewInfo> reviewlist = reserveservice.getReviewList(room_code, page, limit);

		Map<String, Object> obj = new HashMap<String, Object>();

		obj.put("page", page);
		obj.put("maxpage", maxpage);
		obj.put("startpage", startpage);
		obj.put("endpage", endpage);
		obj.put("listcount", listcount);
		obj.put("reviewlist", reviewlist);

		return obj;
	}

	// 예약 페이지로
	@RequestMapping(value = "room_reserve_page.re")
	public ModelAndView room_reserve_page(Reserve reserve, ModelAndView mv, HttpSession session) {
		System.out.println("room_reserve페이지 가기전 액션");
		System.out.println("룸 코드 번호= " + reserve.getRoom_code());
		
		Room room = roomservice.getRoomInfo(reserve.getRoom_code());
		Member member = (Member) session.getAttribute("member");
		System.out.println("member.key:"+member.getKey());
		mv.addObject("room", room);
		mv.addObject("member", member);
		mv.addObject("reserve", reserve);
		mv.setViewName("room/room_reserve_page");
		
		return mv;

	}


	// 음료추가 페이지로
	@RequestMapping(value = "food_add_page.re")
	public ModelAndView food_add_page(Reserve reserve, ModelAndView mv) {
		System.out.println("룸코드=" + reserve.getRoom_code());

		List<Food> foodlist=reserveservice.getFoodListAll();
		mv.addObject("foodlist",foodlist);

		mv.addObject("reserve", reserve);
		mv.setViewName("room/food_add_page");
		return mv;
	}

	@RequestMapping(value = "GoPayment.re")
	public ModelAndView goPayment(Reserve reserve,
			@RequestParam(value = "food_code", required = false) List<Integer> food_code,
			@RequestParam(value = "count", required = false) List<Integer> count,
			@RequestParam(value = "food_total_cost", required = false) List<Integer> food_total_cost, ModelAndView mv)
			throws Exception {
		
		System.out.println("gay로 가는 GoPayment.re");

		int room_price = reserve.getTotal_cost();
		System.out.println("룸 비용 : " + reserve.getTotal_cost());

		
		int food_price = 0;
		if(count!=null) {
			System.out.println("음식 갯수 : " + count.size());
			for (int i = 0; i < food_total_cost.size(); i++) {
				food_price += food_total_cost.get(i);
				}
		
			mv.addObject("food_code", food_code);
			mv.addObject("count", count);
			mv.addObject("food_total_cost", food_total_cost);
		}
		
		System.out.println("음식 총액 : " + food_price);
		int room_food_total_price = room_price + food_price;
		System.out.println("총 금액: " + room_food_total_price);

		System.out.println("room_code="+reserve.getRoom_code());
		mv.addObject("reserve", reserve);
		mv.addObject("room_food_total_price", room_food_total_price);
		mv.setViewName("room/pay");
		
		return mv;
	}

	// 예약 완료 페이지로
	@RequestMapping(value = "reserve_ok_page.re")
	public ModelAndView reserve_ok_page(Reserve reserve,
			@RequestParam(value = "food_code", required = false) List<Integer> food_codes,
			@RequestParam(value = "count", required = false) List<Integer> counts,
			@RequestParam(value = "food_total_cost", required = false) List<Integer> food_total_costs, ModelAndView mv) {
		
		System.out.println("예약완료 페이지");
		System.out.println(reserve.getReserver_phone());
		reserve.setReserve_date(reserve.getReserve_date().substring(0, 10));
		int result=reserveservice.insertReserve(reserve);
		if(result==1) {
			if(counts!=null) {
			for(int i=0;i<food_codes.size();i++) {
				Food_reserve fr=new Food_reserve();
				fr.setR_code(reserve.getR_code());
				fr.setFood_code(food_codes.get(i));
				fr.setCount(counts.get(i));
				fr.setFood_total_cost(food_total_costs.get(i));
				reserveservice.insertFood_reserve(fr);			
				}
			}	
		int r_code=reserveservice.getR_code();		
		mv.setViewName("redirect:reserve_check.re?r_code="+r_code);
		return mv;
		
		}else {
			System.out.println("예약 등록 실패");
			return null;
		}
		
	}
	
	@RequestMapping(value = "reserve_check.re")
	public ModelAndView reserve_ok_page(int r_code, ModelAndView mv) {
		
		Reserve reserve_check=reserveservice.getReserveDetail(r_code);
		reserve_check.setReserve_date(reserve_check.getReserve_date().substring(0, 10));
		List<Food_reserve> food_reservelist=reserveservice.getFood_reservelist(r_code);
		int room_food_total=reserve_check.getTotal_cost();
		int foods_total=0;
			for(int i=0;i<food_reservelist.size();i++) {
				foods_total+=food_reservelist.get(i).getFood_total_cost();
			}
		room_food_total+=foods_total;
		
		mv.addObject("reserve_check", reserve_check);
		mv.addObject("foods_total",foods_total);
		mv.addObject("room_food_total",room_food_total);
		mv.addObject("food_reservelist",food_reservelist);
		mv.setViewName("room/reserve_ok_page");
		
		//메일 보내기
		Mail mail=new Mail();
		mail.setTo(reserve_check.getReserver_email());
		mail.setContent("<예약 확인서><br>"+
				"예약 번호 : "+reserve_check.getR_code()+"<br>"+
				"예약자 : "+reserve_check.getReserver_name()+"<br>"+
				"예약자 번호 : "+reserve_check.getReserver_phone()+"<br>"+
				"예약날짜 : "+reserve_check.getReserve_date()+"<br>"+
				"예약시간 : "+reserve_check.getStart_time()+"~"+reserve_check.getEnd_time()+"시<br>"+
				"예약한 룸 : "+reserve_check.getRoom_name()+"<br>"+
				"예약 총액 : "+room_food_total+"<br>"
						);
		sendMail.sendMail(mail);
		return mv;
	}

 
	// 지은 시작
	@GetMapping(value = "myReviewList.re")
	public ModelAndView reviewlist(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "5", required = false) int limit, int key, ModelAndView mv)
			throws Exception {
		List<Review> list = null;
		int listcount = 0;

		list = reserveservice.getSearchList(page, limit, key);
		System.out.println("ReserveController의 reserveservice.getSearchList 끝");
		listcount = reserveservice.getSearchListCount(key);
		System.out.println("ReserveController의 reserveservice.getSearchListCount 끝");

		// 총페이지수
		int maxpage = (listcount + limit - 1) / limit;
		// 현재 페이지에 보여줄 시작 페이지수 11, 21,31
		int startpage = ((page - 1) / 5) * 5 + 1;

		// endpage : 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage + 5 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
		
		mv.setViewName("member/review_index");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		System.out.println("listcount=" + listcount);
		mv.addObject("reviewlist", list);

		return mv;

	}
	
	//나의 후기 삭제
	@PostMapping("ReviewDelete.re")
	public String ReviewDeleteAction(int review_code, int key, HttpServletResponse response)throws Exception{
		System.out.println("멤버키"+key);
		
		int result = reserveservice.reviewDelete(review_code);
		
		if(result==0) {
			System.out.println("후기 삭제 실패");
		}
		System.out.println("후기 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='myReviewList.re?key="+key+"';");
		out.println("</script>");
		out.close();
		return null;
		
	}
	//나의 후기 상세불러오기
	@ResponseBody
	@PostMapping("reviewDetail.re")
	public Review reviewDetailView(int review_code) throws Exception{
		Review review = reserveservice.getReviewDetail(review_code);
		return review;
	}
	//나의 후기 수정하기
	@PostMapping("ReviewModify.re")
	public String modifyReviewAction(int review_code,int key, String contents, HttpServletResponse response) throws Exception{
		System.out.println("나의 리뷰 수정 액션 modifyReviewAction");
		int result = reserveservice.updateReview(contents, review_code);
		if(result==0) {
			System.out.println("후기 수정 실패");
		}
		System.out.println("후기 수정 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정 되었습니다.');");
		out.println("location.href='myReviewList.re?key="+key+"';");
		out.println("</script>");
		out.close();
		return null;
	}
	//어드민- 예약 리스트ReserveAdList.re
	@RequestMapping(value = "/ReserveAdList.re", method = RequestMethod.GET)
	public ModelAndView reserveList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word) throws Exception {
		List<Reserve> list = null;
		int listcount = 0;
		list = reserveservice.getSearchList(index, search_word, page, limit);
		System.out.println("ReserveController의 reserveservice.getSearchList 끝");
		listcount = reserveservice.getSearchListCount(index, search_word);
		System.out.println("ReserveController의 reserveservice.getSearchListCount 끝");
		
		// 총페이지수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수 11,21
		int startpage = ((page - 1) / 10) * 10 + 1;

		// endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/reserve_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		System.out.println("listcount=" + listcount);
		mv.addObject("reservelist", list);// jsp에서 roomlist로 받아야함
		mv.addObject("limit", limit);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);

		return mv;
	}
	
	//예약 내역 확인 및 수정 ReserveModify.re// 상세내용 조회
	@GetMapping("ReserveModify.re")
	public ModelAndView reserveModify(int r_code, ModelAndView mv,HttpServletRequest request) throws Exception {
		Reserve reservedata = reserveservice.getReserveFullDetail(r_code);
		List<Food_reserve> fooddata =  reserveservice.getFood_reservelist(r_code);
		
		if(reservedata==null) {
			System.out.println("(수정)상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "(수정) 상세보기 실패입니다.");
			return mv;
		}
		System.out.println("(수정)상세보기 성공");
		mv.addObject("reservedata", reservedata);
		mv.addObject("food_reservelist", fooddata);
		mv.setViewName("admin/reserve_modify");
		return mv;
	}
	
	//어드민 예약 수정 ReserveModifyAction.re
	@PostMapping("ReserveModifyAction.re")
	public ModelAndView ReserveModifyAction(Reserve reserve, ModelAndView mv, HttpServletRequest request, HttpServletResponse response ) throws Exception{
		int result = reserveservice.updateReserve(reserve);
		//수정 실패하는 경우
		if (result == 0) {
			System.out.println("Reserve 테이블 수정 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "Reserve 테이블 수정 실패");
		} 

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='ReserveAdList.re';");
		out.println("</script>");
		out.close();
		return null;
	}
	//어드민- 예약 취소 CancelAdReserve.re
	@GetMapping("CancelAdReserve.re")
	public String cancelReserve(int r_code, HttpServletResponse response ) throws Exception{
		
		int result = reserveservice.reserve_cancel(r_code);
		if (result == 0) {
			System.out.println("예약 취소 실패");
		}
		System.out.println("예약 취소 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('예약 취소 되었습니다.');");
		out.println("location.href='ReserveAdList.re';");
		out.println("</script>");
		out.close();
		return null;
		
	}
	
	
	
	//
	
	
	// 지은 끝


	//은지- 날짜별 예약된 시간체크
	@ResponseBody
	@RequestMapping(value="reserve_time_check.re")
	public Object reserve_time_check(String search_date,int room_code) {
		
		List<Reserve> reservelist=reserveservice.getReserve_timelist(search_date,room_code);
		
		return reservelist;
	}
	
	//은지- 예약취소하기
	@GetMapping(value="reserve_cancel_action.re")
	public void reserve_cancel(int r_code,HttpServletResponse response) throws IOException  {
		int result=reserveservice.reserve_cancel(r_code);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result==1) {
			System.out.println("예약 취소 완료");
					
			out.println("alert('취소 완료 되었습니다.');");
			out.println("location.href='reserve_cancel_page.re?r_code="+r_code+"';");

		}else {
			out.println("alert('취소 실패입니다.');");
			out.println("history.back();");
			
		}
		out.println("</script>");
		out.close();
				
	}
	
	//은지- 예약취소페이지
	@RequestMapping(value="reserve_cancel_page.re")
	public ModelAndView reserve_cancel_page(int r_code,ModelAndView mv) {
		Reserve reserve=reserveservice.getReserveDetail(r_code);
		List<Food_reserve> foodlist=reserveservice.getFood_reservelist(r_code);
		int room_food_total=reserve.getTotal_cost();
		int foods_total=0;
			for(int i=0;i<foodlist.size();i++) {
				foods_total+=foodlist.get(i).getFood_total_cost();
			}
		room_food_total+=foods_total;
		
		mv.addObject("room_food_total",room_food_total);
		mv.addObject("foods_total",foods_total);
		mv.addObject("reserve",reserve);
		mv.addObject("food_reservelist",foodlist);
		mv.setViewName("room/reserve_cancel_page");
		return mv;
	}
	
	/** 선아 시작*/
	//내 예약 확인 페이지로 이동
	@RequestMapping("reservePage.re")
	public ModelAndView reserPagemove(@RequestParam(value = "page", defaultValue = "1", required = false)int page, 
			ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		try {
			//현재 세션에서 mem_key 가져오기
			Member member = (Member)session.getAttribute("member");
			int mem_key = member.getKey();
				
			int limit = 10;//기본으로 10개의 글을 보여줌
			int listcount = reserveservice.getReserveListCount(mem_key);// 총 리스트를 받아옴
		
			int maxpage = (listcount + limit - 1)/limit;
			int startpage = ((page - 1)/10) * 10 + 1;
			int endpage = startpage + 10 - 1;
		
			if (endpage > maxpage){endpage = maxpage;}		
		
			List<Reserve> reservelist = reserveservice.getReserveList(page, limit, mem_key);
			mv.setViewName("room/reserve_list");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("reservelist", reservelist);
			mv.addObject("limit", limit);
			//현재 mem_key 보내기
			mv.addObject("mem_key", mem_key);
			return mv;
		} catch (NullPointerException e) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
		    out.println("alert('로그인이 필요합니다.');");
		    out.println("location.href = 'login.mem';");
		    out.println("</script>");
		}
		return null;
	}
	
	//후기 등록하기
	@RequestMapping("ReviewRegister.re")
	public String ReviewRegister(int room_code, String content, Date review_date, int mem_key, ModelAndView mv,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<Object, Object> obj = new HashMap<Object, Object>();
		obj.put("room_code", room_code);
		obj.put("review_date", review_date);
		obj.put("content", content);
		obj.put("mem_key", mem_key);
			
		int ok = reserveservice.RegisterReview(obj);
		response.getWriter().print(ok);		
		return "getReviewList.re";
	}




}

