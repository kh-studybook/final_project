package kh.finalproject.studybook.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Member;


@Repository 
public class MemberDAO { 
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(Member m) {
		return sqlSession.insert("Members.insert",m);
	}

	 

}
