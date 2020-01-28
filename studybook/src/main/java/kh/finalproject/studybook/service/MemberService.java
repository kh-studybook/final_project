package kh.finalproject.studybook.service;

import kh.finalproject.studybook.domain.Member;

public interface MemberService {

	public int insert(Member m);

	public Member myinfo(int key);

	public int myupdate(Member member);

	public int isUser(String email, String password);

	public int delete(int key);
 
}
