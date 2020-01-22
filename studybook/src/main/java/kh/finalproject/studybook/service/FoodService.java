package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

public interface FoodService {
	//검색 리스트 가져오기
	public List<Food> getSearchList(int index, String search_word, int page, int limit);
	//검색 리스트 카운트 가져오기
	public int getSearchListCount(int index, String search_word);
	//Foot 테이블 insert
	public void insertFood(String food_name, int food_cost, String dBname);
	//푸드 상세 조회
	public Food getDetail(int food_code);
	//푸드 정보 업데이트(사진포함)
	public void updateFoodIncPic(String food_name, int food_cost, String dBname);
	//푸드 정보 업데이트(사진 없음)
	public void updateFood(String food_name, int food_cost);
	//푸드 정보 삭제
	public int foodDelete(int food_code);
	
	

}

