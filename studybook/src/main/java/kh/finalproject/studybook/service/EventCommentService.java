package kh.finalproject.studybook.service;

import java.util.List;
import kh.finalproject.studybook.domain.Event_comment;

public interface EventCommentService {
	//글의 개수 구하기!!
	public int getEventListCount(int event_num);	
	//댓글 목록 가져가기
	public List<Event_comment> getEventCommentList(int event_num);
	//댓글 등록하기
	public int eventCommentsInsert(Event_comment c);
	//댓글 삭제
	public int eventCommentsDelete(int num);
	//댓글 수정
	public int eventCommentsUpdate(Event_comment co);
}
