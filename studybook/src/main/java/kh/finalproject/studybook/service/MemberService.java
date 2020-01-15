package kh.finalproject.studybook.service;

import kh.finalproject.studybook.domain.Member;

public interface MemberService {

	public int insert(Member m); 

	public Member myinfo(String id);

	public int myupdate(Member member);
	
	public int delete(String id);

}
