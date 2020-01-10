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

      //이벤트 등록 화면으로 이동
      @GetMapping(value = "/registerEvent.eve")
      public String event_write_view() throws Exception{
         return "event/event_main";
      }
      
      //이벤트 등록하기
      @PostMapping(value = "EventAddAction.eve")
      public String event_write_ok(Event event, HttpServletRequest request) throws Exception{
            //사진 등록하기            
           MultipartFile uploadfile=event.getEventPic_uploadfile();
            
            if(!uploadfile.isEmpty()) {
               String fileName=uploadfile.getOriginalFilename();
               event.setEventPic_originalfile(fileName);  //원래 파일명 저장
            
            //새로운 폴더 이름 : 오늘 년+월+일
            Calendar c=Calendar.getInstance();
            int year=c.get(Calendar.YEAR);
            int month=c.get(Calendar.MONTH) + 1 ;
            int date=c.get(Calendar.DATE);
            String saveFolder=request.getSession().getServletContext().getRealPath("resources")+"/upload/";
            String homedir=saveFolder+year+"-"+month+"-"+date;
            System.out.println(homedir);
            File path1=new File(homedir);
            if(!(path1.exists())) {
               path1.mkdir(); //새로운 폴더를 생성
            }
           
            //난수 생성
            Random r=new Random();
            int random=r.nextInt(100000000);
            
            /*** 확장자 구하기 시작 ***/
            int index=fileName.lastIndexOf(".");
            //문자열에서 특정 문자열의 위치 값(index)를 반환한다.
            //indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면
            //lastIndexOf는 마지막으로 발견되는 문자열의 index를반환합니다.
            System.out.println("index = " + index);
            String fileExtension =fileName.substring(index+1);
            System.out.println("fileExtension = "+fileExtension);
            /*** 확장자 구하기 끝 ***/
            
            //새로운 파일명
            String refileName="bbs"+year+month+date+random+"."+fileExtension;
            System.out.println("refileName = "+refileName);
            String fileDBName= "/"+year+"-"+month+"-"+date+"/"+refileName;
            System.out.println("fileDBName = "+fileDBName);
            
            //tranferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
            uploadfile.transferTo(new File(saveFolder+fileDBName));
            
            //바뀐파일명으로 저장
            event.setEventPic_originalfile(fileDBName);
            }         
            
         eventservice.insertEvent(event);
         return "EventList.eve";
      }
      
      //이벤트 리스트 보기
      //@RequestMapping(value = "EventList.eve")
      
      
   
}