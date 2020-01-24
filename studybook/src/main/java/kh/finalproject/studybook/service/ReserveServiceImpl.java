
package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.ReserveDAO;
import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
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

	@Override
	public List<Food> getFoodListAll() {
		// TODO Auto-generated method stub
		return reserveDAO.getFoodListAll();
	}


	@Override
	public int insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveDAO.insertReserve(reserve);
	}

	@Override
	public Reserve getReserveDetail(int r_code) {
		// TODO Auto-generated method stub
		return reserveDAO.getReserveDetail(r_code);
	}

	@Override
	public void insertFood_reserve(Food_reserve fr) {
		// TODO Auto-generated method stub
		reserveDAO.insertFood_reserve(fr);
	}

	@Override
	public List<Food_reserve> getFood_reservelist(int r_code) {
		// TODO Auto-generated method stub
		return reserveDAO.getFood_reservelist(r_code);
	}

	@Override
	public int getR_code() {
		// TODO Auto-generated method stub
		return reserveDAO.getMaxR_code();
	}
	
	//지은 시작
	@Override
	public List<Review> getSearchList(int page, int limit, int key) {
		Map<String,Object> map = new HashMap<String, Object>();
		//검색 없는 경우 조회로 구현
		int startrow =(page-1)*limit+1;
		int endrow=startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("key", key);
		
		return reserveDAO.getReviewSearchList(map);
	}

	@Override
	public int getSearchListCount(int key) {
		return reserveDAO.getReviewSearchListCount(key);
	}
	//후기삭제
	@Override
	public int reviewDelete(int review_code) {
		int result= reserveDAO.reviewDelete(review_code);
		return result;
	}

	@Override
	public Review getReviewDetail(int review_code) {
		
		return reserveDAO.reviewDetailAction(review_code);
	}
	
}

}

