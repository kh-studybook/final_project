package kh.finalproject.studybook.dao;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;

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

	public int getListCount() {
		return sqlSession.selectOne("Rooms.count");
	}
	//--지은 끝
	
	public List<Room> getRoomList(HashMap<String, Integer> map) {
		return sqlSession.selectList("Rooms.allList", map);
	}
	

}
