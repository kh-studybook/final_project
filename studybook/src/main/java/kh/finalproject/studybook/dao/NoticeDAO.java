package kh.finalproject.studybook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Notice;

@Repository
public class NoticeDAO { 

	@Autowired
	private SqlSessionTemplate sqlSession; 

	public void insertNotice(Notice notice) {
		sqlSession.insert("Notice.insert", notice);
	}
	
	public int getListCount() {
		return 0;
	}
	
	public List<Notice> getNoticeList(HashMap<String, Integer> map) {
		return sqlSession.selectList("Notice.list", map);
	}

	public Notice getDetail(int num) {
		return sqlSession.selectOne("Notice.getDetail", num);
	}

	public int noticeDelete(Notice notice) {
		return sqlSession.delete("Notice.delete", notice);
	}

	public int noticeModify(Notice modifynotice) {
		return sqlSession.update("Notice.modify", modifynotice);
	}
	
	public Notice isNoticeWriter(Map<String, Object> map) {
		return sqlSession.selectOne("Notice.NoticeWriter", map);
	}




}
