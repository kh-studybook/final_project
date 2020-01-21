package kh.finalproject.studybook.service;

import java.util.List;
import kh.finalproject.studybook.domain.Event;


public interface EventService {
	//이벤트 등록하기!!!!
	public void insertEvent(Event event);
	//글 내용 보기
	public Event getEventDetail(int num);
	//글 개수 구하기
	public int getEventListCount();
	//글 목록 보기
	public List<Event> getEventList(int page, int limit);
	//글 수정
	public int eventModify(Event modifyevent);
	//글 삭제
	public int eventDelete(int num);
	//글쓴이 가져오기
	public String getEventWriter(int mem_key);
	//메인 화면 글 개수 구하기
	public int getMainEventListCount();
	//메인 화면 이벤트 리스트 구하기
	public List<Event> getMainEventList(int page, int limit);
}
