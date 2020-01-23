package kh.finalproject.studybook.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.service.MemberService;
import kh.finalproject.studybook.service.ReserveService;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class ReserveController {
	@Autowired
	private RoomService roomservice;

	@Autowired
	private ReserveService reserveservice;

	@Autowired
	private MemberService memberservice;

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

		System.out.println("음식 갯수 : " + food_total_cost.size());
		int food_price = 0;
		for (int i = 0; i < food_total_cost.size(); i++) {
			food_price += food_total_cost.get(i);
		}
		System.out.println("음식 총액 : " + food_price);
		int room_food_total_price = room_price + food_price;
		System.out.println("총 금액: " + room_food_total_price);

		System.out.println("room_code="+reserve.getRoom_code());
		mv.addObject("reserve", reserve);
		mv.addObject("food_code", food_code);
		mv.addObject("count", count);
		mv.addObject("food_total_cost", food_total_cost);
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
		
		reserve.setReserve_date(reserve.getReserve_date().substring(0, 9));
		int result=reserveservice.insertReserve(reserve);
		if(result==1) {
		
			for(int i=0;i<food_codes.size();i++) {
				Food_reserve fr=new Food_reserve();
				fr.setR_code(reserve.getR_code());
				fr.setFood_code(food_codes.get(i));
				fr.setCount(counts.get(i));
				fr.setFood_total_cost(food_total_costs.get(i));
				reserveservice.insertFood_reserve(fr);
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

	
	
	// 지은 끝


}
