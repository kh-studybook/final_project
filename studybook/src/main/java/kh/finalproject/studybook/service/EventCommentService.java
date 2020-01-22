package kh.finalproject.studybook.service;

import java.util.List;
import kh.finalproject.studybook.domain.Event_comment;

public interface EventCommentService {
	//글의 개수 구하기
	int getEventListCount(int num);
	//글의 개수 구하기
	int Event_commentsInsert(Event_comment co);
	//댓글 목록 가져가기
	List<Event_comment> getEvent_commentList(int event_num);
	//댓글 삭제
	int Event_commentsDelete(int event_com_num);
	//댓글 수정
	int Event_commentsUpdate(Event_comment co);

}
