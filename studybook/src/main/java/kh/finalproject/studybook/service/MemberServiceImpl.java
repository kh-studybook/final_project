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
	public int insert(Member m) {
		return dao.insert(m);
	}

	@Override
	public Member myinfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int myupdate(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
