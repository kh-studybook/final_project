package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.service.FoodService;

@Controller
public class FoodController {

	@Autowired
	private FoodService foodservice;

	@Value("${savefoodfoldername}")
	private String saveFolder;

	// 지은 시작--

	@GetMapping(value = "/FoodWrite.re")
	public String food_write() throws Exception {
		return "admin/food_register";
	}

	// 음식 리스트보기 DrinkList.bo
	@RequestMapping(value = "/FoodAdList.re", method = RequestMethod.GET)
	public ModelAndView foodlist(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word) throws Exception {
		List<Food> list = null;
		int listcount = 0;
		list = foodservice.getSearchList(index, search_word, page, limit);
		System.out.println("FoodController의 foodservice.getSearchList 끝");
		listcount = foodservice.getSearchListCount(index, search_word);
		System.out.println("FoodController의 foodservice.getSearchListCount 끝");

		// 총페이지수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수 11, 21,31
		int startpage = ((page - 1) / 10) * 10 + 1;

		// endpage : 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/food_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		System.out.println("listcount=" + listcount);
		mv.addObject("foodlist", list);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);

		return mv;

	}
	
	//음식 등록 FoodAddAction.re
	@PostMapping("/FoodAddAction.re")
	
	public String food_write_ok(Food food, MultipartHttpServletRequest mtfRequest,HttpServletResponse response) throws Exception{
		String food_name=food.getFood_name();
		int food_cost=food.getFood_cost();
		
		MultipartFile uploadfile = mtfRequest.getFile("filename");
		System.out.println("filename="+uploadfile);
		
		String path=saveFolder;


		
		if(!uploadfile.isEmpty()) {
			
			String fileName = uploadfile.getOriginalFilename();//원래파일명

			String safeFile=path+ System.currentTimeMillis() + fileName;
			String DBname = System.currentTimeMillis() + fileName;
			try {
				uploadfile.transferTo(new File(safeFile));
				foodservice.insertFood(food_name,food_cost,DBname);
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('음식이 등록되었습니다.')");
				out.println("location.href='FoodAdList.re';");
				out.println("</script>");
				out.close();
				return null;
			}catch(IllegalStateException e) {
				e.printStackTrace();
				System.out.println("Food테이블 insert하다 에러남 Foodcontroller");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("Food테이블 insert하다 에러남 Foodcontroller");
			}
			
			
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('음식 등록에 실패하였습니다.')");
			out.println("location.href='FoodAdList.re';");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		return null;
		
	}
	//수정 FoodModify.re
	
	 @GetMapping("FoodModify.re") 
	 public ModelAndView foodModifyView(int
	 food_code, ModelAndView mv, HttpServletRequest request) throws Exception {
		 System.out.println("푸드 수정 getDetail전");
		 Food food = foodservice.getDetail(food_code);
		 
		 if(food ==null) {
			 System.out.println("(수정)푸드 상세보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "(수정) 상세보기 실패입니다.");
				return mv;
		 }
		System.out.println("사진"+food.getFood_pic());
		 System.out.println("(수정) 상세보기 성공");
			mv.addObject("fooddata", food);
			mv.setViewName("admin/food_modify");
			return mv;
	 }
	 //수정 FoodModifyAction.re
	    @PostMapping("FoodModifyAction.re")
	    public ModelAndView foodModifyAction(Food food, MultipartHttpServletRequest mtfRequest, HttpServletResponse response) throws Exception{
	       String food_name=food.getFood_name();
	         int food_cost=food.getFood_cost();
	         int food_code=food.getFood_code();
	         
	         MultipartFile uploadfile = mtfRequest.getFile("filename");
	         System.out.println("filename="+uploadfile);
	         
	         String path=saveFolder;
	         path="C:\\Users\\user1\\git\\0205\\final_project\\studybook\\src\\main\\webapp\\resources\\image\\food\\";
	         
	         if(!uploadfile.isEmpty()) {
	            
	            String fileName = uploadfile.getOriginalFilename();//원래파일명

	            String safeFile=path+ System.currentTimeMillis() + fileName;
	            String DBname = System.currentTimeMillis() + fileName;
	            try {
	               uploadfile.transferTo(new File(safeFile));
	               foodservice.updateFoodIncPic(food_code,food_name,food_cost,DBname);
	               response.setContentType("text/html;charset=utf-8");
	               PrintWriter out = response.getWriter();
	               out.println("<script>");
	               out.println("alert('음식 정보가 수정되었습니다.(사진포함)')");
	               out.println("location.href='FoodAdList.re';");
	               out.println("</script>");
	               out.close();
	               return null;
	            }catch(IllegalStateException e) {
	               e.printStackTrace();
	               System.out.println("Food테이블 insert하다 에러남 Foodcontroller");
	            } catch (IOException e) {
	               e.printStackTrace();
	               System.out.println("Food테이블 insert하다 에러남 Foodcontroller");
	            }
	            
	            
	         }else {
	            foodservice.updateFood(food_code,food_name,food_cost);
	            response.setContentType("text/html;charset=utf-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('음식 정보가 수정되었습니다.')");
	            out.println("location.href='FoodAdList.re';");
	            out.println("</script>");
	            out.close();
	            
	            return null;
	            
	         }
	         
	         return null;
	       
	    }


	 //푸드 정보 삭제 FoodDelete.re
	@GetMapping("FoodDelete.re")
	public String FoodDeleteAction(int food_code, HttpServletResponse response)throws Exception{
		int result = foodservice.foodDelete(food_code);
		
		if(result==0) {
			System.out.println("음식 정보 삭제 실패");
		}
		System.out.println("음식 정보 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='FoodAdList.re';");
		out.println("</script>");
		out.close();
		return null;
	}
	
}