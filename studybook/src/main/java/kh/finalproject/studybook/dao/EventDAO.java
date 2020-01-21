package kh.finalproject.studybook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Event;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertEvent(Event event) {//이벤트 등록하기!!
		sqlSession.insert("event.insertEvent", event);		
	}

	public Event getEventDetail(int num) {//글 내용보기
		return sqlSession.selectOne("event.detail", num);
	}
	
	public int getEventListCount() {//이벤트 총 갯수 가져오기
		return sqlSession.selectOne("event.count");
	}

	public int eventDelete(int num) {//이벤트 삭제하기
		return sqlSession.delete("event.delete", num);
	}

	public List<Event> getEventList(HashMap<String, Integer> map) {//글 목록 보기
		return sqlSession.selectList("event.list", map);
	}

	public int eventModify(Event modifyevent) {//수정하기
		return sqlSession.update("event.modifyEvent", modifyevent);
	}

	public String getEventWriter(int mem_key) {//작성자 가져오기
		return sqlSession.selectOne("event.event_writer", mem_key);
	}

	public int getMainEventListCount() {//메인화면 이벤트 총 갯수 가져오기
		return sqlSession.selectOne("event.main_count");
	}

	public List<Event> getMainEventList(HashMap<String, Integer> map) {
		return sqlSession.selectList("event.main_list", map);
	}
	
}
