package kh.finalproject.studybook.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Event {
	private int event_num;
	private int mem_key;
	private String title;
	private String date;
	private Date event_date;
	private String event_start;
	private String event_end;
	private String event_room;
	private MultipartFile eventPic_uploadfile;
	private String eventPic_savefile="/image/default.png";
	private String eventPic_originalfile="/image/default.png";

	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public int getMem_key() {
		return mem_key;
	}
	public void setMem_key(int mem_key) {
		this.mem_key = mem_key;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	public String getEvent_room() {
		return event_room;
	}
	public void setEvent_room(String event_room) {
		this.event_room = event_room;
	}
	public MultipartFile getEventPic_uploadfile() {
		return eventPic_uploadfile;
	}
	public void setEventPic_uploadfile(MultipartFile eventPic_uploadfile) {
		this.eventPic_uploadfile = eventPic_uploadfile;
	}
	public String getEventPic_savefile() {
		return eventPic_savefile;
	}
	public void setEventPic_savefile(String eventPic_savefile) {
		this.eventPic_savefile = eventPic_savefile;
	}
	public String getEventPic_originalfile() {
		return eventPic_originalfile;
	}
	public void setEventPic_originalfile(String eventPic_originalfile) {
		this.eventPic_originalfile = eventPic_originalfile;
	}

}
