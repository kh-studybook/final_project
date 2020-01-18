package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO dao;
	
	@Override
	public void insertEvent(Event event) {//이벤트 등록하기!!!!
		dao.insertEvent(event);		
	}

	@Override
	public Event getEventDetail(int num) {//글 내용보기
		return dao.getEventDetail(num);
	}

	@Override
	public int getEventListCount() {//이벤트 총 갯수 가져오기
		return dao.getEventListCount();
	}

	@Override
	public List<Event> getEventList(int page, int limit) {//글 목록 보기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1)*limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getEventList(map);
	}

	@Override
	public int eventModify(Event modifyevent) {//이벤트 수정하기
		return dao.eventModify(modifyevent);
	}

	@Override
	public int eventDelete(int num) {//이벤트 삭제하기
	
		return dao.eventDelete(num);
		
	}

	@Override
	public boolean isEventWriter(int num) {
		// TODO Auto-generated method stub
		return false;
	}

	
}
