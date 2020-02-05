package kh.finalproject.studybook.controller;

import java.io.PrintWriter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Notice;
import kh.finalproject.studybook.service.NoticeService;

@Controller
public class NoticeController { 

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/noticedetail.bo", method = RequestMethod.GET)
	public String noticeDetail() {
		return "notice/notice_detail_index"; 
	} 
	

	//공지사항 리스트 (일반회원)
	@RequestMapping(value = "/NoticeList.bo")
	public ModelAndView NoticeList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "7", required = false) int limit, ModelAndView mv)
			throws Exception {
		
		//총 리스트 
		int listcount = noticeService.getListCount();

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / limit) * limit + 1;
		int endpage = startpage + limit - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Notice> noticelist = noticeService.getNoticeList(page, limit);

		mv.setViewName("notice/notice_list_index");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("noticelist", noticelist);
		mv.addObject("limit", limit);
		
		return mv;
		
	}

	
	//공지 상세 보기  (일반회원)
	@RequestMapping(value = "/NoticeDetailAction.bo", method = RequestMethod.GET)
	public ModelAndView notice_detail(int num, ModelAndView mv, HttpServletRequest request) throws Exception {

		Notice notice = noticeService.getDetail(num);
		if (notice == null) {
			System.out.println("공지 상세 보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "공지 상세 보기 실패!");
		} else {
			System.out.println("공지 상세 보기 성공");
			mv.setViewName("notice/notice_detail_index");
			mv.addObject("noticedata", notice);
		}
		return mv;  
	}
	
	
	
	//공지사항 리스트 (관리자)
	@RequestMapping(value = "/noticeadmin.bo")
	public ModelAndView NoticeAdmin(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "7", required = false) int limit, ModelAndView mv)
			throws Exception {
		
		//총 리스트 
		int listcount = noticeService.getListCount();

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / limit) * limit + 1;
		int endpage = startpage + limit - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Notice> noticelist = noticeService.getNoticeList(page, limit);

		mv.setViewName("notice/notice_list_admin");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("noticelist", noticelist);
		mv.addObject("limit", limit);
		
		return mv;
		
	}

	
	//공지 상세 보기 (관리자)
	@RequestMapping(value = "/noticedetailadmin.bo", method = RequestMethod.GET)
	public ModelAndView noticeDetailAdmin(int num, ModelAndView mv, HttpServletRequest request) throws Exception {

		Notice notice = noticeService.getDetail(num);
		if (notice == null) {
			System.out.println("공지 상세 보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "공지 상세 보기 실패!");
		} else {
			System.out.println("공지 상세 보기 성공");
			mv.setViewName("notice/notice_detail_admin");
			mv.addObject("noticedata", notice);
		}
		return mv;  
	}
	
	
	
	//공지 수정 상세페이지 보기 (관리자)
	@GetMapping("/NoticeModifyView.bo")
	public ModelAndView NoticeModifyView(int num, ModelAndView mv, HttpServletRequest request) throws Exception {

		Notice noticedata = noticeService.getDetail(num);
		if (noticedata == null) {
			System.out.println("공지 수정 상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "공지 수정 상세보기 실패");
			return mv;
		}
		System.out.println("공지 수정 보기 성공~");
		mv.addObject("noticedata", noticedata);
		mv.setViewName("notice/notice_modify_admin");
		return mv;
	}
	
	
	
	//공지 쓰기 (관리자)
	@GetMapping(value = "/NoticeWrite.bo")
	public String notice_write() throws Exception {
		return "notice/notice_write_admin";
	}
	
	
	@PostMapping(value = "/NoticeAddAction.bo")
	public String notice_write_ok(Notice notice, HttpServletRequest request) throws Exception {

		noticeService.insertNotice(notice);
		return "redirect:NoticeList.bo";
	}
	
	
	//공지 수정 (관리자)
	@PostMapping("/NoticeModifyAction.bo")
	public ModelAndView NoticeModifyAction(Notice notice, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int result = noticeService.noticeModify(notice);

		if (result == 0) {
			System.out.println("수정 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정 실패");
		} else {
			System.out.println("수정 성공");
			String url = "redirect:noticedetailadmin.bo?num=" + notice.getNOTICE_NUM();
			mv.setViewName(url);
		}
		return mv;
	}
	

	
	//공지 삭제 (관리자)
	@PostMapping("NoticeDeleteAction.bo")
	public void NoticeDeleteAction(int num, HttpServletResponse response) throws Exception {
		int check = noticeService.noticeDelete(num);
		if (check == 1) {
		System.out.println("삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료');");
		out.println("location.href='noticeadmin.bo';");
		out.println("</script>");
		out.close();
		}
	}
	
	
	//paging
	@ResponseBody
	@PostMapping("NoticeListAjax.bo")
	public Object NoticeListAjax(int limit, int page) {

		System.out.println("limit : " + limit + ", page : " + page);
		int listcount = noticeService.getListCount(); 
		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 = " + maxpage);

		int startpage = ((page - 1) / 7) * 7 + 1;
		System.out.println("현재 페이지 그룹에서 보여줄 마지막 페이지수 = " + startpage);

		int endpage = startpage + 7 - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 = " + endpage);

		if (endpage > maxpage)
			endpage = maxpage;

		Map<String, Object> result = new HashMap<String, Object>();
		List<Notice> list = noticeService.getNoticeList(page, limit);
		result.put("noticelist", list);
		result.put("page", page);
		result.put("maxpage", maxpage);
		result.put("startpage", startpage);
		result.put("endpage", endpage);
		result.put("limit", limit);

		return result;
	}
	
	
}
