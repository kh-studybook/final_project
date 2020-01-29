package kh.finalproject.studybook.domain;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String name;
	private String email;
	private String password;
	private String phone; 
	private int key;
	private String profile = "/image/profile/default.png";
	private MultipartFile uploadfile;	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
}
