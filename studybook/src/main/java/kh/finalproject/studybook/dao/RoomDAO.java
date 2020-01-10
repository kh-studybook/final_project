package kh.finalproject.studybook.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
