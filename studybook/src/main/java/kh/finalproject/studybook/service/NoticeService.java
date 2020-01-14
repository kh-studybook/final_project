package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Notice;

public interface NoticeService {

	int getListCount();

	List<Notice> getNoticeList(int page, int limit);

	Notice getDetail(int num);

	boolean isNoticeWriter(int notice_num);

	int noticeDelete(int num);
	 
 
}
