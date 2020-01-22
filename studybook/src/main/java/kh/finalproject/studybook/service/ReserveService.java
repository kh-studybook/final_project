package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;

public interface ReserveService {
	public List<ReviewInfo> getReviewList(int room_code,int page,int limit);
	public int getreviewcount(int room_code);
	List<Food> getFoodListAll();
	//나의 리뷰 리스트 조회
	public List<Review> getSearchList(int page, int limit, int key);
	//나의 리뷰 리스트 카운트 조회
	public int getSearchListCount(int key);
}
