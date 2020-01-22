package kh.finalproject.studybook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ReviewInfo> getReviewList(HashMap<String, Integer> map){
		return sqlSession.selectList("Reserves.getReivewList",map);
	}

	public int getReviewCount(int room_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reserves.getReviewCount",room_code);
	}

	public List<Food> getFoodListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Foods.getFoodListAll");
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
	
}
