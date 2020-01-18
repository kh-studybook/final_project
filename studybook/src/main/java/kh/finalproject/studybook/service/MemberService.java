package kh.finalproject.studybook.service;

import kh.finalproject.studybook.domain.Member;

public interface MemberService {

	int insert(Member m);

	Member myinfo(String key);

	int myupdate(Member member);

	int isUser(String email, String password);

}
