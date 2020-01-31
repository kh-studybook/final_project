package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Notice;

public interface NoticeService { 
	
	public int getListCount();
	
	public List<Notice> getNoticeList(int page, int limit);

	public Notice getDetail(int num);
	
	public void insertNotice(Notice notice); 

	public int noticeModify(Notice notice);
	
	public int noticeDelete(int num);

}
