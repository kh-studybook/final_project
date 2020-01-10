package kh.finalproject.studybook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomservice;
	
	
		//지은 추가 //어드민으로 접속 , 룸리스트 보여줌//
		@RequestMapping(value="/admin", method=RequestMethod.GET)//추후 모델앤뷰로 바꿔야함
		public String ADaccess() {
			return "admin/admin_index";
		}
		//어드민 룸등록 이동
		@GetMapping(value = "/RoomWrite.ro")
		public String board_write() throws Exception {
			return "admin/room_register";
		}
		

	
	 //어드민 룸등록 액션- 다중업로드 시작
	 
	 @GetMapping("/RoomAddAction.ro") public String room_write_ok(Room room,
	HttpServletRequest request) throws Exception{
	
		 
		 return "redirect:RoomList.ro";
	 }
	
		

	/*
	 * //어드민 룸등록 액션
	 * 
	 * @PostMapping("/RoomAddAction.ro") public String room_write_ok(Room room,
	 * HttpServletRequest request) throws Exception{
	 * 
	 * }
	 */
		//룸 정보 보기 -연습용(은지)
		@RequestMapping(value="/room_detail")
		public String room_detail() {
			return "room/detail";
		}

	
}
