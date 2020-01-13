package kh.finalproject.studybook.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Room;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//--지은시작
	public void insertRoom(Room room) {
		System.out.println("RoomDAO의 insertRoom까지 옴");
		sqlSession.insert("Rooms.insertroom",room);
	}
	//룸번호 찾기
	public Room selectRoom(String roomname) {
		System.out.println("RoomDAO의 selectRoom까지 옴");
		return sqlSession.selectOne("Rooms.selectRoomName",roomname);
	}
	
	//--지은 끝
	
}
