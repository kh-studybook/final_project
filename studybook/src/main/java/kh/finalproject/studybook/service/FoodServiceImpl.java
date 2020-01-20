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
	


}
