package kh.finalproject.studybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO dao;
	
	@Override
	public void insertEvent(Event event) {//이벤트 등록하기
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int eventModify(Event modifyevent) {//이벤트 수정하기
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eventDelete(int num) {//이벤트 삭제하기
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isEventWriter(int num, String pass) {//글쓴이인지 확인하기
		// TODO Auto-generated method stub
		return false;
	}
	
}
