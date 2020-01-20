package kh.finalproject.studybook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Reserve;
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
	
		//리뷰 가져오기
		@ResponseBody
		@RequestMapping(value="getReviewList.re")
		public Object getReview(@RequestParam(value="page",defaultValue="1",required=false) int page,
				int room_code) throws Exception{
			int limit=3;
			int listcount=reserveservice.getreviewcount(room_code);
			int maxpage=(listcount+limit-1)/limit;
			int startpage=((page-1)/limit)*limit+1;
			int endpage=startpage+limit-1;
			if(endpage>maxpage) endpage=maxpage;
			List<ReviewInfo> reviewlist= reserveservice.getReviewList(room_code,page,limit);
			
			Map<String,Object> obj=new HashMap<String,Object>();
			
			obj.put("page",page);
			obj.put("maxpage",maxpage);
			obj.put("startpage",startpage);
			obj.put("endpage",endpage);
			obj.put("listcount",listcount);
			obj.put("reviewlist",reviewlist);
			
			return obj;
		}
		
		// 예약 페이지로
		@RequestMapping(value = "room_reserve.re")
		public ModelAndView room_reserve_page(int room_code,Reserve reserve,ModelAndView mv) {
			System.out.println("룸코드 번호="+room_code);
			System.out.println("룸 코드 번호= " +reserve.getRoom_code());
			Member member=memberservice.myinfo(reserve.getMem_key());
			Room room=roomservice.getRoomInfo(reserve.getRoom_code());
			
			mv.addObject("room",room);
			mv.addObject("member",member);
			mv.addObject("reserve",reserve);
			mv.setViewName("room/room_reserve_page");
			return mv;
			
		}
		
		// 음료추가 페이지로
		@RequestMapping(value = "food_add.re")
		public String food_add_page() {
			return "room/food_add_page";
		}

		// 예약 완료 페이지로
		@RequestMapping(value = "reserve_ok.re")
		public String reserve_ok_page() {
			return "room/reserve_ok_page";
		}


}
