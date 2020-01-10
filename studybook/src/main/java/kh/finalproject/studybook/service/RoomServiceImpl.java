package kh.finalproject.studybook.service;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.finalproject.studybook.dao.RoomDAO;

@Service
public class RoomServiceImpl implements RoomService {
	private static final Logger logger 
	= LoggerFactory.getLogger(RoomServiceImpl.class); 
	@Autowired
	private RoomDAO dao;
	
	@Override
	public void writeRoom(Map<String, Object> map, HttpServletRequest req){
		dao.insertRoom(map);
	
			}
	
		
	}


