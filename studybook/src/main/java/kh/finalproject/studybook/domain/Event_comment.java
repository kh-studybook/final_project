package kh.finalproject.studybook.domain;

import java.sql.Date;

public class Event_comment {
	private int event_com_num;
	private int mem_key;
	private int event_num;
	private String com_content;
	private String com_date;
	private int com_re_ref;
	private int com_re_lev;
	private int com_re_seq;
	private String name;//DB에 없는 값 - 댓글 사용자 출력을 위함
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEvent_com_num() {
		return event_com_num;
	}
	public void setEvent_com_num(int event_com_num) {
		this.event_com_num = event_com_num;
	}
	public int getMem_key() {
		return mem_key;
	}
	public void setMem_key(int mem_key) {
		this.mem_key = mem_key;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}
	public int getCom_re_ref() {
		return com_re_ref;
	}
	public void setCom_re_ref(int com_re_ref) {
		this.com_re_ref = com_re_ref;
	}
	public int getCom_re_lev() {
		return com_re_lev;
	}
	public void setCom_re_lev(int com_re_lev) {
		this.com_re_lev = com_re_lev;
	}
	public int getCom_re_seq() {
		return com_re_seq;
	}
	public void setCom_re_seq(int com_re_seq) {
		this.com_re_seq = com_re_seq;
	}
}
