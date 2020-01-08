package kh.finalproject.studybook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@RequestMapping(value="/room_detail")
	public String room_detail() {
		return "room/room_detail";
	}
	
}
