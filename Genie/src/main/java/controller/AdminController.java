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
import dao.OrderDao;
import model.Book;
import model.IndiMember;
import model.Member;
import model.Order;
import model.OrderLog;
import model.Point;
import model.Search;
import paging.Paging;

@Controller
@RequestMapping("/admin/")
public class AdminController { // 관리자 게시판 controller

	@Autowired
	AdminDao adminDao;
	HttpSession session;
	HttpServletRequest request;

	@Autowired
	MemberDao memberDao;

	@Autowired
	BookMybatisDao bookDao;
	
	@Autowired
	OrderDao od;

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

	// 관리자 게시판 - 고객 정보 관리
	@RequestMapping("member")
	public String main(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "key", defaultValue = "") String key,
			@RequestParam(name = "type", defaultValue = "") String type, Search search, Model model) throws Exception {

		Paging paging = null;

		// 페이지를 선택했을 때 파라미터값으로 키워드와 category 값 전달
		if (!key.equals("")) {
			search.setSearchKeyword(key);
		}

		if (!type.equals("")) {
			search.setSearchType(type);
		}

		String category = search.getSearchType();
		String keyword = search.getSearchKeyword();

		List<Member> memberList = null;
		Map<String, List<Point>> logMap = new HashMap<>();

		// category 선택값 + Dao
		if (category == null || category.isEmpty()) { // 전체 카테고리 (아이디, 이름)
		
			if (keyword == null || keyword.isEmpty()) { // 키워드도 없을 경우
				paging = paging(page, 10, 5, adminDao.selectMemberAllCount());
				memberList = adminDao.selectAllPaging(paging);
			} else { // 키워드만 있을 경우
				paging = paging(page, 10, 5, adminDao.selectAllCateCount(search));
				memberList = adminDao.selectSearchAllPaging(paging, search);
			}

		} else { // 카테고리 선택 + 키워드
			
			paging = paging(page, 10, 5, adminDao.selectCountCate(search));
			memberList = adminDao.selectSearchPaging(paging, search);
		}
		
		for(Member m : memberList) {
			List<Point> pointList = memberDao.pointLogList(m.getUserid());
			logMap.put(m.getUserid(), pointList);
		}

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("memberList", memberList);
		model.addAttribute("logMap", logMap);
		model.addAttribute("search", search);

		// 이벤트 게시판 paging값 설정
		return "view/board/adminMember";
	}

	// 회원정보수정
	@RequestMapping("adminMemUpdateForm")
	public String memberUpdateForm(@RequestParam(name = "userid") String userid) throws Exception {

		IndiMember member = memberDao.oneMember(userid);

		request.setAttribute("member", member);

		return "/view/board/adminMemUpdateForm";
	}

	@RequestMapping("adminMemUpdatePro")
	public String adminMemUpdatePro(IndiMember mem) throws Exception {

		IndiMember memdb = memberDao.oneMember(mem.getUserid());
		String msg = "변경 되지 않았습니다.";
		String url = "/admin/member";

		if (session.getAttribute("admin").equals("1")) {
			msg = "변경되었습니다.";
			int num = memberDao.updateIndimember(mem);
			url = "/admin/member";
			if (num <= 0) {
				msg = "변경 되지 않았습니다.";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("adminMemDeletePro")
	public String memberDeletePro(@RequestParam(name = "userid") String userid) throws Exception {

		String msg = "탈퇴되지 않았습니다.";
		String url = "member";
		if (session.getAttribute("admin").equals("1")) {
			msg = "탈퇴되었습니다.";
			int num = memberDao.deleteMember(userid);

			if (num <= 0) {
				msg = "탈퇴되지 않았습니다.";
			}

		} else {
			msg = "관리자 전용";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert1";
	}

	// 관리자 게시판 - 도서 정보 관리
	@RequestMapping("book")
	public String book(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "key", defaultValue = "") String key,
			@RequestParam(name = "type", defaultValue = "") String type, Search search, Model model) throws Exception {

		Paging paging = null;

		// 페이지를 선택했을 때 파라미터값으로 키워드와 category 값 전달
		if (!key.equals("")) {
			search.setSearchKeyword(key);
		}

		if (!type.equals("")) {
			search.setSearchType(type);
		}

		paging = paging(page, 10, 5, adminDao.selectBookOptionCount(search));
		List<Book> bookList = adminDao.selectBookSearchPaging(paging, search);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("bookList", bookList);
		model.addAttribute("search", search);

		// 이벤트 게시판 paging값 설정
		return "view/board/adminBook";
	}

	@RequestMapping("Check")
	public String Check(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "key", defaultValue = "") String key,
			@RequestParam(name = "type", defaultValue = "") String type, Search search, Model model) throws Exception {

		Paging paging = null;

		// 페이지를 선택했을 때 파라미터값으로 키워드와 category 값 전달
		if (!key.equals("")) {
			search.setSearchKeyword(key);
		}

		if (!type.equals("")) {
			search.setSearchType(type);
		}

		paging = paging(page, 10, 5, adminDao.selectBookOptionCountCheck(search));
		List<Book> bookList = adminDao.selectBookSearchPagingCheck(paging, search);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("bookList", bookList);
		model.addAttribute("search", search);

		// 이벤트 게시판 paging값 설정
		return "view/board/adminCheck";
	}
	@RequestMapping("checkBook")
	public String checkbook(Book book, Model model) throws Exception {
		bookDao.checkBook(book);
		String msg = "상품등록을 했습니다.";
		String url = "/admin/Check";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";
	}

	// 책 삭제 
	@RequestMapping("bookDeletePro")
	public String bookDeletePro(int booknum, Model model) throws Exception {

		Book book = bookDao.oneBook(booknum);

		String msg = "삭제에 실패하였습니다.";
		String url = "/book/indexmanager?booknum=" + booknum;

		int count = bookDao.bookDelete(booknum);

		msg = "삭제에 성공하였습니다.";
		url = "/admin/book";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";

	}
	@RequestMapping("bookDeleteProcheck")
	public String bookDeleteProcheck(int booknum, Model model) throws Exception {

		Book book = bookDao.oneBook(booknum);

		String msg = "삭제에 실패하였습니다.";
		String url = "/book/indexmanager?booknum=" + booknum;

		int count = bookDao.bookDelete(booknum);

		msg = "삭제에 성공하였습니다.";
		url = "/admin/Check";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "alert";

	}
	
	
	@RequestMapping("adminOrderLog")
	public String adminOrderLog() throws Exception {
		List<OrderLog> li = od.getAllOrderLog();
		int LogCount = od.allLogListCount();
		
		request.setAttribute("li", li);
		request.setAttribute("logCount", LogCount);
		return "view/board/adminOrderLog";
	}
	
	@RequestMapping("adminOrderState")
	public String adminOrderState(String orderid, String state) throws Exception{
		orderid = request.getParameter("orderid");
		state = request.getParameter("state");
		
		int num = od.adminOrderLogState(orderid, state);
		int num2 = od.adminOrderInfoState(orderid, state);
		
		String msg = "주문번호 : "+orderid+" 의 상태를 " + state + "로 변경하였습니다.";
		String url = "/admin/adminOrderLog";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("adminOrderLogDetail")
	public String adminOrderLogDetail(String orderid) throws Exception { 
		//구매기록
		List<OrderLog> li = od.adminOrderDetail(orderid);
		List<OrderLog> li2 = od.adminOrderDetailInfo(orderid);
		int total = 0;
		
		total = od.adminOrderDetailTotal(orderid);
		
		request.setAttribute("total", total);
		request.setAttribute("li", li);
		request.setAttribute("li2", li2);
		
		return "view/board/adminOrderLogDetail";
	}
	@RequestMapping("adminOrderStateDetail")
	public String adminOrderStateDetail(String orderid) throws Exception{
		orderid = request.getParameter("orderid");
		String state = od.adminCheckOrderState(orderid);
		String nextState;
		if (state.equals("주문접수")) {
			nextState = "배송중";
		}
		else if (state.equals("배송중")) {
			nextState = "배송완료";
		}
		else {
			String msg = "주문번호 : "+orderid+" 의 상태가 [" + state + "]에서 변경불가능합니다.";
			String url = "/admin/adminOrderLogDetail?orderid="+orderid;
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
			
		
		int num = od.adminOrderLogState(orderid, nextState);
		int num2 = od.adminOrderInfoState(orderid, nextState);
		
		String msg = "주문번호 : "+orderid+" 의 상태를 [" + nextState + "](으)로 변경하였습니다.";
		String url = "/admin/adminOrderLogDetail?orderid="+orderid;
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
}
