package kh.finalproject.studybook.domain;

public class Review {
	private int review_code;
	private int room_code;
	private String content;
	private String review_date;
	private int mem_key;
	
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
