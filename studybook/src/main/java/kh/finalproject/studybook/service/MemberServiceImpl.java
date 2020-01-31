package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.MemberDAO;
import kh.finalproject.studybook.domain.Food;
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

	@Override
	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		//검색한다면
		if(index != -1) {
			String[] search_field = new String[] {"key","name","phone","email"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%"+search_word+"%");
			}
		//검색 안한다면
		int startrow = (page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		//검색한 경우
		if(index != -1) {
			String[] search_field = new String[] {"key","name","phone","email"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		
		System.out.println("FoodServiceImpl의 getSearchListCount");
		return dao.getSearchListCount(map);
	}
	//멤버 상세 조회
	@Override
	public Member getDetail(int key) {
		return dao.getMemberDetail(key);
	}
	//멤버 정보 수정
	@Override
	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	@Override
	public int delete(int key) {
		// TODO Auto-generated method stub
		return 0;
	}
	//어드민 - 멤버 삭제
	@Override
	public int memberDelete(int key) {
		
		int result = 0;
		result = dao.deleteMember(key);
		if(result !=1) {
			System.out.println("멤버 삭제 성공");
			return result;
		}
		return result;
	}

	@Override
	public int isEmail(String email) {
		Member member = dao.emailCheck(email);
		int result = -1; //이메일 없으면 member가 null
		if (member != null) {
			result = member.getKey();
		}
		return result;
	}
	
	
}