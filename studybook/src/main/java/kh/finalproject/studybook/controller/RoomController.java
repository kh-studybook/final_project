package kh.finalproject.studybook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	@RequestMapping(value="/main.net")
	public String room_detail() {
		return "room/main_index";
	}
	
	@RequestMapping(value="/template.net")
	public String template() {
		return "template/index";
	}
}