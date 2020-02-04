package kh.finalproject.studybook.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproject.studybook.service.EventCommentService;
import kh.finalproject.studybook.service.EventService;
import kh.finalproject.studybook.service.RoomService;
import kh.finalproject.studybook.domain.Event;
import kh.finalproject.studybook.domain.Event_comment;
import kh.finalproject.studybook.domain.Member;
import kh.finalproject.studybook.domain.Room;

@Controller
public class EventController {
		@Autowired
		private EventService eventservice;
		
		
		@Autowired
		private RoomService roomserivce;
		
		@Autowired
		private EventCommentService eventEvent_commentservice; 
		
		@Value("${savefolder4name}")
		private String saveFolder;

		//이벤트 등록 화면으로 이동!!
		@RequestMapping(value = "/registerEvent.eve")
		public ModelAndView event_write_view(ModelAndView mv, int mem_key) throws Exception{
			List<String> roomlist=roomserivce.getRoom_nameList();
			mv.addObject("mem_key", mem_key);
			mv.addObject("roomlist",roomlist);
			mv.setViewName("event/event_main");
			return mv;
		}//event_write view end
		
		//이벤트 등록하기
		@PostMapping(value = "EventAddAction.eve")
		public String event_write_ok(Event event, HttpServletRequest request, HttpServletResponse response) throws Exception{
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
		      
		    //String saveFolder=request.getSession().getServletContext().getRealPath("resources")+"/upload/";
			/*
			 * String saveFolder=
			 * "C:\\Users\\user1\\git\\final_project[0121]\\final_project\\studybook\\src\\main\\webapp\\resources\\upload/";
			 */
		      saveFolder="C:\\Users\\user1\\git\\0204_2\\final_project\\studybook\\src\\main\\webapp\\resources\\upload\\";

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
		    String content=event.getContent();
		    content = content.replace("\r\n", "<br>");
		    event.setContent(content);
			eventservice.insertEvent(event);
			return "redirect:event_list.eve";
		}//event_write_ok end
		
		//이벤트 리스트 보기
		@RequestMapping(value = "event_list.eve")
		public ModelAndView eventList(
				@RequestParam(value = "page", defaultValue = "1", required = false)int page, 
				ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
			try {
				//현재 세션에서 mem_key 가져오기
				Member member = (Member)session.getAttribute("member");
				int mem_key = member.getKey();
					
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
				//현재 mem_key 보내기
				mv.addObject("mem_key", mem_key);
				return mv;
			} catch (NullPointerException e) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
			    out.println("alert('로그인이 필요합니다.');");
			    out.println("location.href = 'login.mem';");
			    out.println("</script>");
			}
			return null;
		}//EventList.eve end
		
		//이벤트 게시글 보기
		@RequestMapping(value = "EventDetailAction.eve")
		public ModelAndView eventGetDetail(int event_num, ModelAndView mv, 
				HttpServletRequest request, HttpSession session) throws Exception {
			Event eventdata = eventservice.getEventDetail(event_num);
			//현재 세션에서 mem_key 가져오기
			Member member = (Member)session.getAttribute("member");
			int mem_key = member.getKey();
			System.out.println("현재 세션 사용자 = " + mem_key);
			//작성자 키 값 가져오기
			int key = eventservice.getEventWriterNum(event_num);			
			
			//작성자 가져오기
			String event_writer = eventservice.getEventWriter(event_num);
			System.out.println("게시글 작성자  = " + event_writer);
			
			if (eventdata == null) {
				System.out.println("상세보기 실패");
				mv.setViewName("redirect:eventList.eve");
				mv.addObject("url", request.getRequestURL());//위의 request는 어디에서 에러가 났는지 알려주기 위해서 넣는다.
				mv.addObject("message", "상세보기 실패입니다.");
			} else {
				System.out.println("상세보기 성공");				
				mv.setViewName("event/event_view");
				mv.addObject("eventdata", eventdata);
				mv.addObject("event_writer", event_writer);//게시글 작성자
				mv.addObject("mem_key", mem_key);//현재 mem_key(현재 사용자)
				mv.addObject("key", key);//게시글 작성자 key 값
			}				
			return mv;
		}//EventDetailAction.eve end
		
		//이벤트 수정 페이지 보기
		@RequestMapping(value = "EventModifyView.eve", method = RequestMethod.GET)
		public ModelAndView EventModify(int event_num, ModelAndView mv, HttpServletRequest request, HttpSession session) 
				throws Exception {
			Event eventdata = eventservice.getEventDetail(event_num);
			Member member = (Member)session.getAttribute("member");	
			String event_writer = eventservice.getEventWriter(event_num);
			int mem_key = member.getKey();
			List<String> roomlist=roomserivce.getRoom_nameList();
			if(eventdata == null) {
				System.out.println("(수정)상세보기 실패");
				mv.setViewName("redirect:eventList.eve");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "(수정)상세보기 실패입니다.");
			} else {
				System.out.println("(수정)상세보기 성공");
				mv.addObject("eventdata", eventdata);
				mv.addObject("event_writer", event_writer);
				mv.addObject("mem_key", mem_key);
				mv.addObject("mem_key", mem_key);
				mv.addObject("roomlist",roomlist);				
				mv.setViewName("event/event_modify");
			}
			return mv;
		}//EventModifyView.eve end
		
		//이벤트 수정하기
		@PostMapping("EventModifyAction.eve")
		public ModelAndView EventModifyAction(Event event, 
				ModelAndView mv, HttpServletRequest request, HttpServletResponse response) 
						throws Exception{
			MultipartFile uploadfile = event.getEventPic_uploadfile();
	
		/*
		 * String saveFolder =
		 * request.getSession().getServletContext().getRealPath("resources") +
		 * "/upload/";
		 */
			
			if (uploadfile != null && !uploadfile.isEmpty()) {//파일을 변경한 경우
					System.out.println("파일 변경한 경우");
					String fileName = uploadfile.getOriginalFilename();//원래 파일명을 가져오기
					event.setEventPic_originalfile(fileName);
					
					String fileDBName = fileDBName(fileName, saveFolder);
					
					//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
					uploadfile.transferTo(new File(saveFolder + fileDBName));
					
					//바뀐 파일명으로 저장
					event.setEvent_pic(fileDBName);
					System.out.println(fileDBName);
			}
			String content=event.getContent();
		    content = content.replace("\r\n", "<br>");
		    event.setContent(content);
			//DAO에서 수정 메서드를 호출하여 수정합니다.
			int result = eventservice.eventModify(event);
			
			//수정에 실패한 경우
			if (result == 0) {
				System.out.println("이벤트 글 수정 실패");
				mv.setViewName("redirect:EventModifyView.eve");
				mv.addObject("url", request.getRequestURL());
				mv.addObject("message", "이벤트 글 수정 실패");
			} else {//수정 성공한 경우
				System.out.println("이벤트 글 수정 완료");
			    PrintWriter out = response.getWriter();
			    out.println("<script>");
			    out.println("alert('수정 되었습니다.');");
			    out.println("</script>");
				
				String url = "redirect:EventDetailAction.eve?event_num=" + event.getEvent_num();
				
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
			System.out.println("homedir = " + homedir);
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
		@RequestMapping("EventDeleteAction.eve")
		   public String EventDeleteAction(int event_num, HttpServletResponse response) throws Exception{
		      int result=eventservice.eventDelete(event_num);
		      System.out.println("DeleteAction");
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
		      out.println("location.href='event_list.eve';");
		      out.println("</script>");
		      out.close();
		      return null;
		   }
		
		//반려
		@RequestMapping(value = "AdminEvent.eve")
		public String AdminEvent(int event_num, HttpServletResponse response) throws Exception{
			int result = eventservice.AdminEvent(event_num);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(result ==0) {
				out.println("<script>");
			    out.println("alert('이벤트 반려를 실패했습니다.');");
			    out.println("location.href='AdminEventList.eve';");
			    out.println("</script>"); 
		      }
		    out.println("<script>");
		    out.println("alert('이벤트가 반려되었습니다.');");
		    out.println("location.href='AdminEventList.eve';");
		    out.println("</script>"); 
			return null;
		}
		
		//승인
		@RequestMapping(value = "AdminEvent2.eve")
		public String AdminEvent2(int event_num, HttpServletResponse response) throws Exception{
			int result = eventservice.AdminEvent2(event_num);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(result ==0) {
				out.println("<script>");
			    out.println("alert('이벤트 승인이 실패했습니다.');");
			    out.println("location.href='AdminEventList.eve';");
			    out.println("</script>"); 
		      }
		    out.println("<script>");
		    out.println("alert('이벤트가 승인되었습니다.');");
		    out.println("location.href='AdminEventList.eve';");
		    out.println("</script>"); 
			return null;
		}
		
		@RequestMapping(value = "AdminEventList.eve")
		public ModelAndView AdminEventList(HttpServletResponse response, ModelAndView mv,
				@RequestParam(value = "page", defaultValue = "1", required = false)int page, 
				@RequestParam(value = "limit", defaultValue = "10", required = false)int limit,
				@RequestParam(value = "search_field", defaultValue = "-1") int index,
				@RequestParam(value = "search_word", defaultValue = "")String search_word) throws Exception{
			List<Event> list = null;
			limit = 10;
				
			list = eventservice.getSearchList(index, search_word, page, limit);
			int listcount = eventservice.getEventListCount(index, search_word);// 총 리스트를 받아옴
			
			int maxpage = (listcount + limit - 1)/limit;
			int startpage = ((page - 1)/10) * 10 + 1;
			int endpage = startpage + 10 - 1;
		
			if (endpage > maxpage){endpage = maxpage;}		
		
			//List<Event> eventlist = eventservice.getEventList2(page, limit);
			mv.setViewName("admin/event_modify");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("eventlist", list);
			mv.addObject("limit", limit);
			mv.addObject("search_field", index);
			mv.addObject("search_word", search_word);
			return mv;			
		}
		
		
		/**Event_comment 관련 시작*/
		//댓글 가져오기
		@ResponseBody
		@RequestMapping("Event_commentList.eve")
		public Object Event_commentList(int event_num, HttpServletRequest request, HttpSession session) throws Exception {
			System.out.println("불러올 댓글 event_num : " + event_num);
			List<Event_comment> list = eventEvent_commentservice.getEvent_commentList(event_num);
			Map<String, Object> obj  = new HashMap<String, Object>();
			obj.put("list", list);
			//obj.put("commentWriter", commentWriter);
			return obj;
		}
			
		//댓글 추가하기
		@PostMapping(value = "Event_commentAdd.eve")
		public void Event_commentAdd(Event_comment co, HttpServletResponse response) throws Exception{
			System.out.println("co.getEvent_num() = " + co.getEvent_num());
			int ok = eventEvent_commentservice.Event_commentsInsert(co);
			response.getWriter().print(ok);
		}
		
		//댓글 삭제하기
		@RequestMapping("Event_commentDelete.eve")
		public void Event_commentsDelete(int event_com_num, HttpServletResponse response) throws Exception {
			int ok = eventEvent_commentservice.Event_commentsDelete(event_com_num);
			response.getWriter().print(ok);
		} 
		
		//댓글 업데이트하기
		@RequestMapping("Event_commentUpdate.eve")
		public void Event_commentsUpdate(
				@RequestParam(value = "event_num", defaultValue = "1", required = false)int event_num, 
				@RequestParam(value = "event_com_num", defaultValue = "1", required = false)int event_com_num, 
				@RequestParam(value = "com_content", defaultValue = "1", required = false)String com_content, 
				HttpServletResponse response) throws Exception {
			Map<Object, Object> obj = new HashMap<Object, Object>();
			obj.put("event_num", event_num);
			obj.put("event_com_num", event_com_num);
			obj.put("com_content", com_content);
			
			int ok = eventEvent_commentservice.Event_commentsUpdate(obj);
			response.getWriter().print(ok);
		} 
		
		//대댓글 달기
		@RequestMapping("Event_commentReply.eve")
		public void Event_commentReply(Event_comment co, HttpServletResponse response) throws Exception {
			int ok = eventEvent_commentservice.Event_commentReply(co);
			response.getWriter().print(ok);
			
		}
		
		//이 달의 이벤트
		@RequestMapping(value="eventList.eve")
		public ModelAndView MonthEventList(
				@RequestParam(value = "page", defaultValue = "1", required = false) int page,
				ModelAndView mv) {
			// 한 화면에 출력할 room 갯수
			int limit = 9;

			SimpleDateFormat format1 = new SimpleDateFormat ( "MM");
			Date date = new Date();
			String today = format1.format(date);
			
			// 총 room 리스트 갯수
			int listcount = eventservice.getMonthEventListCount(today);

			// 총 room 페이지 수
			int maxpage = (listcount + limit - 1) / limit;

			// 시작 페이지(1, 6, 11, ...)
			int startpage = ((page - 1) / 5) * 5 + 1;

			// 마지막 페이지(5, 10, 15, ...)
			int endpage = startpage + 5 - 1;

			if (endpage > maxpage)
				endpage = maxpage;
			
			List<Event> eventlist = eventservice.getMonthEventList(page, limit, today);
			
			mv.setViewName("event/eventMonthList");
			mv.addObject("page", page);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("list", eventlist);
			mv.addObject("limit", limit);
			return mv;
		}
		
		//ajax 이 달의 이벤트
		@ResponseBody
		@RequestMapping(value="getEventList.eve")
		public Object AjaxMonthEventList(
				@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
			// 한 화면에 출력할 room 갯수
			int limit = 9;
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "MM");
			Date date = new Date();
			String today = format1.format(date);
			
			// 총 room 리스트 갯수
			int listcount = eventservice.getMonthEventListCount(today);

			// 총 room 페이지 수
			int maxpage = (listcount + limit - 1) / limit;

			// 시작 페이지(1, 6, 11, ...)
			int startpage = ((page - 1) / 5) * 5 + 1;

			// 마지막 페이지(5, 10, 15, ...)
			int endpage = startpage + 5 - 1;

			if (endpage > maxpage)
				endpage = maxpage;
			
			List<Event> eventlist = eventservice.getMonthEventList(page, limit, today);
			
			Map<String, Object> obj = new HashMap<String, Object>();
			obj.put("page", page);
			obj.put("maxpage", maxpage);
			obj.put("startpage", startpage);
			obj.put("endpage", endpage);
			obj.put("listcount", listcount);
			obj.put("list", eventlist);
			obj.put("limit", limit);
			return obj;
		}

}