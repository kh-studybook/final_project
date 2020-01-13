package kh.finalproject.studybook.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@RequestMapping(value = "/login.mem", method = RequestMethod.GET)
	public String login() {
		return "member/login_index";
	}

	@RequestMapping(value = "/join.mem", method = RequestMethod.GET)
	public String join_mem() {
		return "member/join_index";
	}

	@RequestMapping(value = "/loginProcess.mem")
	public void LoginProcess(Member m, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.insert(m);

		out.println("<script>");
		out.println("</script>");

	}

	@RequestMapping(value = "/joinProcess.mem")
	public void JoinProcess(Member m, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.insert(m);
		if (result == 1) {
			out.println("<script>");
			out.println("location.hef='join_success.mem';");
			out.println("</script>");
			out.close();
		}
	}

	@RequestMapping(value = "/login_findpw.mem")
	public String findpw() {
		return "member/login_findpw_index";
	}

	// 수정폼
	@RequestMapping(value = "/my_update.mem")
	public ModelAndView member_update(HttpSession session, ModelAndView mv) {
		String id = (String) session.getAttribute("id");
		Member m = memberservice.myinfo(id);
		mv.setViewName("member/my_update_index");
		mv.addObject("member", m);
		return mv;
	}

	// 수정 처리
	@RequestMapping(value = "/updateProcess.net", method = RequestMethod.POST)
	public void updateProcess(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		int result = memberservice.myupdate(member);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			out.println("alert('회원 정보 수정 완료');");
			out.println("location.href='my_update.mem';");
		} else {
			out.println("alert('회원 정보 수정 실패');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
}
