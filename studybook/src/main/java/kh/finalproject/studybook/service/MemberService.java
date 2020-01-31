package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Member;

public interface MemberService {

	public int insert(Member m);
 
	public Member myinfo(int key);

	public int myupdate(Member member);

	public int isUser(String email, String password);


	public int delete(int key);
	//어드민 - 검색 리스트
	public List<Member> getSearchList(int index, String search_word, int page, int limit);
	//어드민 - 리스트 카운트
	public int getSearchListCount(int index, String search_word);
	//어드민 - 멤버 상세조회
	public Member getDetail(int key);
	//어드민 - 멤버 수정
	public int updateMember(Member member);

	public int pwupdate(Member member);

 
	public int phoneupdate(Member member);
	
	public int profileupdate(Member member);

	public int delete(Member member);
	//어드민 - 멤버 삭제
	public int memberDelete(int key);

	public int isEmail(String email);
	
}