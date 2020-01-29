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
	private String reserver_name;
	private String reserver_phone;
	private String reserver_email;
	private String pay_date;
	
	//룸이름만 필요
	private String room_name;
	//어드민 필요
	private int count;
	private int food_code;
	

	//DB에 없는 값 - file name
	private String file_name;
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;

	
	
	
	
	public int getFood_code() {
		return food_code;
	}
	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;

	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getReserver_name() {
		return reserver_name;
	}
	public void setReserver_name(String reserver_name) {
		this.reserver_name = reserver_name;
	}
	public String getReserver_phone() {
		return reserver_phone;
	}
	public void setReserver_phone(String reserver_phone) {
		this.reserver_phone = reserver_phone;
	}
	public String getReserver_email() {
		return reserver_email;
	}
	public void setReserver_email(String reserver_email) {
		this.reserver_email = reserver_email;
	}
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
