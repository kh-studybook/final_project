package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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

	// 지은 시작--
	// 어드민으로 접속 , 룸리스트 보여줌

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adAccess() {
		return "redirect:RoomList.ro";
		
	}
	
	//룸리스트
	
	

	// 어드민 룸등록 이동
	@GetMapping(value = "/RoomWrite.ro")
	public String board_write() throws Exception {
		return "admin/room_register";
	}

	// 어드민 룸등록 액션- 다중업로드 시작

	@PostMapping("/RoomAddAction.ro")
	public String room_write_ok(Room room,Room_ex room_ex,MultipartHttpServletRequest mtfRequest) throws Exception {

		//룸정보 테이블에 입력
		roomservice.insertRoom(room);
		
		//룸 넘버를 알아내기 (갤러리 등록할 수 있게)
		Room room1 = roomservice.selectRoomNum(room.getROOM_NAME());
		int room_code = room1.getROOM_CODE(); 
		System.out.println("해당 룸코드는?="+room_code);
		
		//룸특징 테이블에 입력//이게 빈칸이 아닌경우에만 들어가야함
		roomservice.insertRoom_ex(room_code,room_ex);
		
		//해당 룸코드 기준으로 맥스 갤러리넘버 최대값 가져옴
		Gallery gallery1 = roomservice.getGalleryMaxCount(room_code);
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("filename");
		MultipartFile first=fileList.get(0);
		System.out.println("fileList:"+fileList.size());
		
		
		//이게 이미지가 공란이 아닐때만 실행되야함
		if(!fileList.isEmpty()&&first.getSize()!=0) {
		String path="C:\\Users\\user1\\git\\final_project4\\studybook\\src\\main\\webapp\\resources\\image\\room\\";
		
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
			
			try {				
				mf.transferTo(new File(safeFile));
				//파일명 DB에 저장
				roomservice.insertGallery(room_code,originFileName,i);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				System.out.println("갤러리에 이미지파일 업로드하다 에러남 Roomcontroller");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		}}

		return "redirect:RoomList.ro";
	}

	// 룸리스트보기//mv로 수정
	@RequestMapping(value = "/RoomList.ro", method = RequestMethod.GET)
	public ModelAndView roomList(@RequestParam(value="page", defaultValue="1", required=false) int page,
								@RequestParam(value="limit", defaultValue="10", required=false) int limit,
								ModelAndView mv,
								@RequestParam(value="search_field", defaultValue="-1") int index,
								@RequestParam(value="search_word", defaultValue="") String search_word
								) throws Exception{
		List<Room> list = null;
		int listcount =0;
		list = roomservice.getSearchList(index, search_word,page,limit);
		listcount = roomservice.getSearchListCount(index, search_word);
		
		//총페이지수
		int maxpage=(listcount+limit -1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지수 11,21
		int startpage=((page-1)/10)*10+1;
		
		//endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지수 10,20,30
		int endpage = startpage+10-1;
		if(endpage>maxpage)
			endpage=maxpage;
		
		mv.setViewName("admin/admin_index");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		System.out.println("listcount="+listcount);
		mv.addObject("roomlist",list);//jsp에서 roomlist로 받아야함
		mv.addObject("limit",limit);
		mv.addObject("search_field",index);
		mv.addObject("search_word",search_word);
		
		return mv;
	}

	//룸이름 중복 확인
	@GetMapping(value="/roomNameCheck.ro")
	public void roomNameCheck(String ROOM_NAME, HttpServletResponse response) throws Exception{
		int result=roomservice.isRoomName(ROOM_NAME);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	// 지은 끝--

	// 룸 정보 보기 -연습용(은지)
	@RequestMapping(value = "/room_detail")
	public String room_detail() {
		return "room/detail";
	}

	// 메인 화면 보기(테스트) - 민지
	@RequestMapping(value = "/main.net")
	public String main() {
		return "room/main";
	}

}
