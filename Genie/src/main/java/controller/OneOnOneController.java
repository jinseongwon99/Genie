package controller;

import java.io.Console;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import dao.AdminDao;
import dao.MemberDao;
import dao.OneOnOneDao;
import dao.OrderDao;
import model.IndiMember;
import model.OneOnOne;
import model.OrderLog;
import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;
import paging.Paging;

@Controller
@RequestMapping("/board/oneOnOne/")
public class OneOnOneController { // 1대1 문의 게시판 controller

	@Autowired
	OneOnOneDao oneDao;
	HttpSession session;
	HttpServletRequest request;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	OrderDao orderDao;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}

	// 페이징 처리 메소드
	public Paging paging(int page, int recordSize, int onePage, int allData) {
		Paging paging = new Paging(page, recordSize, onePage, allData);
		return paging;
	}

	// 1대1 문의 게시판 - 질문 폼 (main)
	@RequestMapping("alert")
	public View alert() throws Exception {

		return new InternalResourceView("/WEB-INF/view/view");
	}

	// 1대1 문의 게시판 - 질문 폼 (main)
	@RequestMapping("inquiryForm")
	public String inquiryForm(Model model) throws Exception {
		
		// 1. 로그인정보 가져오기
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {

			String msg = "로그인이 필요한 서비스 입니다.";
			String url = "/member/login";

			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return "alert";
		}
		
		IndiMember member = memberDao.oneMember(userid); 
		
		// userid별 주문번호 리스트 출력 
		List<OrderLog> orderLog = orderDao.orderLogList(userid);
		
		model.addAttribute("member", member);
		model.addAttribute("orderLog", orderLog);

		return "view/board/boardInquiry";
	}

	// 1대1 문의 질문 등록
	@RequestMapping("inquiryPro")
	public String inquiryPro() throws Exception {

		Inquiry inquiry = new Inquiry();

		String userid = (String) session.getAttribute("userid");
		if (userid == null) {

			String msg = "로그인이 필요한 서비스 입니다.";
			String url = "/member/login";

			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return "alert";
		}

		inquiry.setUserId(userid);
		inquiry.setCategory(request.getParameter("category"));
		inquiry.setOrderId(request.getParameter("orderId"));
		inquiry.setTitle(request.getParameter("title"));
		inquiry.setContent(request.getParameter("content"));

		String msg = "문의 등록 실패";
		String url = "inquiryForm";

		int num = oneDao.insertInquiry(inquiry);

		if (num > 0) {
			msg = "문의 등록 성공";
			url = "list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// 1대1 문의 내역 페이지
	@RequestMapping("list")
	public String list(@RequestParam(name = "page", defaultValue = "1") int page, String fromDate, String toDate, String replyYn, Model model) throws Exception {

		// 관리자 paging 값 설정
		Paging paging = null;

		// 1. 로그인정보 가져오기
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {

			String msg = "로그인이 필요한 서비스 입니다.";
			String url = "/member/login";

			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return "alert";
		}


		// 2. null값 체크 + 데이터 조회
		List<OneOnOne> list = new ArrayList<>();
		if (fromDate == null || toDate == null) {

			// toDate 를 현재날짜로
			LocalDate currentDate = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String toDate1 = currentDate.format(formatter);

			// fromDate를 1년전 날짜로
			LocalDate minusDate = currentDate.minusYears(1);
			String fromDate1 = minusDate.format(formatter);

			model.addAttribute("toDate", toDate1);
			model.addAttribute("fromDate", fromDate1);

			// 각 날짜값 따로 저장
			model.addAttribute("fromYear", fromDate1.substring(0, 4));
			model.addAttribute("fromMonth", fromDate1.substring(5, 7));
			model.addAttribute("fromDay", fromDate1.substring(8, 10));

			model.addAttribute("toYear", toDate1.substring(0, 4));
			model.addAttribute("toMonth", toDate1.substring(5, 7));
			model.addAttribute("toDay", toDate1.substring(8, 10));

			return "view/board/inquiryRedirect";

		} else {

			// 각 날짜값 따로 저장
			model.addAttribute("fromYear", fromDate.substring(0, 4));
			model.addAttribute("fromMonth", fromDate.substring(5, 7));
			model.addAttribute("fromDay", fromDate.substring(8, 10));

			model.addAttribute("toYear", toDate.substring(0, 4));
			model.addAttribute("toMonth", toDate.substring(5, 7));
			model.addAttribute("toDay", toDate.substring(8, 10));

			if (replyYn == null || replyYn.isEmpty()) {
				
				if (session.getAttribute("admin") == "1") {	// 관리자 일 경우 -> 전체 회원 조회 
					
					paging = paging(page, 10, 5, adminDao.selectInquriyAdminAllCount(fromDate, toDate));
					list = adminDao.selectInquiryAll(fromDate, toDate, paging);
					
				} else {
					list = oneDao.selectInquiryAll(userid, fromDate, toDate);
				}
			} else {	// 답변여부값이 있을 경우 
				
				if (session.getAttribute("admin") == "1") {	// 관리자 -> 전체회원 조회 
					paging = paging(page, 10, 5, adminDao.selectInquriyAdminCount(fromDate, toDate, replyYn));
					list = adminDao.selectInquiryOptions(fromDate, toDate, paging, replyYn);
				} else {
					list = oneDao.selectInquiry(userid, fromDate, toDate, replyYn);
				}
			}
		}

		// 3. 조회값 저장
		model.addAttribute("inquiryList", list);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("replyYn", replyYn);
		model.addAttribute("paging", paging);

		return "view/board/boardInquiryList";
	}

	// 1대1 문의 답변 내역 페이지
	@RequestMapping("replyList")
	public String replyList(@RequestParam(name = "page", defaultValue = "1") int page, Model model) throws Exception {

		// 이벤트 paging 값 설정
		Paging paging = paging(page, 5, 5, oneDao.selectInquriyResponseCount());

		// Dao
		List<Inquiry> inquiryList = oneDao.selectPageInquiry(paging);

		// model에 paging 값, 현재페이지 출력결과 저장
		model.addAttribute("paging", paging);
		model.addAttribute("inquiryList", inquiryList);

		return "view/board/boardReplyList";
	}

	// 1대1 답변 작성 form
	@RequestMapping("replyForm")
	public String replyForm(@RequestParam(name = "page") int page, @RequestParam(name = "inquiryid") int inquiryid,
			Model model) throws Exception {

		// 이벤트 paging 값 설정
		Paging paging = paging(page, 5, 5, oneDao.selectInquriyResponseCount());

		// inquiry 값 가져오기
		Inquiry inquiry = oneDao.selectInquriyId(inquiryid);

		// 저장
		model.addAttribute("paging", paging);
		model.addAttribute("inquiry", inquiry);

		return "view/board/writeReply";
	}

	// 1대1 문의 답변 등록 - Pro
	@RequestMapping("replyPro")
	public String replyPro(Reply reply, Model model) throws Exception {

		// inquiry 답변 여부 1로 변경
		int num1 = oneDao.updateInquiry(reply.getInquiryId());

		// 답변 등록
		int num2 = oneDao.insertReply(reply);

		model.addAttribute("reply", reply);

		String msg = "답변 등록 실패";
		String url = "replyList";

		if (num1 > 0 && num2 > 0) {
			msg = "답변 등록 성공";
			url = "replyList";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

}
