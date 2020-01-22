package kh.finalproject.studybook.service;

import java.util.List;

import kh.finalproject.studybook.domain.Notice;

public interface NoticeService { 
	
	public int getListCount();
	
	public List<Notice> getNoticeList(int page, int limit);

	public Notice getDetail(int num);
	
	public void insertNotice(Notice notice); 

	public boolean isNoticeWriter(int notice_num);

	public int noticeModify(Notice noticemodify);
	
	public int noticeDelete(int num);
 
}
