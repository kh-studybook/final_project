
package kh.finalproject.studybook.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.domain.Food;
import kh.finalproject.studybook.domain.Food_reserve;
import kh.finalproject.studybook.domain.Gallery;
import kh.finalproject.studybook.domain.Reserve;
import kh.finalproject.studybook.domain.Review;
import kh.finalproject.studybook.domain.ReviewInfo;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//룸별 리뷰 리스트
	public List<ReviewInfo> getReviewList(HashMap<String, Integer> map){
		return sqlSession.selectList("Reserves.getReivewList",map);
	}
	//룸별 리뷰갯수
	public int getReviewCount(int room_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reserves.getReviewCount",room_code);
	}
	//음식 목록
	public List<Food> getFoodListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Foods.getFoodListAll");
	}
	//예약하기
	public int insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Reserves.insertReserve",reserve);
	}
	//예약내용 불러오기
	public Reserve getReserveDetail(int r_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reserves.getReserveDetail",r_code);
	}
	//현재 예약코드
	public int getMaxR_code() {
		return sqlSession.selectOne("Reserves.getMaxR_code");
	}
	//음식예약하기
	public void insertFood_reserve(Food_reserve fr) {
		// TODO Auto-generated method stub
		sqlSession.insert("Reserves.insertFood_reserve",fr);
	}
	//음식예약목록 불러오기
	public List<Food_reserve> getFood_reservelist(int r_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Reserves.getFood_reservelist",r_code);
	}

	//--지은 시작
	//나의 후기에서 리스트 불러오기
	public List<Review> getReviewSearchList(Map<String, Object> map) {
		return sqlSession.selectList("Reserves.getSearchList",map);
	}
	//나의 후기에서 리스트 카운트 불러오기
	public int getReviewSearchListCount(int key) {
		return sqlSession.selectOne("Reserves.searchcount",key);
	}
	
	//후기 삭제
	public int reviewDelete(int review_code) {
		return sqlSession.delete("Reserves.deletereview",review_code);
	}

	//상세내용 불러오기
	public Review reviewDetailAction(int review_code) {
		return sqlSession.selectOne("Reserves.reviewDetail",review_code);
	}
	//후기 수정
	public int updateReviewAction(Map<String, Object> map) {
		return sqlSession.update("Reserves.updateReview",map);
	}
	//어드민 예약 리스트
	public List<Reserve> getSearchList2(Map<String, Object> map) {
		return sqlSession.selectList("Reserves.getSearchList2",map);
	}
	//어드민 예약 리스트 카운트
	public int getSearchListCount2(Map<String, Object> map) {
		return sqlSession.selectOne("Reserves.searchcount2",map);
	}
	//예약 정보 가져오기(룸네임 포함)
	public Reserve getReserveFullDetail(int r_code) {
		return sqlSession.selectOne("Reserves.getDetail",r_code);
	}
	//예약 정보 수정
	public int updateReserve(Reserve reserve) {
		return sqlSession.update("Reserves.updateReserve",reserve);
	}
	
	//--지은 끝

	//날짜별 예약되어있는 시간 목록 불러오기
	public List<Reserve> getReserve_timelist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Reserves.getReserve_timelist",map);
	}
	public int reserve_cancel(int r_code) {
		// TODO Auto-generated method stub
		return sqlSession.update("Reserves.reserve_cancel",r_code);
	}
	
	//선아 시작
	public int getReserveListCount(int mem_key) {
		return sqlSession.selectOne("Reserves.reserveListCount", mem_key);
	}
	public List<Reserve> getReserveList(HashMap<Object, Object> map) {
		return sqlSession.selectList("Reserves.reservelist", map);
	}
	public int registerReview(Map<String, Object> obj) {
		return sqlSession.insert("Reserves.registerReview", obj);
	}
	public int rCodeChange(int r_code) {
		return sqlSession.update("Reserves.rCodeChange", r_code);
	}

	
	   //후기 삭제후 상태변경
	   public int updateStatus(int review_code) {
	      return sqlSession.update("Reserves.updateStatus",review_code);
	   }
	   //후기 삭제후 상태 변경
	   public Review selectR_code(int review_code) {
	      return sqlSession.selectOne("Reserves.selectR_code",review_code);
	   }
	
	

}
