package kh.finalproject.studybook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproject.studybook.dao.NoticeDAO;
import kh.finalproject.studybook.domain.Notice;

@Service 
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO ndao;
	
	@Override
	public int getListCount() {
		return ndao.getListCount();
	}

	@Override
	public List<Notice> getNoticeList(int page, int limit) {
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end",endrow);
		
		return ndao.getNoticeList(map);
	}

	@Override
	public Notice getDetail(int num) {
		return ndao.getDetail(num);
	}


	@Override
	public int noticeDelete(int num) {
		int result = 0;
		Notice notice = ndao.getDetail(num);
		if (notice != null) {
			result = ndao.noticeDelete(num);
		}
		return result;
	}

	@Override
	public void insertNotice(Notice notice) {
		ndao.insertNotice(notice);
		
	}

	@Override
	public int noticeModify(Notice notice) {
		return ndao.noticeModify(notice);
	}

}
