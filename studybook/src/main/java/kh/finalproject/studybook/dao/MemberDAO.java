package kh.finalproject.studybook.dao;


import java.util.List;
import java.util.Map;

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
		return sqlSession.selectOne("Members.myInfo", key);
	}

	public Member isUser(String email) {
		return sqlSession.selectOne("Members.usercheck", email);
	}

	public int pwupdate(Member member) {
		return sqlSession.update("Members.updatePw", member); 
	}
	//어드민 멤버 리스트
	public List<Member> getSearchList(Map<String, Object> map) {
		
		return sqlSession.selectList("Members.getSearchList",map);
	}
	//어드민 멤버 리스트 카운트
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Members.searchcount",map);
	}
	//멤버 상세 조회
	public Member getMemberDetail(int key) {
		return sqlSession.selectOne("Members.memberdetail",key);
	}
	//멤버 수정
	public int updateMember(Member member) {
		
		return sqlSession.update("Members.updateMember",member);
	}

	public int phoneupdate(Member member) {
		return sqlSession.update("Members.updatePhone", member); 
	}

	public int profileupdate(Member member) {
		return sqlSession.update("Members.updateProfile", member); 
	}

	public int delete(Member member) {
		return sqlSession.delete("Members.delete", member);
	}

}
