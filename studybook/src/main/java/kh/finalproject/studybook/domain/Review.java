package kh.finalproject.studybook.domain;

public class Review {
	private int review_code;
	private int room_code;
	private String content;
	private String review_date;
	private int mem_key;
	//DB에 없는 값
	private String FILE_NAME;
	private int r_code;
	private String ROOM_NAME;
	private String reserve_date;
	private String start_time;
	private String end_time;
	private int rnum;
	
	
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	
	public String getROOM_NAME() {
		return ROOM_NAME;
	}
	public void setROOM_NAME(String rOOM_NAME) {
		ROOM_NAME = rOOM_NAME;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getMem_key() {
		return mem_key;
	}
	public void setMem_key(int mem_key) {
		this.mem_key = mem_key;
	}
	private Member member;
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public int getReview_code() {
		return review_code;
	}
	public void setReview_code(int review_code) {
		this.review_code = review_code;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	
}
