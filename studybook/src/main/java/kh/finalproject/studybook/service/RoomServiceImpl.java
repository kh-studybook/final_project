package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.finalproject.studybook.dao.GalleryDAO;
import kh.finalproject.studybook.dao.RoomDAO;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;

@Service
public class RoomServiceImpl implements RoomService {
	private static final Logger logger = LoggerFactory.getLogger(RoomServiceImpl.class);
	@Autowired
	private RoomDAO dao;

	@Autowired
	private GalleryDAO gdao;

	@Override
	public void insertGallery(int room_code, String originFileName, int i) {

			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_CODE", room_code);
		map.put("FILE_NAME", originFileName);
		map.put("GALLERY_NUM", i);

		gdao.insertGallery(map);
		System.out.println("RoomServiceImple에서 insertGallery 메소드 처리끝");

	}

	@Override
	public void insertRoom(Room room) {
		dao.insertRoom(room);
		
	}

	@Override
	public Room selectRoomNum(String roomname) {
		return dao.selectRoom(roomname);
	}

	@Override
	public Gallery getGalleryMaxCount(int room_code) {
		System.out.println("RoomServiceImple의 getGalleryMaxCount 까지 옴");
		return gdao.selectMaxNum(room_code);
	}
	
	
	

}
