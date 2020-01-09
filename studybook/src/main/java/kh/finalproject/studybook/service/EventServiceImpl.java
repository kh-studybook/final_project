package kh.finalproject.studybook.service;

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
		
		
	}
	
}
