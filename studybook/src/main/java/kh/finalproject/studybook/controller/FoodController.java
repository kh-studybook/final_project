package kh.finalproject.studybook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.service.FoodService;

@Controller
public class FoodController {
	
	@Autowired
	private FoodService foodservice;
	
	@Value("${savefoldername}")
	private String saveFolder;

	// 지은 시작--
	
	@GetMapping(value="/FoodWrite.re")
	public String food_write() throws Exception{
		return "admin/food_register";
	}
	
	//음식 리스트보기 DrinkList.bo
	@RequestMapping(value="/FoodList.re", method=RequestMethod.GET)
	public ModelAndView foodlist(@RequestParam(value="page", defaultValue="1", required=false) int page,
							@RequestParam(value="limit", defaultValue="10", required=false) int limit, ModelAndView mv,
							@RequestParam(value="search_field", defaultValue="-1")int index,
							@RequestParam(value="search_word", defaultValue="") String search_word) throws Exception{
		List<Food> list = null;
		int listcount=0;
		list = foodservice.getSearchList(index, search_word, page, limit);
		System.out.println("FoodController의 foodservice.getSearchList 끝");
		listcount = foodservice.getSearchListCount(index, search_word);
		System.out.println("FoodController의 foodservice.getSearchListCount 끝");
		
		//총페이지수
		int maxpage=(listcount+limit -1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지수 11, 21,31
		int startpage=((page-1)/10)*10+1;
		
		//endpage : 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage=startpage+10-1;
		if(endpage>maxpage)
			endpage=maxpage;
		
		mv.setViewName("admin/food_list");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		System.out.println("listcount="+listcount);
		mv.addObject("foodlist",list);
		mv.addObject("search_field",index);
		mv.addObject("search_word",search_word);
				
		return mv;
		
	}
	
}