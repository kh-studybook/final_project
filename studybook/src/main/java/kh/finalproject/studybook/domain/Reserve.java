package kh.finalproject.studybook.domain;

public class Reserve {
	private int r_code;
	private int mem_key;
	private int room_code;
	private String reserve_date;
	private String start_time;
	private String end_time;
	private int total_cost;
	private String require;
	private int status=1;
	private int extra_num;
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public int getMem_key() {
		return mem_key;
	}
	public void setMem_key(int mem_key) {
		this.mem_key = mem_key;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
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
	public int getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(int total_cost) {
		this.total_cost = total_cost;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getExtra_num() {
		return extra_num;
	}
	public void setExtra_num(int extra_num) {
		this.extra_num = extra_num;
	}
	
	
}
