package kh.finalproject.studybook.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Member;


@Repository 
public class MemberDAO { 
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Member member) {
		return sqlSession.insert("Members.insert", member); 
	}

	public int myupdate(Member member) {
		return sqlSession.update("Members.update", member); 
	}

	public Member myinfo(int key) {
		return sqlSession.selectOne("Members.myInfo",key);
	}

	public Member isUser(String email) {
		return sqlSession.selectOne("Members.usercheck", email);
	}




}
