package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.EventDao;
import model.Event;
import model.Faq;
import paging.Paging;

@Controller
@RequestMapping("/board/event/")
public class EventController { // 이벤트 게시판 controller

	@Autowired
	EventDao eventDao;
	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}

	// 페이징 처리 메소드
	public Paging Paging(int page, int recordSize, int onePage, int allData) {
		Paging paging = new Paging(page, recordSize, onePage, allData);
		return paging;
	}

	// 이벤트 게시판 리스트
	@RequestMapping("main")
	public String main(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws Exception {

		// 이벤트 paging 값 설정
		Paging paging = Paging(page, 9, 5, eventDao.selectEventCount());

		// Dao
		List<Event> eventList = eventDao.selectPageEvent(paging);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("eventList", eventList);

		// 이벤트 게시판 paging값 설정
		return "view/board/boardEvent";
	}

	// 이벤트 작성
	@RequestMapping("writeForm")
	public String writeForm() throws Exception {

		// 파일

		return "view/board/writeEvent";

	}

	// 이벤트 작성
	@RequestMapping("writePro")
	public String writePro(MultipartHttpServletRequest request, Event event, String startdate, String enddate)
			throws Exception {

		// 배너 이미지 저장
		MultipartFile file1 = request.getFile("file1");
		if (file1 != null && !file1.isEmpty()) {
			String fileDir1 = request.getServletContext().getRealPath("/image/event/banner/");
			file1.transferTo(new File(fileDir1 + file1.getOriginalFilename()));
		}

		event.setImage(file1.getOriginalFilename());

		// 내용 이미지 저장
		MultipartFile file2 = request.getFile("file2");
		if (file2 != null && !file2.isEmpty()) {
			String fileDir2 = request.getServletContext().getRealPath("/image/event/content/");
			file2.transferTo(new File(fileDir2 + file2.getOriginalFilename()));
		}

		event.setContent(file2.getOriginalFilename());

		event.setStartDate(startdate);
		event.setEndDate(enddate);

		int num = eventDao.insertEvent(event);

		String msg = "이벤트 등록 실패";
		String url = "writeForm";

		if (num > 0) {
			msg = "이벤트 등록 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert1";
	}

	// 이벤트 게시판 리스트
	@RequestMapping("info")
	public String info(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "eventId") int eventId, Model model) throws Exception {

		// 공지사항 paging 값 설정
		Paging paging = Paging(page, 9, 5, eventDao.selectEventCount());

		// Dao
		Event event = eventDao.selectEventId(eventId);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("event", event);

		return "view/board/eventInfo";
	}

	// 이벤트 수정
	@RequestMapping("updateForm")
	public String updateForm(@RequestParam(name = "eventId") int eventId, Model model) throws Exception {

		// faqId 값으로 찾기
		Event event = eventDao.selectEventId(eventId);

		model.addAttribute("event", event);

		return "view/board/updateEvent";

	}

	// 이벤트 수정 Pro
	@RequestMapping("updatePro")
	public String updatePro(MultipartHttpServletRequest request, @RequestParam(name = "eventId") int eventId,
			Event event, Model model, String startdate, String enddate) throws Exception {

		// 기존 이미지값 가져오기 
		Event beforeEvent = eventDao.selectEventId(eventId); 
		event.setImage(beforeEvent.getImage());
		event.setContent(beforeEvent.getContent());
		
		// 새 이미지 저장 
		MultipartFile file1 = request.getFile("file1");
		MultipartFile file2 = request.getFile("file2");
		
		if (file1 != null && !file1.isEmpty()) {
			String fileDir1 = request.getServletContext().getRealPath("/image/event/banner/");
			file1.transferTo(new File(fileDir1 + file1.getOriginalFilename()));
			event.setImage(file1.getOriginalFilename());
		} 
		
		if (file2 != null && !file2.isEmpty()) {
			String fileDir2 = request.getServletContext().getRealPath("/image/event/content/");
			file2.transferTo(new File(fileDir2 + file2.getOriginalFilename()));
			event.setContent(file2.getOriginalFilename());
		}

		event.setStartDate(startdate);
		event.setEndDate(enddate);

		int num = eventDao.updateEventId(event);

		String msg = "이벤트 수정 실패";
		String url = "main";

		if (num > 0) {
			msg = "이벤트 수정 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// 이벤트 삭제
	@RequestMapping("deletePro")
	public String deleteForm(@RequestParam(name = "eventId") int eventId) throws Exception {

		int num = eventDao.deleteEventId(eventId);

		String msg = "이벤트 삭제 실패";
		String url = "main";

		if (num > 0) {
			msg = "이벤트 삭제 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";

	}

}
