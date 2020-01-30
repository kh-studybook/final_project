
package kh.finalproject.studybook.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.ReserveDAO;
import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Gallery;
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

	@Override
	public int updateReview(String contents, int review_code) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("contents", contents);
		map.put("review_code", review_code);
		
		return reserveDAO.updateReviewAction(map);
	}
	
	@Override
	public List<Reserve> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한다면
		if (index != -1) {
			String[] search_field = new String[] { "r_code", "room_name", "reserver_name", "reserver_phone", "reserver_email" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		// 검색 안한다면
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return reserveDAO.getSearchList2(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한 경우
		if (index != -1) {
			String[] search_field = new String[] {  "r_code", "room_name", "reserver_name", "reserver_phone", "reserver_email" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		System.out.println("RoomServiceImpl의 getSearchListCount");
		return reserveDAO.getSearchListCount2(map);
	}
	//예약 정보 가져오기(룸네임 포함)
	@Override
	public Reserve getReserveFullDetail(int r_code) {
		return reserveDAO.getReserveFullDetail(r_code);
	}
	//예약정보 수정 액션
	@Override
	public int updateReserve(Reserve reserve) {
		
		return reserveDAO.updateReserve(reserve);
	}
	
	//지은 끝
	
	//날짜별로 예약되어있는 시간 찾기-은지
	@Override
	public List<Reserve> getReserve_timelist(String search_date, int room_code) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("search_date",search_date);
		map.put("room_code", room_code);
		return reserveDAO.getReserve_timelist(map);
	}

	@Override
	public int reserve_cancel(int r_code) {
		// TODO Auto-generated method stub
		return reserveDAO.reserve_cancel(r_code);
	}
	
	/** 선아 시작 */
	@Override
	public int getReserveListCount(int mem_key) {
		return reserveDAO.getReserveListCount(mem_key);
	}

	@Override
	public List<Reserve> getReserveList(int page, int limit, int mem_key) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		int startrow = (page - 1)*limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("mem_key", mem_key);
		return reserveDAO.getReserveList(map);
	}

	@Override
	public int RegisterReview(Map<Object, Object> obj) {
		return reserveDAO.registerReview(obj);
	}


	

}

