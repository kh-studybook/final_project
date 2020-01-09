package kh.finalproject.studybook.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.finalproject.studybook.service.EventService;
import kh.finalproject.studybook.domain.Event;

@Controller
public class EventController {
		@Autowired
		private EventService eventservice;

		//�̺�Ʈ ��� ȭ������ �̵�
		@GetMapping(value = "/registerEvent.eve")
		public String event_write_view() throws Exception{
			return "event/event_main";
		}
		
		//�̺�Ʈ ����ϱ�
		@PostMapping(value = "EventAddAction.eve")
		public String event_write_ok(Event event, HttpServletRequest request) throws Exception{
			   //���� ����ϱ�				
			  MultipartFile uploadfile=event.getEventPic_uploadfile();
		      
		      if(!uploadfile.isEmpty()) {
		         String fileName=uploadfile.getOriginalFilename();
		         event.setEventPic_originalfile(fileName);  //���� ���ϸ� ����
		      
		      //���ο� ���� �̸� : ���� ��+��+��
		      Calendar c=Calendar.getInstance();
		      int year=c.get(Calendar.YEAR);
		      int month=c.get(Calendar.MONTH) + 1 ;
		      int date=c.get(Calendar.DATE);
		      String saveFolder=request.getSession().getServletContext().getRealPath("resources")+"/upload/";
		      String homedir=saveFolder+year+"-"+month+"-"+date;
		      System.out.println(homedir);
		      File path1=new File(homedir);
		      if(!(path1.exists())) {
		         path1.mkdir(); //���ο� ������ ����
		      }
		     
		      //���� ����
		      Random r=new Random();
		      int random=r.nextInt(100000000);
		      
		      /*** Ȯ���� ���ϱ� ���� ***/
		      int index=fileName.lastIndexOf(".");
		      //���ڿ����� Ư�� ���ڿ��� ��ġ ��(index)�� ��ȯ�Ѵ�.
		      //indexOf�� ó�� �߰ߵǴ� ���ڿ��� ���� index�� ��ȯ�ϴ� �ݸ�
		      //lastIndexOf�� ���������� �߰ߵǴ� ���ڿ��� index����ȯ�մϴ�.
		      System.out.println("index = " + index);
		      String fileExtension =fileName.substring(index+1);
		      System.out.println("fileExtension = "+fileExtension);
		      /*** Ȯ���� ���ϱ� �� ***/
		      
		      //���ο� ���ϸ�
		      String refileName="bbs"+year+month+date+random+"."+fileExtension;
		      System.out.println("refileName = "+refileName);
		      String fileDBName= "/"+year+"-"+month+"-"+date+"/"+refileName;
		      System.out.println("fileDBName = "+fileDBName);
		      
		      //tranferTo(File path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
		      uploadfile.transferTo(new File(saveFolder+fileDBName));
		      
		      //�ٲ����ϸ����� ����
		      event.setEventPic_originalfile(fileDBName);
		      }	      
		      
			eventservice.insertEvent(event);
			return "EventList.eve";
		}
		
		//�̺�Ʈ ����Ʈ ����
		//@RequestMapping(value = "EventList.eve")
		
		
	
}
