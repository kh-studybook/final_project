package kh.finalproject.studybook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.finalproject.studybook.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> getNoticeList(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice getDetail(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isNoticeWriter(int notice_num) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int noticeDelete(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
