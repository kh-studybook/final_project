package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.FoodDAO;
import kh.finalproject.studybook.dao.GalleryDAO;
import kh.finalproject.studybook.dao.RoomDAO;
import kh.finalproject.studybook.dao.Room_exDAO;
import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	private FoodDAO fdao;

	@Override
	public List<Food> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		//검색한다면
		if(index != -1) {
			String[] search_field = new String[] {"food_name","food_code","food_cost"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%"+search_word+"%");
			}
		//검색 안한다면
		int startrow = (page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return fdao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//검색한 경우
		if(index != -1) {
			String[] search_field = new String[] {"food_name","food_code","food_cost"};
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		
		System.out.println("FoodServiceImpl의 getSearchListCount");
		return fdao.getSearchListCount(map);
	}
	
	//food 테이블 등록
	@Override
	public void insertFood(String food_name, int food_cost, String DBname) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("food_name", food_name);
		map.put("food_cost", food_cost);
		map.put("food_pic", DBname);
		
		fdao.insertFood(map);
		System.out.println("FoodServiceImple에서 insertFood 메소드 처리끝");
		
	}
	//푸드 상세 조회
	@Override
	public Food getDetail(int food_code) {
		return fdao.getFoodDetail(food_code);
	}
	//푸드 정보 업데이트(사진포함)
	@Override
	public void updateFoodIncPic(String food_name, int food_cost, String DBname) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("food_name", food_name);
		map.put("food_cost", food_cost);
		map.put("food_pic", DBname);
		fdao.updateFoodIncPic(map);
		
	}
	//푸드 정보 업데이트(사진 없이)
	@Override
	public void updateFood(String food_name, int food_cost) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("food_name", food_name);
		map.put("food_cost", food_cost);
		fdao.updateFood(map);
	}

	//음식 정보 삭제
	@Override
	public int foodDelete(int food_code) {
		
		int result =0;
		result = fdao.deleteFood(food_code);
		if(result !=1) {
			System.out.println("음식정보 삭제 완료");
			return result;
		}
		return result;
	}
	
	
	
	
	


}
