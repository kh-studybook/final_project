package kh.finalproject.studybook.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {

	void writeRoom(Map<String, Object> map, HttpServletRequest req);
	
	
	
}
