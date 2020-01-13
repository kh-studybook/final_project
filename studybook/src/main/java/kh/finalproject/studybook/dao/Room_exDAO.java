package kh.finalproject.studybook.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room_ex;

@Repository
public class Room_exDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//--지은시작
	
	public void insertRoomex(Map<String, Object> map) {
		System.out.println("Room_exDAO의 insertRoomex까지 옴");
		sqlSession.insert("Rooms.insertRoom_ex",map);//
		
	}
	
	

	
	//--지은끝
	
}
