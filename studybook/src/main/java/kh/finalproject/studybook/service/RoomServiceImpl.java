package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.GalleryDAO;
import kh.finalproject.studybook.dao.RoomDAO;
import kh.finalproject.studybook.dao.Room_exDAO;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.domain.Room_ex;

@Service
public class RoomServiceImpl implements RoomService {
	private static final Logger logger = LoggerFactory.getLogger(RoomServiceImpl.class);
	@Autowired
	private RoomDAO dao;

	@Autowired
	private GalleryDAO gdao;
	
	@Autowired
	private Room_exDAO rdao;
	
	//지은 시작

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

	@Override
	public void insertRoom_ex(int room_code,Room_ex room_ex) {
		System.out.println("RoomServiceImpl의 insertRoom_ex");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_CODE", room_code);
		map.put("ALCOHOL", room_ex.getALCOHOL());
		map.put("MIC", room_ex.getMIC());
		map.put("CHAIR", room_ex.getCHAIR());
		map.put("FOOD", room_ex.getFOOD());
		map.put("TOILET", room_ex.getTOILET());
		map.put("SMOKING", room_ex.getSMOKING());
		map.put("PARKING", room_ex.getPARKING());
		map.put("TV", room_ex.getTV());
		map.put("BOARD", room_ex.getBOARD());
		map.put("WIFI", room_ex.getWIFI());
		
		
		rdao.insertRoomex(map); //여기서 만약에 안되면 map형으로 만들어 보내야함
		
	}
	//룸이름 중복 검사
	@Override
	public int isRoomName(String ROOM_NAME) {
		Room room = dao.isRoomName(ROOM_NAME);
		return (room==null)?-1:1;
	}
	
	//지은 끝
	
	

}
