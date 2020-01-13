package kh.finalproject.studybook.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalproject.studybook.domain.Gallery;

@Repository
public class GalleryDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//--지은시작
	public void insertGallery(Map<String, Object> map) {
		System.out.println("galleryDAO의 insertGallery까지 옴");
		sqlSession.insert("Rooms.insertGallery",map);//
		
	}

	public Gallery selectMaxNum(int room_code) {
		System.out.println("galleryDAO의 selectMaxNum까지 옴");
		return sqlSession.selectOne("Rooms.selectMaxNum",room_code);
	}
	
	//--지은끝
	
}
