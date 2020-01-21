package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

public interface FoodService {
	//검색 리스트 가져오기
	List<Food> getSearchList(int index, String search_word, int page, int limit);
	//검색 리스트 카운트 가져오기
	int getSearchListCount(int index, String search_word);
	//Foot 테이블 insert
	void insertFood(String food_name, int food_cost, String dBname);
	
	

}

