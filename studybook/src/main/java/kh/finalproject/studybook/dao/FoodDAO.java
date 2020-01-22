package kh.finalproject.studybook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Notice;

@Repository
public class FoodDAO { 

@Autowired
	private SqlSessionTemplate sqlSession;
	
	//목록리스트
	public List<Food> getSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Foods.getSearchList",map);
	}
	//목록 리스트 카운트
	public int getSearchListCount(Map<String, Object> map) {
		return sqlSession.selectOne("Foods.searchcount",map);
	}
	//Food 테이블 삽입
	public void insertFood(Map<String, Object> map) {
		System.out.println("FoodDAO의 insertFood까지 옴");
		sqlSession.insert("Foods.insertFood",map);
	}
	//푸드 상세 조회
	public Food getFoodDetail(int food_code) {
		return sqlSession.selectOne("Foods.foodDetail",food_code);
	}
	//푸드 정보 업데이트(사진 포함)
	public void updateFoodIncPic(Map<String, Object> map) {
		sqlSession.update("Foods.updateFoodIncPic",map);
		
	}
	//푸드 정보 업데이트(사진 없이)
	public void updateFood(Map<String, Object> map) {
		sqlSession.update("Foods.updateFood",map);
	}
	//푸드 정보 삭제
	public int deleteFood(int food_code) {
		return sqlSession.delete("Foods.delete",food_code);
	}
	





}
