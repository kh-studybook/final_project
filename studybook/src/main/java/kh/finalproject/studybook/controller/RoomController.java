package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomservice;

	// 지은 시작--
	// 어드민으로 접속 , 룸리스트 보여줌

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adAccess() {
		return "admin/admin_index";
		
	}
	

	// 어드민 룸등록 이동
	@GetMapping(value = "/RoomWrite.ro")
	public String board_write() throws Exception {
		return "admin/room_register";
	}

	// 어드민 룸등록 액션- 다중업로드 시작

	@PostMapping("/RoomAddAction.ro")
	public String room_write_ok(Room room,MultipartHttpServletRequest mtfRequest) throws Exception {

		//룸정보 테이블에 입력
		roomservice.insertRoom(room);
		
		//룸 넘버를 알아내기 (갤러리 등록할 수 있게)
		Room room1 = roomservice.selectRoomNum(room.getROOM_NAME());
		int room_code = room1.getROOM_CODE(); 
		System.out.println("해당 룸코드는?="+room_code);
		
		//해당 룸코드 기준으로 맥스 갤러리넘버 최대값 가져옴
		Gallery gallery1 = roomservice.getGalleryMaxCount(room_code);
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("filename");

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
				//파일명 저장
				roomservice.insertGallery(room_code,originFileName, i);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "admin/admin_index";
	}

	// 룸리스트보기//
	@RequestMapping(value = "/RoomList.ro", method = RequestMethod.GET)
	public String roomList() {
		return "admin/admin_index";
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
