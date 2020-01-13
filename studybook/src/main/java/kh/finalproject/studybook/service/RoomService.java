package kh.finalproject.studybook.service;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;

public interface RoomService {
	//갤러리 등록
	void insertGallery(int room_code,String originFileName, int i);
	//룸등록
	void insertRoom(Room room);
	//룸 번호 알아내기
	Room selectRoomNum(String room_NAME);
	
	//갤러리테이블에서 해당 룸넘버의 이미지의 숫자의 최대값 알아내기
	Gallery getGalleryMaxCount(int room_code);
	
	
	
}
