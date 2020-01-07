package kh.finalproject.studybook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping(value="/room_detail")
	public String room_detail() {
		return "room/room_detail";
	}
}
