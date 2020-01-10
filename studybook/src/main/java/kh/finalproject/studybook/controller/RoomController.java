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
	
	
		
		@RequestMapping(value="/admin", method=RequestMethod.GET)
		public String ADaccess() {
			return "admin/admin_index";
		}
		
		@GetMapping(value = "/RoomWrite.ro")
		public String board_write() throws Exception {
			return "room_register";
		}
		
	/*
	 * //���� ���� �׼�
	 * 
	 * @PostMapping("/RoomAddAction.ro") public String room_write_ok(Room room,
	 * HttpServletRequest request) throws Exception{
	 * 
	 * }
	 */
		//�� ���� ���� -������(����)
		@RequestMapping(value="/room_detail")
		public String room_detail() {
			return "room/detail";
		}
	
}
