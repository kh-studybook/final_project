package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.ReviewInfo;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;
import kh.finalproject.studybook.service.EventService;
import kh.finalproject.studybook.service.ReserveService;
import kh.finalproject.studybook.service.ReserveServiceImpl;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomservice;

	@Autowired
	private EventService eventservice;

	@Value("${savefoldername}")
	private String saveFolder;

	// 지은 시작--
	// 어드민으로 접속 , 룸리스트 보여줌

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adAccess() {

		return "redirect:RoomList.ro";

	}

	// 룸리스트

	// 어드민 룸등록 이동
	@GetMapping(value = "/RoomWrite.ro")
	public String board_write() throws Exception {
		return "admin/room_register";
	}
	

	// 어드민 룸등록 액션- 다중업로드 시작

	@PostMapping("/RoomAddAction.ro")

	public String room_write_ok(Room room, Room_ex room_ex, MultipartHttpServletRequest mtfRequest,
			HttpServletResponse response) throws Exception {
		String content = room.getROOM_INTRO();
		content = content.replace("\r\n", "<br>");
		room.setROOM_INTRO(content);
		String content2 = room.getFAC_INTRO();
		content2 = content2.replace("\r\n", "<br>");
		room.setFAC_INTRO(content2);

		// 룸정보 테이블에 입력
		roomservice.insertRoom(room);

		// 룸 넘버를 알아내기 (갤러리 등록할 수 있게)
		Room room1 = roomservice.selectRoomNum(room.getROOM_NAME());
		int room_code = room1.getROOM_CODE();
		System.out.println("해당 룸코드는?===" + room_code);

		// 룸특징 테이블에 입력//이게 빈칸이 아닌경우에만 들어가야함
		roomservice.insertRoom_ex(room_code, room_ex);

		// 해당 룸코드 기준으로 맥스 갤러리넘버 최대값 가져옴
		Gallery gallery1 = roomservice.getGalleryMaxCount(room_code);

		List<MultipartFile> fileList = mtfRequest.getFiles("filename");
		MultipartFile first = fileList.get(0);
		System.out.println("fileList:" + fileList.size());

		//String path = saveFolder;
    //선아 경로
		//String path = "C:\\Users\\user1\\git\\final_project[0128]\\final_project\\studybook\\src\\main\\webapp\\resources\\image\\room\\";
    //은지 
		String path="C:\\Users\\user1\\git\\0204_2\\final_project\\studybook\\src\\main\\webapp\\resources\\image\\room\\";

		System.out.println("path = " + path);

		// 포문으로 꺼냄
		int i = gallery1.getGALLERY_NUM();
		for (MultipartFile mf : fileList) {

			String originFileName = mf.getOriginalFilename();// 원본파일명
			long fileSize = mf.getSize();// 파일 사이즈
			int num = i++;
			System.out.println("originFilename : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			System.out.println("i=" + i);

			String safeFile = path + System.currentTimeMillis() + originFileName;
			String DBname = System.currentTimeMillis() + originFileName;

			try {
				mf.transferTo(new File(safeFile));
				// 파일명 DB에 저장
				roomservice.insertGallery(room_code, DBname, i);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				System.out.println("갤러리에 이미지파일 업로드하다 에러남 Roomcontroller");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('룸이 생성되었습니다.')");
		out.println("location.href='RoomList.ro';");
		out.println("</script>");
		out.close();
		return null;
	}
  
	// 룸리스트보기//mv로 수정
	@RequestMapping(value = "/RoomList.ro", method = RequestMethod.GET)
	public ModelAndView roomList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "limit", defaultValue = "10", required = false) int limit, ModelAndView mv,
			@RequestParam(value = "search_field", defaultValue = "-1") int index,
			@RequestParam(value = "search_word", defaultValue = "") String search_word) throws Exception {
		List<Room> list = null;
		int listcount = 0;
		list = roomservice.getSearchList(index, search_word, page, limit);
		System.out.println("RoomController의 roomservice.getSearchList 끝");
		listcount = roomservice.getSearchListCount(index, search_word);
		System.out.println("RoomController의 roomservice.getSearchListCount 끝");
		// 총페이지수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지수 11,21
		int startpage = ((page - 1) / 10) * 10 + 1;

		// endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;

		mv.setViewName("admin/admin_index");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		System.out.println("listcount=" + listcount);
		mv.addObject("roomlist", list);// jsp에서 roomlist로 받아야함
		mv.addObject("limit", limit);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);

		return mv;
	}

	// 룸이름 중복 확인
	@GetMapping(value = "/roomNameCheck.ro")
	public void roomNameCheck(String ROOM_NAME, HttpServletResponse response) throws Exception {
		int result = roomservice.isRoomName(ROOM_NAME);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	// 룸수정RoomModify.ro
	@GetMapping("RoomModify.ro") // 파라미터로 넘어올때는 대소문자를 맞춰줘야함, 반드시 들어오는 파라미터라서 int room_code)로 작성
	public ModelAndView roomModifyView(int room_code, ModelAndView mv, HttpServletRequest request) throws Exception {
		Room roomdata = roomservice.getRoomDetail(room_code);
		List<Gallery> gallerydata = roomservice.getGallerylist(room_code);
		Room_ex roomexdata = roomservice.getRoomExDetail(room_code);

		// 내용 불러오기 실패한 경우
		if (roomdata == null) {

			System.out.println("(수정)상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "(수정) 상세보기 실패입니다.");
			return mv;
		}
		System.out.println("(수정) 상세보기 성공");
		mv.addObject("roomdata", roomdata);
		mv.addObject("gallerydata", gallerydata);
		mv.addObject("roomexdata", roomexdata);
		mv.setViewName("admin/room_modify");
		return mv;
	}

	// 룸 상세 수정
	@PostMapping("RoomModifyAction.ro")
	public ModelAndView RoomModifyAction(Room room, Room_ex room_ex, ModelAndView mv,
			MultipartHttpServletRequest mtfRequest, HttpServletResponse response) throws Exception {

		String content = room.getROOM_INTRO();
		content = content.replace("\r\n", "<br>");
		room.setROOM_INTRO(content);
		String content2 = room.getFAC_INTRO();
		content2 = content2.replace("\r\n", "<br>");
		room.setFAC_INTRO(content2);

		// 룸정보 테이블에 입력
		int result = roomservice.updateRoom(room);

		// 룸테이블 수정 실패한 경우
		if (result == 0) {
			System.out.println("ROOM 테이블 수정 실패");
			mv.setViewName("error/error");
			mv.addObject("url", mtfRequest.getRequestURL());
			mv.addObject("message", "ROOM테이블 수정 실패");
		} else {
			System.out.println("ROOM 테이블 수정 완료");

			// 룸 넘버를 알아내기 (갤러리 등록할 수 있게)
			Room room1 = roomservice.selectRoomNum(room.getROOM_NAME());
			int room_code = room1.getROOM_CODE();
			System.out.println("해당 룸코드는?=" + room_code);

			// 룸특징 테이블에 입력//이게 빈칸이 아닌경우에만 들어가야함
			int result2 = roomservice.updateRoom_ex(room_code, room_ex);
			if (result2 == 0) {
				System.out.println("ROOM_EX테이블 수정 실패");
			}

			List<MultipartFile> fileList = mtfRequest.getFiles("filename");
			MultipartFile first = fileList.get(0);
			System.out.println("fileList:" + fileList.size());

			// 이게 이미지가 공란이 아닐때만 실행되야함
			if (!fileList.isEmpty() && first.getSize() != 0) {
				String path = saveFolder;

				// 해당 룸넘버의 기존 사진을 지움
				roomservice.deleteGallary(room_code);

				// 해당 룸넘버의 max 이미지 번호를 알아옴
				Gallery gallery1 = roomservice.getGalleryMaxCount(room_code);

				// 포문으로 꺼냄
				int i = gallery1.getGALLERY_NUM();
				for (MultipartFile mf : fileList) {

					String originFileName = mf.getOriginalFilename();// 원본파일명
					long fileSize = mf.getSize();// 파일 사이즈
					int num = i++;
					System.out.println("originFilename : " + originFileName);
					System.out.println("fileSize : " + fileSize);
					System.out.println("i=" + i);

					String safeFile = path + System.currentTimeMillis() + originFileName;
					String DBname = System.currentTimeMillis() + originFileName;

					try {
						mf.transferTo(new File(safeFile));
						// 파일명 DB에 저장
						roomservice.insertGallery(room_code, DBname, i);

					} catch (IllegalStateException e) {
						e.printStackTrace();
						System.out.println("갤러리에 이미지파일(수정) 업로드하다 에러남 Roomcontroller");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			String url = "redirect:RoomList.ro";
			mv.setViewName(url);

		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='RoomList.ro';");
		out.println("</script>");
		out.close();
		return null;

	}

	@GetMapping("RoomDelete.ro")
	public String RoomDeleteAction(int room_code, HttpServletResponse response) throws Exception {

		int result = roomservice.roomDelete(room_code);

		if (result == 0) {
			System.out.println("룸 삭제 실패");
		}
		System.out.println("룸 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.');");
		out.println("location.href='RoomList.ro';");
		out.println("</script>");
		out.close();
		return null;
	}

	// 지은 끝--

	// 룸 정보 보기 - 은지
	@RequestMapping(value = "/room_detail.ro")
	public ModelAndView room_detail(int room_code, ModelAndView mv,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws IOException {
		Member member=(Member)session.getAttribute("member");
		if(member==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 먼저 해주세요');");
			out.println("location.href='login.mem';");
			out.println("</script>");
			out.close();
			return null;
		}
		Room room = roomservice.getRoomDetail(room_code);
		Room_ex room_ex=roomservice.getRoomExDetail(room_code);
		List<Gallery> gallerylist=roomservice.getGallerylist(room_code);
		if (room == null) {
			System.out.println("룸 상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "룸 상세보기 실패입니다.");
		} else {
			System.out.println("룸 상세보기 성공");
			mv.addObject("mem_key",member.getKey());
			mv.addObject("room", room);
			System.out.println("룸코드="+room.getROOM_CODE());
			mv.setViewName("room/room_detail_page");
			mv.addObject("room_ex",room_ex);
			 mv.addObject("gallerylist",gallerylist);
		}
		return mv;
	}

	// 메인 화면 보기(테스트) - 민지
	@RequestMapping(value = "/main.net")
	public ModelAndView main(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		// 한 화면에 출력할 room 갯수
		int limit = 9;

		// 총 room 리스트 갯수
		int listcount = roomservice.getListCount();

		// 총 room 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 시작 페이지(1, 6, 11, ...)
		int startpage = ((page - 1) / 5) * 5 + 1;

		// 마지막 페이지(5, 10, 15, ...)
		int endpage = startpage + 5 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Room> roomlist = roomservice.getRoomList(page, limit);

		// 한 화면에 출력할 event 갯수
		int event_limit = 3;

		// 총 event 리스트 갯수
		int event_listcount = eventservice.getMainEventListCount();

		if (event_listcount >= 6) {
			event_listcount = 6;
			List<Event> eventlist = eventservice.getMainEventList(1, event_limit);
			mv.addObject("eventlist", eventlist);
			List<Event> eventlist2 = eventservice.getMainEventList(2, event_limit);
			mv.addObject("eventlist2", eventlist2);
		} else if (event_listcount >= 3) {
			List<Event> eventlist = eventservice.getMainEventList(1, event_limit);
			mv.addObject("eventlist", eventlist);
			List<Event> eventlist2 = eventservice.getMainEventList(2, event_limit);
			mv.addObject("eventlist2", eventlist2);
		} else {
			List<Event> eventlist = eventservice.getMainEventList(1, event_limit);
			mv.addObject("eventlist", eventlist);
			List<Event> eventlist2 = null;
			mv.addObject("eventlist2", eventlist2);
		}

		mv.setViewName("main/main");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("list", roomlist);
		mv.addObject("limit", limit);
		mv.addObject("event_limit", event_limit);
		mv.addObject("event_listcount", event_listcount);

		return mv;
	}

	//ajax roomList 불러오기 -- 민지
	@ResponseBody
	@RequestMapping(value = "getRoomList.net")
	public Object getRoomList(@RequestParam(value = "page", defaultValue = "1", required = false) int page)
			throws Exception {
		// 한 화면에 출력할 room 갯수
		int limit = 9;

		// 총 room 리스트 갯수
		int listcount = roomservice.getListCount();

		// 총 room 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 시작 페이지(1, 6, 11, ...)
		int startpage = ((page - 1) / 5) * 5 + 1;

		// 마지막 페이지(5, 10, 15, ...)
		int endpage = startpage + 5 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Room> roomlist = roomservice.getRoomList(page, limit);
		
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("page", page);
		obj.put("maxpage", maxpage);
		obj.put("startpage", startpage);
		obj.put("endpage", endpage);
		obj.put("listcount", listcount);
		obj.put("roomlist", roomlist);
		obj.put("limit", limit);
		return obj;
	}

	//룸 검색
	@RequestMapping(value="RoomSearch.ro")
	public ModelAndView roomSearch(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam String date,
			@RequestParam String starttime,
			@RequestParam String endtime,
			@RequestParam String MIN_MEMBER,
			@RequestParam String MAX_MEMBER,
			ModelAndView mv) {		
		System.out.println("date="+date);
		// 한 화면에 출력할 room 갯수
		int limit = 9;

		// 총 room 리스트 갯수
		int listcount = roomservice.getRoomSearchListCount(date, starttime, endtime, MIN_MEMBER, MAX_MEMBER, page, limit);

		// 총 room 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 시작 페이지(1, 6, 11, ...)
		int startpage = ((page - 1) / 5) * 5 + 1;

		// 마지막 페이지(5, 10, 15, ...)
		int endpage = startpage + 5 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
		
		List<Room> roomlist = roomservice.getSearchRoomList(date, starttime, endtime, MIN_MEMBER, MAX_MEMBER, page, limit);
		
		mv.setViewName("room/room_search");
		mv.addObject("date", date);
		mv.addObject("starttime", starttime);
		mv.addObject("endtime", endtime);
		mv.addObject("MIN_MEMBER", MIN_MEMBER);
		mv.addObject("MAX_MEMBER", MAX_MEMBER);
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("list", roomlist);
		mv.addObject("limit", limit);
		return mv;
	}
	
	//룸 검색 ajax
	@ResponseBody
	@RequestMapping(value="RoomSearchList.ro")
	public Object roomSearchList(
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam String date,
			@RequestParam String starttime,
			@RequestParam String endtime,
			@RequestParam String MIN_MEMBER,
			@RequestParam String MAX_MEMBER) {		
		System.out.println("date="+date);
		// 한 화면에 출력할 room 갯수
		int limit = 9;

		// 총 room 리스트 갯수
		int listcount = roomservice.getRoomSearchListCount(date, starttime, endtime, MIN_MEMBER, MAX_MEMBER, page, limit);

		// 총 room 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 시작 페이지(1, 6, 11, ...)
		int startpage = ((page - 1) / 5) * 5 + 1;

		// 마지막 페이지(5, 10, 15, ...)
		int endpage = startpage + 5 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
		
		List<Room> roomlist = roomservice.getSearchRoomList(date, starttime, endtime, MIN_MEMBER, MAX_MEMBER, page, limit);
		
		Map<String, Object> obj = new HashMap<String, Object>();
		obj.put("date", date);
		obj.put("starttime", starttime);
		obj.put("endtime", endtime);
		obj.put("MIN_MEMBER", MIN_MEMBER);
		obj.put("MAX_MEMBER", MAX_MEMBER);
		obj.put("page", page);
		obj.put("maxpage", maxpage);
		obj.put("startpage", startpage);
		obj.put("endpage", endpage);
		obj.put("listcount", listcount);
		obj.put("roomlist", roomlist);
		obj.put("limit", limit);
		return obj;
	}
}