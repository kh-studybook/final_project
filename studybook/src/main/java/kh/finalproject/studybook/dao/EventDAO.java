package kh.finalproject.studybook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
