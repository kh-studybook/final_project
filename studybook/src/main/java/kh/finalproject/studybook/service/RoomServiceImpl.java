package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
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

	// 지은 시작

	@Override
	public void insertGallery(int room_code, String DBname, int i) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ROOM_CODE", room_code);
		map.put("FILE_NAME", DBname);
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
	public void insertRoom_ex(int room_code, Room_ex room_ex) {
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

		rdao.insertRoomex(map); // 여기서 만약에 안되면 map형으로 만들어 보내야함

	}

	// 룸이름 중복 검사
	@Override
	public int isRoomName(String ROOM_NAME) {
		Room room = dao.isRoomName(ROOM_NAME);
		return (room == null) ? -1 : 1;
	}

	@Override
	public List<Room> getSearchList(int index, String search_word, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한다면
		if (index != -1) {
			String[] search_field = new String[] { "ROOM_NAME", "ROOM_CODE", "MAX_MEMBER", "HOUR_COST" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		// 검색 안한다면
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getSearchList(map);
	}

	@Override
	public int getSearchListCount(int index, String search_word) {

		Map<String, Object> map = new HashMap<String, Object>();
		// 검색한 경우
		if (index != -1) {
			String[] search_field = new String[] { "ROOM_NAME", "ROOM_CODE", "MAX_MEMBER", "HOUR_COST" };
			map.put("search_field", search_field[index]);
			map.put("search_word", "%" + search_word + "%");
		}
		System.out.println("RoomServiceImpl의 getSearchListCount");
		return dao.getSearchListCount(map);
	}

	// 룸 상세정보 조회
	@Override
	public Room getRoomDetail(int room_code) {
		return dao.getRoomDetail(room_code);
	}

	// 갤러리 리스트 가져오기
	@Override
	public List<Gallery> getGallerylist(int room_code) {
		return gdao.getGalleryList(room_code);
	}

	// room_ex정보 가져오기
	@Override
	public Room_ex getRoomExDetail(int ROOM_CODE) {
		return rdao.getRoomExDetail(ROOM_CODE);
	}

	// 룸정보 업데이트하기
	@Override
	public int updateRoom(Room room) {
		return dao.updateRoom(room);
	}

	// room_ex테이블 업데이트
	@Override
	public int updateRoom_ex(int room_code, Room_ex room_ex) {
		System.out.println("RoomServiceImpl의 updateRoom_ex");

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

		return rdao.updateRoom_ex(map);
	}

	// 갤러리에 해당 룸넘버 이미지 삭제
	@Override
	public void deleteGallary(int room_code) {
		gdao.deleteGallery(room_code);

	}

	// 룸삭제
	@Override
	public int roomDelete(int room_code) {

		int result = 0;
		result = dao.deleteRoom(room_code);
		if (result != 1) {
			System.out.println("룸정보 삭제 완료");
			return result;
		}
		return result;
	}

	// 지은 끝

	// 룸 총 리스트 갯수 가져오기 - 민지
	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	// 룸 총 리스트 가져오기 - 민지
	@Override
	public List<Room> getRoomList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getRoomList(map);
	}


	//메인사진 포함한 room detail 
	@Override
	public Room getRoomInfo(int room_code) {
		// TODO Auto-generated method stub
		return dao.getRoomInfo(room_code);
	}

	// 룸 검색 결과 총 리스트 갯수 가져오기 - 민지
	@Override
	public int getRoomSearchListCount(String date, String starttime, String endtime, String MIN_MEMBER,
			String MAX_MEMBER, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("MIN_MEMBER", MIN_MEMBER);
		map.put("MAX_MEMBER", MAX_MEMBER);
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getRoomSearchListCount(map);
	}

	// 룸 검색 결과 총 리스트 가져오기 - 민지
	@Override
	public List<Room> getSearchRoomList(String date, String starttime, String endtime, String MIN_MEMBER,
			String MAX_MEMBER, int page, int limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("MIN_MEMBER", MIN_MEMBER);
		map.put("MAX_MEMBER", MAX_MEMBER);
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getRoomSearchList(map);
	}

	
}
