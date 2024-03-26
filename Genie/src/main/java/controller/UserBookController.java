package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import dao.AdminDao;
import dao.BookMybatisDao;
import dao.MemberDao;
import dao.UserBookDao;
import model.Book;
import model.IndiMember;
import model.Member;
import model.Point;
import model.Search;
import paging.Paging;

@Controller
@RequestMapping("/userBook/")
public class UserBookController { // 개인 중고 도서 조회 controller
	
	HttpSession session;
	HttpServletRequest request;

	@Autowired
	UserBookDao userBookDao;
	
	@Autowired
	BookMybatisDao bookDao;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}

	// 페이징 처리 메소드
	public Paging paging(int page, int recordSize, int onePage, int allData) {
		Paging paging = new Paging(page, recordSize, onePage, allData);
		return paging;
	}

	// 관리자 게시판 - 도서 정보 관리
	@RequestMapping("book")
	public String book(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "key", defaultValue = "") String key,
			@RequestParam(name = "type", defaultValue = "") String type, Search search, Model model) throws Exception {

		Paging paging = null;
		List<Book> bookList = null;

		String userid = (String) session.getAttribute("userid");
		if(userid==null) {
			String msg = "로그인해주세요.";
			String url = "/member/login";
			request.setAttribute("msg", msg);
	        request.setAttribute("url", url);
	        return "alert";
		}
		
		// 페이지를 선택했을 때 파라미터값으로 키워드와 category 값 전달
		if (!key.equals("")) {
			search.setSearchKeyword(key);
		}

		if (!type.equals("")) {
			search.setSearchType(type);
		}

		paging = paging(page, 5, 5, userBookDao.selectBookOptionCount(search, userid));
		bookList = userBookDao.selectBookSearchPaging(paging, search, userid);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("bookList", bookList);
		model.addAttribute("search", search);


		// 이벤트 게시판 paging값 설정
		return "member/userBookList";
	}

	// 책 삭제 
	@RequestMapping("bookDeletePro")
	public String bookDeletePro(int booknum, Model model) throws Exception {

		Book book = bookDao.oneBook(booknum);

		String msg = "삭제에 실패하였습니다.";
		String url = "/book/indexmanager?booknum=" + booknum;

		int count = bookDao.bookDelete(booknum);

		msg = "삭제에 성공하였습니다.";
		url = "/userBook/book";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";

	}

}
