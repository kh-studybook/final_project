package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

public interface RoomService {
	//갤러리 등록
	public void insertGallery(int room_code,String DBname, int i);
	//룸등록
	public void insertRoom(Room room);
	//룸 번호 알아내기
	public Room selectRoomNum(String room_NAME);
	
	//갤러리테이블에서 해당 룸넘버의 이미지의 숫자의 최대값 알아내기
	public Gallery getGalleryMaxCount(int room_code);

	//룸특징 테이블에 등록하기
	public void insertRoom_ex(int room_code,Room_ex room_ex);
	//룸이름 중복 알아내기
	public int isRoomName(String rOOM_NAME);
	//검색리스트 가져오기
	public List<Room> getSearchList(int index, String search_word, int page, int limit);
	//리스트 카운트가져오기
	public int getSearchListCount(int index, String search_word);
	
	
	
}

