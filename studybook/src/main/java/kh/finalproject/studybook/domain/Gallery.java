package kh.finalproject.studybook.domain;

import org.springframework.web.multipart.MultipartFile;

public class Gallery {
	private int ROOM_CODE;
	private MultipartFile FILE_NAME;
	private int GALLERY_NUM;
	
	public int getROOM_CODE() {
		return ROOM_CODE;
	}
	public void setROOM_CODE(int rOOM_CODE) {
		ROOM_CODE = rOOM_CODE;
	}
	
	public MultipartFile getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(MultipartFile fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	public int getGALLERY_NUM() {
		return GALLERY_NUM;
	}
	public void setGALLERY_NUM(int gALLERY_NUM) {
		GALLERY_NUM = gALLERY_NUM;
	}
	
	
}
