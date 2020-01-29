package kh.finalproject.studybook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.MemberDAO;
import kh.finalproject.studybook.domain.Member;

@Service 
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;

	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}

	@Override
	public Member myinfo(int key) {
		return dao.myinfo(key);
	} 

	@Override 
	public int myupdate(Member member) {
		return dao.myupdate(member);
	}

	@Override
	public int isUser(String email, String password) {
		Member member = dao.isUser(email);
		int result = -1; //아이디 없으면 member가 null
		if (member != null) {
			if (member.getPassword().equals(password)) {
				result = member.getKey();
			} else 
				result = 0;
		}
		return result;
	}
	
	@Override
	public int delete(Member member) {
		return dao.delete(member);
	}

	@Override
	public int pwupdate(Member member) {
		return dao.pwupdate(member);
	}

	@Override
	public int phoneupdate(Member member) {
		return dao.phoneupdate(member);
	}

	@Override
	public int profileupdate(Member member) {
		return dao.profileupdate(member);
	}
	
}