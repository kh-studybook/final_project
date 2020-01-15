package kh.finalproject.studybook.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.service.EventCommentService;
import kh.finalproject.studybook.service.EventService;
import kh.finalproject.studybook.domain.Event;

@Controller
public class EventController {
		@Autowired
		private EventService eventservice;
		
		@Autowired
		private EventCommentService eventcommentservice; 
		
		@Value("${savefoldername}")
		private String saveFolder;

		//이벤트 등록 화면으로 이동!!!!
		@RequestMapping(value = "/registerEvent.eve")
		public String event_write_view() throws Exception{
			return "event/event_main";
		}//event_write view end
		
		//이벤트 등록하기
		@RequestMapping(value = "EventAddAction.eve")
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
		      
		      //String saveFolder=request.getSession().getServletContext().getRealPath("resources")+"/upload/" 바꾸기;
		      String saveFolder="C:\\Users\\user1\\git\\final_project[0115]\\final_project\\studybook\\src\\main\\webapp\\resources\\upload/";
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
		      event.setEvent_pic(fileDBName);
		      }	      
		    
			eventservice.insertEvent(event);
			return "redirect:event_list.eve";
		}//event_write_ok end
		
		//이벤트 리스트 보기
		@RequestMapping(value = "event_list.eve")
		public ModelAndView eventList(
				@RequestParam(value = "page", defaultValue = "1", required = false)int page, 
				ModelAndView mv) throws Exception {	
			int limit = 9;//기본으로 9개의 글을 보여줌
			int listcount = eventservice.getEventListCount();// 총 리스트를 받아옴
			
			int maxpage = (listcount + limit - 1)/limit;
			int startpage = ((page - 1)/9) * 9 + 1;
			int endpage = startpage + 9 - 1;
			
			if (endpage > maxpage){endpage = maxpage;}		
			
			List<Event> eventlist = eventservice.getEventList(page, limit);
			mv.setViewName("event/event_list");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("eventlist", eventlist);
			mv.addObject("limit", limit);
			
			return mv;
		}//EventList.eve end
		
		//이벤트 게시글 보기
		@RequestMapping(value = "EventDetailAction.eve")
		public ModelAndView eventGetDetail(int num, ModelAndView mv, HttpServletRequest request) {
			Event event = eventservice.getEventDetail(num);
			if (event == null) {
				System.out.println("상세보기 실패");
				mv.setViewName("redirect:eventList.eve");
				mv.addObject("url", request.getRequestURL());//위의 request는 어디에서 에러가 났는지 알려주기 위해서 넣는다.
				mv.addObject("message", "상세보기 실패입니다.");
			} else {
				System.out.println("상세보기 성공");
				int count = eventcommentservice.getEventListCount(num);
				mv.setViewName("event/event_view");
				mv.addObject("count", count);
				mv.addObject("eventdata", event);
			}				
			return mv;
		}//EventDetailAction.eve end
		
		//이벤트 수정 페이지 보기
		@GetMapping("EventModifyView.eve")
		public ModelAndView EventModify(int num, ModelAndView mv, HttpServletRequest request) 
				throws Exception {
			Event eventdata = eventservice.getEventDetail(num);
			if(eventdata == null) {
				System.out.println("(수정)상세보기 실패");
				mv.setViewName("redirect:eventList.eve");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "(수정)상세보기 실패입니다.");
				return mv;
			}
			System.out.println("(수정)상세보기 성공");		
			mv.addObject("eventdata", eventdata);			
			mv.setViewName("view/event_modify");
			return mv;
		}
		
		//이벤트 수정하기
		@PostMapping("EventModifyAction.eve")
		public ModelAndView EventModifyAction(Event event, 
				ModelAndView mv, HttpServletRequest request, HttpServletResponse response) 
						throws Exception{
			boolean usercheck = eventservice.isEventWriter(event.getMem_key());//추후 확인 : 유저 확인이 필요한가?
			//비밀번호가 다른 경우
			if (usercheck == false) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("histroy.back()");
				out.println("</script>");
				out.close();
				return null;
			}
			MultipartFile uploadfile = event.getEventPic_uploadfile();
	
			if (uploadfile != null && !uploadfile.isEmpty()) {//파일을 변경한 경우
					System.out.println("파일 변경한 경우");
					String fileName = uploadfile.getOriginalFilename();//원래 파일명을 가져오기
					event.setEventPic_originalfile(fileName);
					
					String fileDBName = fileDBName(fileName, saveFolder);
					
					//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
					uploadfile.transferTo(new File(saveFolder + fileDBName));
					
					//바뀐 파일명으로 저장
					event.setEvent_pic(fileDBName);
			}
			
			//DAO에서 수정 메서드를 호출하여 수정합니다.
			int result = eventservice.eventModify(event);
			
			//수정에 실패한 경우
			if (result == 0) {
				System.out.println("게시판 수정 실패");
				mv.setViewName("error/error");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "게시판 수정 실패");
			} else {//수정 성공한 경우
				System.out.println("게시판 수정 완료");
				
				String url = "redirect:EventDetailAction.eve?num=" + event.getEvent_num();
				
				//수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정
				mv.setViewName(url);
			}
			return mv;
		}

		public String fileDBName(String fileName, String saveFolder) {
			//필요한 데이터가 fileName와 saveFolder이므로 매개변수로 넘긴다.
			//새로운 폴더 이름 : 오늘 + 년 + 월 + 일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println(homedir);
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdir();//새로운 폴더를 생성
			}
			//파일명이 중복되지 않게 난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			/** 확장자 구하기 시작 */
			int index = fileName.lastIndexOf(".");
			//문자열에서 특정 문자열의 위치 값(index)를 반환
			//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			//lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			//(파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/** 확장자 구하기 끝 */
			
			//새로운 파일명 구하기
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);
			
			//오라클 DB에 저장될 파일명 구하기
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			return fileDBName;
		}
		
		//이벤트 삭제하기
		@PostMapping("EventDeleteAction.eve")
		   public String EventDeleteAction(int num, HttpServletResponse response) throws Exception{
		      boolean usercheck = eventservice.isEventWriter(num);
		      
		      //비밀번호 일치하지 않는 경우
		      if(usercheck == false) {
		         response.setContentType("text/html;charset=utf-8");
		         PrintWriter out = response.getWriter();
		         out.println("<script>");
		         out.println("alert('비밀번호가 다릅니다.');");
		         out.println("history.back();");
		         out.println("</script>");
		         out.close();
		         return null;
		      }
		      //비밀번호 일치하는 겨우 삭제처리 합니다.
		      int result=eventservice.eventDelete(num);
		      
		      //삭제 처리 실패한 경우
		      if(result ==0) {
		         System.out.println("게시판 삭제 실패");
		      }
		      //삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
		      System.out.println("게시판 삭제 성공");
		      response.setContentType("text/html;charset=utf-8");
		      PrintWriter out = response.getWriter();
		      out.println("<script>");
		      out.println("alert('삭제 되었습니다.');");
		      out.println("location.href='EventList.eve';");
		      out.println("</script>");
		      out.close();
		      return null;
		   }
		
		//파일 다운 받기
		@GetMapping("EventFileDown.eve")
		   public void EventFileDown(String filename, HttpServletRequest request, String original, //이건 파라미터
		         HttpServletResponse response) throws Exception {
 

		      // 서블릿의 실행환경 정보를 담고 있는 객체를 리턴합니다.
		      ServletContext context= request.getSession().getServletContext();
     
		      String sFilePath = saveFolder + "/" + filename;
		      System.out.println(sFilePath);

		      byte b[] = new byte[4096];

		      // sFilePath에 있는 파일의 MimeType을 구해옵니다.
		      String sMimeType = context.getMimeType(sFilePath);
		      System.out.println("sMimeType>>>" + sMimeType);

		      if (sMimeType == null)
		         sMimeType = "application/octet-stream";

		      response.setContentType(sMimeType);

		      // - 이부분이 한글 파일명이 깨지는 것을 방지해줍니다.
		      String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		      System.out.println(sEncoding);

		      /*
		       * Content-Disposition: attachment: 브라우저는 해당 Content를 처리하지 않고,
		       */
		      response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);

		      // 프로젝트 속성 - Project-facets 에서 자바버전 1.8로 수정
		      try ( // 소괄호 쓰면 알아서 close해줌
		            // 웹브라우저로의 출력 스트림 생성합니다.
		            BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());

		            // sFilePath로 지정한 파일에 대한 입력 스트림을 생성합니다.
		            BufferedInputStream in = new BufferedInputStream(new FileInputStream(sFilePath));) // 여기 소괄호 쓰면 자동으로 닫아줌
		      {
		         int numRead;
		         // read(b,0,b.length) : 바이트 배열 b의 0번부터 b.length
		         // 크기만큼 읽어옵니다.
		         while ((numRead = in.read(b, 0, b.length)) != -1) {// 읽을 데이터가 존재하지 않을때 까지
		            // 바이트 배열 b의 0번 부터 numRead크기 만큼 브라우저로 출력
		            out2.write(b, 0, numRead);
		         }
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
		      
		   }
	
}
