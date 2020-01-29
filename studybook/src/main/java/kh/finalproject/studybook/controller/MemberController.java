package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Calendar;
import java.util.Random;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.service.MemberService;

@Controller
public class MemberController {

	@Value("${savefoldername}")
	private String saveFolder;

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
	public ModelAndView joinSuccess_mem(String email, String name, ModelAndView mv) {
		mv.addObject("email", email);
		mv.addObject("name", name);
		mv.setViewName("member/join_success_index");
		return mv;
	}

	@RequestMapping(value = "/update.mem", method = RequestMethod.GET)
	public String my_update() {
		return "member/my_update_index";
	}

	@RequestMapping(value = "/delete.mem", method = RequestMethod.GET)
	public String my_delete() {
		return "member/my_delete_index";
	}

	@RequestMapping(value = "/loginProcess.mem", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletResponse response, HttpSession session) throws Exception {

		int result = memberservice.isUser(email, password);
		System.out.println("결과는(key값)=" + result);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (result > 0) {
			session.setAttribute("email", email);
			Member member = memberservice.myinfo(result);
			session.setAttribute("member", member);
			System.out.println("member.name" + member.getName());
			return "redirect:main.net";

		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='login.mem';");
			out.println("</script>");

		} else if (result == -1) {
			out.println("<script>");
			out.println("alert('가입되지 않은 이메일입니다.');");
			out.println("location.href='login.mem';");
			out.println("</script>");
		}
		out.close();
		return null;
	}

	// 회원가입 성공~
	@RequestMapping(value = "/joinProcess.mem")
	public void JoinProcess(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = memberservice.insert(member);
		out.println("<script>");
		if (result == 1) {
			// out.println("alert('회원가입 축하');");
			out.println(
					"location.href='joinSuccess.mem?email=" + member.getEmail() + "&name=" + member.getName() + "';");
		} else if (result == -1) {
			out.println("alert('이미 스터디북에 가입된 이메일입니다. 확인 후 다시 입력해주세요.');");
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

	@RequestMapping(value = "/updatephone.mem", method = RequestMethod.GET)
	public String updatephone() {
		return "member/my_phone_index";
	}

	// 수정폼으로 ㄱ
	@RequestMapping(value = "/my_update.mem")
	public ModelAndView memberUpdate(HttpSession session, ModelAndView mv) {
		Member savemember = (Member) session.getAttribute("member");

		Member member = memberservice.myinfo(savemember.getKey());
		mv.setViewName("member/my_update_index");
		mv.addObject("member", member);
		return mv;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/passwordProcess.mem", method = RequestMethod.GET)
	public void passwordProcess(String password, HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		Member member = (Member) session.getAttribute("member"); // session
		member.setPassword(password); // 입력값 가져와서 넣기

		int result = memberservice.pwupdate(member);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			out.println("alert('비밀번호 변경 완료');");
			out.println("location.href='my_update.mem';");
		} else {
			out.println("alert('비밀번호 변경 실패');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}

	// 연락처 변경
	@RequestMapping(value = "/phoneProcess.mem", method = RequestMethod.GET)
	public void phoneProcess(String phone, HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		Member member = (Member) session.getAttribute("member");
		member.setPhone(phone); // 입력값 가져와서 넣기

		int result = memberservice.phoneupdate(member);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			out.println("alert('연락처 변경 완료!');");
			out.println("location.href='my_update.mem';");
		} else {
			out.println("alert('연락처 변경 실패');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}


	//프로필사진 변경
	@PostMapping("/profileProcess.mem")
	public ModelAndView EventModifyAction(Member member, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		MultipartFile uploadfile = member.getUploadfile();

		/*
		 * String saveFolder =
		 * request.getSession().getServletContext().getRealPath("resources") +
		 * "/upload/";
		 */

		if (uploadfile != null && !uploadfile.isEmpty()) {// 파일을 변경한 경우
			System.out.println("파일 변경한 경우");
			String fileName = uploadfile.getOriginalFilename();// 원래 파일명을 가져오기
			member.setProfile_originalfile(fileName);

			String fileDBName = fileDBName(fileName, saveFolder);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			member.setProfile(fileDBName);
			System.out.println(fileDBName);
		}

		// DAO에서 수정 메서드를 호출하여 수정합니다.
		int result = memberservice.profileupdate(member);

		// 수정에 실패한 경우
		if (result == 0) {
			System.out.println("수정 실패");
			mv.setViewName("redirect:my_update.mem");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정 실패");
		} else {// 수정 성공한 경우
			System.out.println("수정 완료");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 되었습니다.');");
			out.println("</script>");

			String url = "redirect:my_update.mem";

			// 이동  경로를 설정
			mv.setViewName(url);
		}
		return mv;
	}

	public String fileDBName(String fileName, String saveFolder) {
		// 필요한 데이터가 fileName와 saveFolder이므로 매개변수로 넘긴다.
		// 새로운 폴더 이름 : 오늘 + 년 + 월 + 일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);

		String homedir = saveFolder + year + "-" + month + "-" + date;
		System.out.println("homedir = " + homedir);
		File path = new File(homedir);
		if (!(path.exists())) {
			path.mkdir();// 새로운 폴더를 생성
		}
		// 파일명이 중복되지 않게 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/** 확장자 구하기 시작 */
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		System.out.println("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);
		/** 확장자 구하기 끝 */

		// 새로운 파일명 구하기
		String refileName = "profile" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		// 오라클 DB에 저장될 파일명 구하기
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);
		return fileDBName;
	}

	
	
	// 탈퇴 제발
	@RequestMapping(value = "deleteProcess.mem", method = RequestMethod.GET)
	public String delete(HttpSession session, HttpServletResponse response) throws Exception {

		Member savemember = (Member) session.getAttribute("member");
		Member member = memberservice.myinfo(savemember.getKey());
		int result = memberservice.delete(member);

		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");

		out.println("<script>");
		if (result == 1) {
			session.invalidate();
			out.println("alert('계정이 정상적으로 삭제되었습니다. 감사합니다.');");
			out.println("location.href='main.net';");
		} else {
			out.println("alert('계정 삭제 실패');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
		return null;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.mem", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		// out.println("alert('정상적으로 로그아웃 하셨습니다.');");
		out.println("location.href='main.net';");
		out.println("</script>");
		out.close();
		return "redirect:main.net";

	}

	//어드민 -회원 리스트 MemberList.mem
	@RequestMapping(value = "/MemberList.mem", method = RequestMethod.GET)
	public ModelAndView foodlist(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word) throws Exception {
		List<Member> list = null;
		int listcount = 0;
		list = memberservice.getSearchList(index, search_word, page, limit);
		System.out.println("MemberController의 memberservice.getSearchList 끝");
		listcount = memberservice.getSearchListCount(index, search_word);
		System.out.println("MemberController의 memberservice.getSearchListCount 끝");

		// 총페이지수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수 11, 21,31
		int startpage = ((page - 1) / 10) * 10 + 1;

		// endpage : 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/member_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		System.out.println("listcount=" + listcount);
		mv.addObject("userlist", list);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);

		return mv;

	}
	//어드민 - 멤버 수정 - 상세화면 memberModify.re
	@GetMapping("memberModify.re")
	public ModelAndView memberModifyView(int key, ModelAndView mv, HttpServletRequest request) throws Exception{
		System.out.println("멤버 상세 조회");
		Member member = memberservice.getDetail(key);
		
		if(member ==null) {
			 System.out.println("(수정)멤버 상세보기 실패");
				mv.setViewName("error/error");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "(수정) 상세보기 실패입니다.");
				return mv;
		 }
		 System.out.println("(수정)멤버 상세보기 성공");
			mv.addObject("userdata", member);
			mv.setViewName("admin/member_modify");
			return mv;
	}
	//어드민 - 멤버 수정 액션 memberModifyAction.mem
	@PostMapping("memberModifyAction.mem")
	public ModelAndView MemberModifyAction(Member member, ModelAndView mv, HttpServletRequest request, HttpServletResponse response ) throws Exception{
		int result = memberservice.updateMember(member);
		//수정 실패하는 경우
		if (result == 0) {
			System.out.println("Member 멤버 수정 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "Reserve 테이블 수정 실패");
		} 

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='MemberList.mem';");
		out.println("</script>");
		out.close();
		return null;
	}
	
}
