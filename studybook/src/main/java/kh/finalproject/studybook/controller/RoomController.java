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

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomservice;

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
		System.out.println("해당 룸코드는?=" + room_code);

		// 룸특징 테이블에 입력//이게 빈칸이 아닌경우에만 들어가야함
		roomservice.insertRoom_ex(room_code, room_ex);

		// 해당 룸코드 기준으로 맥스 갤러리넘버 최대값 가져옴
		Gallery gallery1 = roomservice.getGalleryMaxCount(room_code);

		List<MultipartFile> fileList = mtfRequest.getFiles("filename");
		MultipartFile first = fileList.get(0);
		System.out.println("fileList:" + fileList.size());

		String path=saveFolder;
		System.out.println("path = " + path);

		/*
		 * // 포문으로 꺼냄 int i = gallery1.getGALLERY_NUM(); for (MultipartFile mf :
		 * fileList) {
		 * 
		 * String originFileName = mf.getOriginalFilename();// 원본파일명 long fileSize =
		 * mf.getSize();// 파일 사이즈 int num = i++; System.out.println("originFilename : "
		 * + originFileName); System.out.println("fileSize : " + fileSize);
		 * System.out.println("i=" + i);
		 * 
		 */
		
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
		/* } */

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('OK')");
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
			MultipartHttpServletRequest mtfRequest) throws Exception {

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

		return mv;

	}

	// 지은 끝--

	// 룸 정보 보기 - 은지
	@RequestMapping(value = "/room_detail.ro")
	public ModelAndView room_detail(int room_code,ModelAndView mv, 
			HttpServletRequest request) {
		
		Room room=roomservice.getRoomDetail(room_code);
		//Room_ex room_ex=roomservice.getRoomExDetail(room_code);
		//List<Gallery> gallerylist=roomservice.getGallerylist(room_code);
		if(room==null) {
			System.out.println("룸 상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","룸 상세보기 실패입니다.");
		}else {
			System.out.println("룸 상세보기 성공");
			mv.setViewName("room/room_detail_page");
			mv.addObject("room",room);
			//mv.addObject("room_ex",room_ex);
			//mv.addObject("gallerylist",gallerylist);
		}
			
		return mv;
		
	}

	// 예약 페이지로
	@RequestMapping(value = "room_reserve.ro")
	public String room_reserve_page() {
		return "room/room_reserve_page";
	}

	// 음료추가 페이지로
	@RequestMapping(value = "food_add.ro")
	public String food_add_page() {
		return "room/food_add_page";
	}

	// 예약 완료 페이지로
	@RequestMapping(value = "reserve_ok.ro")
	public String reserve_ok_page() {
		return "room/reserve_ok_page";
	}

	// 메인 화면 보기(테스트) - 민지
	@RequestMapping(value = "/main.net")
	public ModelAndView main(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		// 한 화면에 출력할 갯수
		int limit = 9;

		// 총 리스트 갯수
		int listcount = roomservice.getListCount();

		// 총 페이지 수
		int maxpage = (listcount + limit - 1)/limit;
		

		// 시작 페이지(1, 6, 11, ...)
		int startpage = ((page - 1) / 5) * 5 + 1;

		// 마지막 페이지(5, 10, 15, ...)
		int endpage = startpage + 5 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Room> roomlist = roomservice.getRoomList(page, limit);

		mv.setViewName("main/main");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("list", roomlist);
		mv.addObject("limit", limit);

		return mv;
	}

}