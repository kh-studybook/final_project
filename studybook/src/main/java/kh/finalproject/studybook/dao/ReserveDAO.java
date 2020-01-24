package kh.finalproject.studybook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//룸별 리뷰 리스트
	public List<ReviewInfo> getReviewList(HashMap<String, Integer> map){
		return sqlSession.selectList("Reserves.getReivewList",map);
	}
	//룸별 리뷰갯수
	public int getReviewCount(int room_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reserves.getReviewCount",room_code);
	}
	//음식 목록
	public List<Food> getFoodListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Foods.getFoodListAll");
	}
	//예약하기
	public int insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Reserves.insertReserve",reserve);
	}
	//예약내용 불러오기
	public Reserve getReserveDetail(int r_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reserves.getReserveDetail",r_code);
	}
	//현재 예약코드
	public int getMaxR_code() {
		return sqlSession.selectOne("Reserves.getMaxR_code");
	}
	//음식예약하기
	public void insertFood_reserve(Food_reserve fr) {
		// TODO Auto-generated method stub
		sqlSession.insert("Reserves.insertFood_reserve",fr);
	}
	//음식예약목록 불러오기
	public List<Food_reserve> getFood_reservelist(int r_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Reserves.getFood_reservelist",r_code);
	}

	//--지은 시작
	//나의 후기에서 리스트 불러오기
	public List<Review> getReviewSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Reserves.getSearchList",map);
	}
	//나의 후기에서 리스트 카운트 불러오기
	public int getReviewSearchListCount(int key) {
		return sqlSession.selectOne("Reserves.searchcount",key);
	}
	//--지은 끝

	//날짜별 예약되어있는 시간 목록 불러오기
	public List<Reserve> getReserve_timelist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Reserves.getReserve_timelist",map);
	}
	

}
