package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.ReserveDAO;
import kh.finalproject.studybook.domain.ReviewInfo;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Autowired
	ReserveDAO reserveDAO;
	
	@Override
	public List<ReviewInfo> getReviewList(int room_code,int page,int limit) {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		
		map.put("room_code",room_code);
		map.put("start", startrow);
		map.put("end",endrow);
		//double i=1/0;
		
		return reserveDAO.getReviewList(map);
	}

	public int getreviewcount(int room_code) {
		// TODO Auto-generated method stub
		return reserveDAO.getReviewCount(room_code);
	}
	
}
