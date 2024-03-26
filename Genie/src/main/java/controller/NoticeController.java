package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.NoticeDao;
import model.Faq;
import model.Notice;
import model.Search;
import model.oneOnOneModel.Inquiry;
import paging.Paging;

@Controller
@RequestMapping("/board/notice/")
public class NoticeController { // 공지사항 게시판 controller

	@Autowired
	NoticeDao noticeDao;
	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}

	// 페이징 처리 메소드
	public Paging Paging(int page, int recordSize, int onePage, int allData) {
		Paging paging = new Paging(page, recordSize, onePage, allData);
		return paging;
	}

	// 공지사항 게시판 리스트
	@RequestMapping("main")
	public String main(@RequestParam(name = "page", defaultValue = "1") int page, Search search, Model model)
			throws Exception {

		List<Notice> noticeList = null;
		

		// 공지사항 paging 값 설정
		Paging paging;
		System.out.println(search);
		
		// 검색 키워드 확인
		if (search.getSearchKeyword() != null && search.getSearchKeyword().trim().length() != 0) {	// 검색 키워드가 있을 경우 
			
			if (search.getSearchType() != null && !search.getSearchType().isEmpty()) {		// searchType이 있을 경우
				
				paging = Paging(page, 5, 5, noticeDao.searchOptionNoticeCount(search));
				noticeList = noticeDao.searchOptionNotice(search, paging);
				
			} else {	// 전체 검색 (searchType 이 없을 때)
				
				paging = Paging(page, 5, 5, noticeDao.searchAllNoticeCount(search.getSearchKeyword()));
				noticeList = noticeDao.searchAllNotice(search.getSearchKeyword(), paging);
				
			}
			
		} else {	// 검색 키워드가 없을 경우 (전체 데이터 출력)
			
			// Dao
			paging = Paging(page, 5, 5, noticeDao.selectNoticeCount());
			noticeList = noticeDao.selectPageNotice(paging);
		}


		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("noticeList", noticeList);

		return "view/board/boardNotice";
	}

	// 공지사항 등록 form
	@RequestMapping("writeForm")
	public String writeForm() throws Exception {

		// 관리자 확인

		return "view/board/writeNotice";
	}

	// 공지사항 등록 Pro
	@RequestMapping("writePro")
	public String writePro(String title, String content) throws Exception {

		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContent(content);

		int num = noticeDao.insertNotice(notice);

		String msg = "공지사항 등록 실패";
		String url = "writeForm";

		if (num > 0) {
			msg = "공지사항 등록 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// 공지사항 게시글
	@RequestMapping("info")
	public String info(@RequestParam(name = "page", defaultValue = "1") int page, Model model,
			@RequestParam(name = "noticeid", defaultValue = "1") int noticeId) throws Exception {

		// 공지사항 paging 값 설정
		Paging paging = Paging(page, 5, 5, noticeDao.selectNoticeCount());

		// noticeId 값으로 데이터 찾기
		Notice notice = new Notice();
		notice = noticeDao.selectNoticeId(noticeId);

		// 찾은 데이터값 저장
		model.addAttribute("notice", notice);

		// 페이지값 저장 (목록보기 시 -> 기존 페이지로 이동하기 위해)
		model.addAttribute("paging", paging);

		return "view/board/noticeInfo";
	}

	// 공지사항 수정
	@RequestMapping("updateForm")
	public String updateForm(@RequestParam(name = "noticeId") int noticeId, Model model) throws Exception {

		// noticeId 값으로 데이터 찾기
		Notice notice = noticeDao.selectNoticeId(noticeId);

		model.addAttribute("notice", notice);

		return "view/board/updateNotice";
	}

	// 공지사항 수정 Pro
	@RequestMapping("updatePro")
	public String updatePro(@RequestParam(name = "noticeId") int noticeId, Notice notice, Model model)
			throws Exception {

		// 찾은 데이터 수정
		int num = noticeDao.updateNoticeId(notice);

		String msg = "공지사항 수정 실패";
		String url = "main";

		if (num > 0) {
			msg = "공지사항 수정 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// 공지사항 삭제
	@RequestMapping("deletePro")
	public String deleteForm(@RequestParam(name = "noticeId") int noticeId) throws Exception {

		int num = noticeDao.deleteNoticeId(noticeId);

		String msg = "공지사항 삭제 실패";
		String url = "main";

		if (num > 0) {
			msg = "공지사항 삭제 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";

	}

}
