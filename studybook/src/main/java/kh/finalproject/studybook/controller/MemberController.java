package kh.finalproject.studybook.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/joinSuccess.mem", method = RequestMethod.GET)
	public ModelAndView joinSuccess_mem(String email, String name, ModelAndView mv) 
	{
		mv.addObject("email", email);
		mv.addObject("name", name);
		mv.setViewName("member/join_success_index");
		return mv;
	}
	
	@RequestMapping(value = "/update.mem", method = RequestMethod.GET)
	public String my_update() {
		return "member/my_update_index"; 
	}
	
	
	@RequestMapping(value = "/loginProcess.mem",  method = RequestMethod.POST)
	public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session) throws Exception {
		int result = memberservice.isUser(email, password);
		System.out.println("결과는(key값)=" + result);
		if (result == 0) {
			
			String message = "비밀번호 일치 X";
			if (result == -1)
				message = "이메일 존재 X";

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login.mem';");
			out.println("</script>");
			out.close();
			return null;
			
		} else {
			
			Member member=memberservice.myinfo(result);
			session.setAttribute("member", member);
			System.out.println("member.name"+member.getName());
			return "redirect:main.net";
		}
	}

	// 회원가입 성공
	@RequestMapping(value = "/joinProcess.mem")
	public void JoinProcess(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.insert(member);
		out.println("<script>");
		if (result == 1) {
			out.println("alert('test 회원가입 축하한다');");
			out.println("location.href='joinSuccess.mem?email=" + member.getEmail() + "&name=" + member.getName() + "';" );
		} else if (result == -1) {
			out.println("alert('이미 가입되어 있는 이메일입니다. 확인 후 다시 입력해주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}
	
	

	@RequestMapping(value = "/findpw.mem", method = RequestMethod.GET)
	public String findpw() {
		return "member/login_findpw_index";
	}
	
	
	@RequestMapping(value = "/updatepw.mem", method = RequestMethod.GET)
	public String updatepw() {
		return "member/my_password_index";
	}
	
	// 수정폼
	@RequestMapping(value = "/my_update.mem")
	public ModelAndView memberUpdate(HttpSession session, ModelAndView mv) {
		int key = (int) session.getAttribute("key");
		Member member = memberservice.myinfo(key);
		mv.setViewName("member/my_update_index");
		mv.addObject("member", member);
		return mv;
	}

	
	// 수정 처리
	@RequestMapping(value = "/updateProcess.mem", method = RequestMethod.POST)
	public void updateProcess(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
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
	
	
	//delete? 
	@RequestMapping(value="delete.mem", method = RequestMethod.GET)
	public int delete(int key, HttpServletResponse response) throws Exception {
		int result = memberservice.delete(key);
	
		if (result != 1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('뭐지?');");
			out.println("location.href='main.net';");
			out.println("</script>");
			out.close();
		}
		return result;
	}
	
	
	@RequestMapping (value = "/logout.mem", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('test 로그아웃♡');");
		out.println("location.href='main.net';");
		out.println("</script>");
		out.close();
		return "redirect:main.net";
		
	}
	
}
