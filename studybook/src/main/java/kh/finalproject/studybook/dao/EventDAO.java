package kh.finalproject.studybook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Event;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertEvent(Event event) {//이벤트 등록하기!!
		sqlSession.insert("event.insert", event);		
	}

	public Event getEventDetail(int num) {//글 내용보기
		return sqlSession.selectOne("event.detail", num);
	}
	
	public int getEventListCount() {//이벤트 총 갯수 가져오기
		return sqlSession.selectOne("event.count");
	}

	
	
}
