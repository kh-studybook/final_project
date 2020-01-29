
package kh.finalproject.studybook.service;

import java.util.List;
import java.util.Map;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;

public interface ReserveService {
	public List<ReviewInfo> getReviewList(int room_code,int page,int limit);
	public int getreviewcount(int room_code);
	List<Food> getFoodListAll();

	public int insertReserve(Reserve reserve);
	public Reserve getReserveDetail(int r_code);
	public void insertFood_reserve(Food_reserve fr);
	public List<Food_reserve> getFood_reservelist(int r_code);
	public int getR_code();

	//나의 리뷰 리스트 조회
	public List<Review> getSearchList(int page, int limit, int key);
	//나의 리뷰 리스트 카운트 조회
	public int getSearchListCount(int key);
	//후기 삭제
	public int reviewDelete(int review_code);
	//후기 수정하기
	public int updateReview(String contents, int review_code);
	//후기 상세 조회
	public Review getReviewDetail(int review_code);
	public List<Reserve> getReserve_timelist(String search_date, int room_code);
	public int reserve_cancel(int r_code);
	
	//선아 - 예약 내역 리스트 수 구하기
	public int getReserveListCount(int mem_key);
	//예약 내역 리스트 가져오기

	public List<Reserve> getReserveList(int page, int limit, int mem_key);
	//나의 리뷰 등록하기
	public int RegisterReview(Map<Object, Object> obj);

	
	//어드민-예약 리스트 가져오기
	public List<Reserve> getSearchList(int index, String search_word, int page, int limit);
	//어드민-예약 리스트 카운트 가져오기
	public int getSearchListCount(int index, String search_word);
	//어드민 - 예약 정보 가져오기(룸네임포함)
	public Reserve getReserveFullDetail(int r_code);
	//어드민 - 예약 수정
	public int updateReserve(Reserve reserve);
	
	
	


}

