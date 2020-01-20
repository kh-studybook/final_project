package kh.finalproject.studybook.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// --지은시작
	public void insertRoom(Room room) {
		System.out.println("RoomDAO의 insertRoom까지 옴");
		sqlSession.insert("Rooms.insertroom", room);
	}

	// 룸번호 찾기
	public Room selectRoom(String roomname) {
		System.out.println("RoomDAO의 selectRoom까지 옴");
		return sqlSession.selectOne("Rooms.selectRoomName", roomname);
	}

	// 룸이름 중복 검사
	public Room isRoomName(String ROOM_NAME) {
		return sqlSession.selectOne("Rooms.roomnameCheck", ROOM_NAME);
	}

	// 목록 리스트
	public List<Room> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Rooms.getSearchList", map);
	}

	// 목록 리스트 카운트
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Rooms.searchcount", map);
	}
	
	//룸 상세 보기
	public Room getRoomDetail(int room_code) {
		return sqlSession.selectOne("Rooms.roomDetail",room_code);
	}
	//룸정보 업데이트
	public int updateRoom(Room room) {
		return sqlSession.update("Rooms.updateRoom",room);
	}
	
	//룸정보 삭제
	public int deleteRoom(int room_code) {
		return sqlSession.delete("Rooms.delete",room_code);
	}

	// --지은 끝

	// --민지 시작
	public int getListCount() {
		return sqlSession.selectOne("Rooms.count");
	}

	public List<Room> getRoomList(HashMap<String, Integer> map) {
		return sqlSession.selectList("Rooms.allList", map);
	}
	// --민지 끝

	


	//메인사진 포함한 room detail
	public Room getRoomInfo(int room_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Rooms.getRoomInfo",room_code);
	}


	

}
