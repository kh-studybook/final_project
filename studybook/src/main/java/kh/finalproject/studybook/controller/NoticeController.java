package kh.finalproject.studybook.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Notice;
import kh.finalproject.studybook.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/NoticeList.bo")
	ModelAndView NoticeList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv)
			throws Exception {

	
		int listcount = noticeService.getListCount();

		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("�� ������ �� =" + maxpage);

		int startpage = ((page - 1) / limit) * limit + 1;
		System.out.println("���� �������� ������ ���� ������ �� = " + startpage);

		int endpage = startpage + limit - 1;
		System.out.println("���� �������� ������ ������ ������ �� = " + endpage);

		if (endpage > maxpage)
			endpage = maxpage;

		List<Notice> noticelist = noticeService.getNoticeList(page, limit);

		mv.setViewName("notice/list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("noticelist", noticelist);
		mv.addObject("limit", limit);

		return mv;
	}

	@GetMapping(value = "/NoticeWrite.bo")
	public String notice_write() throws Exception {
		return "notice/write";
	}

	
	@GetMapping(value = "/noticeDetailAction.bo")
	public ModelAndView notice_detail(int num, ModelAndView mv, HttpServletRequest request) throws Exception {

		Notice notice = noticeService.getDetail(num);
		if (notice == null) {
			System.out.println("�󼼺��� ����");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "�󼼺��� �����Դϴ�.");
		} else {
			System.out.println("�󼼺��� ����");
			
			
		}

		return mv;

	}

	
	@GetMapping("/NoticeModifyView.bo")
	public ModelAndView NoticeModifyView(int num, ModelAndView mv, HttpServletRequest request) throws Exception {

		Notice noticedata = noticeService.getDetail(num);
		if (noticedata == null) {
			System.out.println("���� �󼼺��� ����");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "���� �󼼺��� ����.");
			return mv;
		}
		System.out.println("���� �󼼺��� ����");

		mv.addObject("noticedata", noticedata);
		mv.setViewName("notice/modify");
		return mv;

	}

	@PostMapping("/NoticeModifyAction.bo")
	public ModelAndView NoticeModifyAction(Notice notice, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean usercheck = noticeService.isNoticeWriter(notice.getNotice_num());

		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� �ٸ�');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		return mv;
	}
	

	@PostMapping("NoticeDeleteAction.bo")
	public String NoticeDeleteAction(String NOTICE_PASS, int num, HttpServletResponse response) throws Exception {

		boolean usercheck = noticeService.isNoticeWriter(num);

		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� �ٸ�');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}

		// ��� ��ġ�ϸ� ��������
		int result = noticeService.noticeDelete(num);

		// ���� ����
		if (result == 0) {
			System.out.println("�Խ��� ���� ����");
		}

		// ���� ����
		System.out.println("�Խ��� ���� ����");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('�����Ǿ����ϴ�');");
		out.println("location.href='NoticeList.bo';");
		out.println("</script>");
		out.close();
		return null;

	}

	@ResponseBody
	@PostMapping("NoticeListAjax.bo")
	public Object NoticeListAjax(int limit, int page) {

		System.out.println("limit : " + limit + ", page : " + page);
		int listcount = noticeService.getListCount(); 
		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("�� �������� : " + maxpage);

		int startpage = ((page - 1) / 10) * 10 + 1;
		System.out.println("���� �������� ������ ���� ������ �� = " + startpage);

		int endpage = startpage + 10 - 1;
		System.out.println("���� �������� ������ ������ ������ �� =" + endpage);

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
