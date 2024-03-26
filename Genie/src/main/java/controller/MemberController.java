package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BookMybatisDao;
import dao.CorpMemberDao;
import dao.MemberDao;
import dao.OneOnOneDao;
import dao.OrderDao;
import model.CorpMember;
import model.IndiMember;
import model.OneOnOne;
import model.Order;
import model.Point;
import model.Review;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberDao imd;
	@Autowired
	BookMybatisDao bd;
	@Autowired
	OrderDao od;
	
	@Autowired
	OneOnOneDao oneDao;
	
	@Autowired
	CorpMemberDao cmd;
	
	HttpSession session;
	HttpServletRequest request;
	
	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}
	
	@RequestMapping("index")
	public String index() throws Exception{
		return"member/index";
	}
	
	
	/* 일반, 개인회원 */	
	@RequestMapping("join")
	public String join() throws Exception{
		return"member/join";
	}

	@RequestMapping("joinPro")
	public String joinPro(IndiMember mem) throws Exception{
       
		System.out.println(mem);
		int num = imd.insertindiMember(mem);
		String msg = "저장했습니다.";
		String url = "/member/login";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return"alert";
	} 
	
	//회원정보
	@RequestMapping("memberInfo")
	public String memberInfo() throws Exception{
		String login = (String) session.getAttribute("userid");
		if(login==null) {
			String msg = "로그인 해주세요!";
			String url = "/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return"alert";
		}
		
		IndiMember mem = imd.oneMember(login);
		int totalpoint = imd.accPoint(login);
		request.setAttribute("totalpoint", totalpoint);
		request.setAttribute("mem", mem);
		return"member/memberInfo";
	}

	//로그인
	@RequestMapping("login")
	public String login() throws Exception{
		return"member/login";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(String userid, String pass) throws Exception{
		IndiMember mem = imd.oneMember(userid);
		String msg = "아이디를 확인하세요";
		String url = "/member/login";
		if(mem != null) {//id 존재
		 	if(pass.equals(mem.getPass())){//login ok
		 		
		 		// 01.26 수정 - 관리자 로그인시 
		 		if (mem.getAdmin().equals("1")) {
		 			session.setAttribute("admin", "1");
		 		}
		 		
		 		String bday = (bd.getBirth(userid)).substring(0, 4);
		    	int birthYear = Integer.parseInt(bday);
		    	Calendar now = Calendar.getInstance();
		    	int currentYear = now.get(Calendar.YEAR);
		    	int age = (currentYear - birthYear + 1);
		    	session.setAttribute("userage",age);
		 		
		 		session.setAttribute(msg, url);
		 		session.setAttribute("userid",userid);
		 		msg = mem.getName() + "님이 로그인하셨습니다";
		 		url = "/book/main";
		 	} else {
		 		msg = "비밀번호를 확인하세요";
		 	}
		}
		
		List<Order> li = od.cartList(userid);
		if(!li.isEmpty()) {
			int cartCount = od.cartCount(userid);
			
			session.setAttribute("cartCount", cartCount);
			System.out.println(cartCount);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	} 
	
	@RequestMapping("logout")
	public String logout() throws Exception{
		
		session.invalidate();
		request.setAttribute("msg", "logout했습니다.");
		request.setAttribute("url", "/book/main");

		return"alert";
	}
	
	
	
	
	//회원정보수정
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm() throws Exception{
		String login = (String) session.getAttribute("userid");
		IndiMember mem = imd.oneMember(login);
		request.setAttribute("mem", mem);
		return "member/memberUpdateForm";
	}
	
	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(IndiMember mem) throws Exception{
		String login = (String) session.getAttribute("userid");
		
		IndiMember memdb = imd.oneMember(login);
		String msg = "변경 되지 않았습니다.";
		String url = "/member/memberUpdateForm";

		if(memdb != null){
			if(memdb.getPass().equals(mem.getPass())){ 
				msg = "변경되었습니다.";
				imd.updateIndimember(mem);
				url ="/member/memberInfo";
				
			} else {
				msg ="비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	//계정 삭제
	@RequestMapping("memberDeleteForm")
	public String memberDeleteForm() throws Exception{
		return"member/memberDeleteForm";
	}
	
	@RequestMapping("memberDeletePro")
	public String memberDeletePro(String pass) throws Exception{	
		String login = (String) session.getAttribute("userid");
		IndiMember memdb = imd.oneMember(login);
		String msg = "탈퇴되지 않았습니다.";
		String url = "/member/memberDeleteForm";
		if(memdb != null){
			if(memdb.getPass().equals(pass)){
				msg = "탈퇴되었습니다.";
				imd.deleteMember(login);
				session.invalidate();
				url = "/book/main";
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	//비밀번호 변경
	@RequestMapping("memberPassForm")
	public String memberPassForm() throws Exception{
		return"member/memberPassForm";
	}
	
	@RequestMapping("memberPassPro")
	public String memberPassPro(String pass, String chgpass) throws Exception{
		String login = (String) session.getAttribute("userid");
		IndiMember memdb = imd.oneMember(login);
		String msg = "비밀번호 변경 실패했습니다.";
		String url = "/member/memberPassForm";
		if(memdb != null){
			if(memdb.getPass().equals(pass)){
				imd.passMember(login, chgpass);
				msg = login + "님의 비밀번호가 변경되었습니다.";
				url = "/member/index";
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	
	//아이디찾기
	@RequestMapping("findIdForm")
	public String findIdForm() throws Exception{
		return"member/findIdForm";
	}
	
	@RequestMapping("findIdPro")
	public String findIdPro(String name, String email) throws Exception{
		System.out.println(name +":"+email);
		IndiMember mem = imd.findId(name, email);
		String msg = "입력 값을 확인하세요.";
		String url = "/member/findIdForm";
		if(mem != null) {
		 	if(name.equals(mem.getName()) && email.equals(mem.getEmail())){
		 		msg = "아이디는 [" + mem.getUserid() + "]입니다.";
		 		url = "/member/login";
		 	} else {
		 		msg = "가입된 정보가 없습니다.";
		 	}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return"alert";
	} 
	
	//비번찾기
	@RequestMapping("findPassForm")
	public String findPassForm() throws Exception{
		return"member/findPassForm";
	}
	
	// 가입된 아이디와 이메일 일치하면 비밀번호 이메일로 전송
	@RequestMapping("findPassPro")
	public String findPassPro(String userid, String email) throws Exception{
		IndiMember mem = imd.findPass(userid, email);
		String msg = "입력 값을 확인하세요.";
		String url = "/member/findPassForm";
		if(mem != null) {
		 	if(userid.equals(mem.getUserid())&& email.equals(mem.getEmail())){
		 		//session.setAttribute("userid", userid);
		 		msg = mem.getEmail() + "로 임시 비밀번호가 전송되었습니다.";
		 		url = "/member/login";
		 	} else {
		 		msg = "가입된 정보가 없습니다.";
		 	}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return"alert";
	} 
	
	
	
	
	
	//아이디 중복확인

	
	
	/* 단체, 법인회원 */
	
	//회원가입
	@RequestMapping("joincorp")
	public String joincorp() throws Exception{
		return"member/joincorp";
	}

	@RequestMapping("joincorpPro")
	public String joinPro(CorpMember mem) throws Exception{

		System.out.println(mem);
		int num = cmd.insertCorpMember(mem);
		String msg = "저장했습니다.";
		String url = "/view/login.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return"alert";
	} 
	
	//회원 정보
	@RequestMapping("membercorpInfo")
	public String membercorpInfo() throws Exception{
		String login = (String) session.getAttribute("userid");
		CorpMember mem = cmd.oneMember(login);
		request.setAttribute("mem", mem);
		return"member/membercorpInfo";
	}
	
	//로그인
	@RequestMapping("logincorp")
	public String logincorps() throws Exception{
		return"member/logincorp";
	}
	
	@RequestMapping("logincorpPro")
	public String logincorpPro(String userid, String pass) throws Exception{
		CorpMember mem = cmd.oneMember(userid);
		String msg = "아이디를 확인하세요";
		String url = "/member/logincorp";
		if(mem != null) {
		 	if(pass.equals(mem.getPass())){
		 		session.setAttribute("userid",userid);
		 		msg = mem.getName() + "님이 로그인하셨습니다";
		 		url = "/member/index";
		 	} else {
		 		msg = "비밀번호를 확인하세요";
		 	}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return"alert";
	} 

	
	
	//회원 정보 변경
	@RequestMapping("membercorpUpdateForm")
	public String membercorpUpdateForm() throws Exception{
		String login = (String) session.getAttribute("userid");
		CorpMember mem = new CorpMember();
		request.setAttribute("mem", mem);
		return "member/membercorpUpdateForm";
	}
	
	@RequestMapping("membercorpUpdatePro")
	public String membercorpUpdatePro(CorpMember mem) throws Exception{
		String login = (String) session.getAttribute("userid");
		
		CorpMember memdb = cmd.oneMember(login);
		String msg = "변경 되지 않았습니다.";
		String url = "/member/membercorpUpdateForm";

		if(memdb != null){
			if(memdb.getPass().equals(mem.getPass())){ 
				msg = "변경되었습니다.";
				cmd.updateCorpMember(mem);
				url ="/member/membercorpInfo";
				
			} else {
				msg ="비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	//계정 삭제
	@RequestMapping("membercorpDeleteForm")
	public String membercorpDeleteForm() throws Exception{
		return"member/membercorpDeleteForm";
	}
	
	
	
	@RequestMapping("membercorpDeletePro")
	public String membercorpDeletePro(String pass) throws Exception{	
		String login = (String) session.getAttribute("userid");
		CorpMember memdb = cmd.oneMember(login);
		String msg = "탈퇴되지 않았습니다.";
		String url = "/member/membercorpDeleteForm";
		if(memdb != null){
			if(memdb.getPass().equals(pass)){
				msg = "탈퇴되었습니다.";
				cmd.deleteMember(login);
				session.invalidate();
				url = "/member/index";
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	//비밀번호 변경
	@RequestMapping("membercorpPassForm")
	public String membercorpPassForm() throws Exception{
		return"member/membercorpPassForm";
	}
	
	@RequestMapping("membercorpPassPro")
	public String membercorpPassPro(String pass, String chgpass) throws Exception{
		String login = (String) session.getAttribute("userid");
		CorpMember memdb = cmd.oneMember(login);
		String msg = "비밀번호 변경 실패했습니다.";
		String url = "/member/membercorpPassForm";
		if(memdb != null){
			if(memdb.getPass().equals(pass)){
				cmd.passMember(login, chgpass);
				msg = login + "님의 비밀번호가 변경되었습니다.";
				url = "/member/index";
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return"alert";
	}
	
	// 1대1 문의 내역 페이지
	@RequestMapping("list")
	public String list(String fromDate, String toDate, String replyYn, Model model) throws Exception {

		// 1. 로그인정보 가져오기
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			userid = "";
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

			return "view/board/inquiryRedirect1";

		} else {

			// 각 날짜값 따로 저장
			model.addAttribute("fromYear", fromDate.substring(0, 4));
			model.addAttribute("fromMonth", fromDate.substring(5, 7));
			model.addAttribute("fromDay", fromDate.substring(8, 10));

			model.addAttribute("toYear", toDate.substring(0, 4));
			model.addAttribute("toMonth", toDate.substring(5, 7));
			model.addAttribute("toDay", toDate.substring(8, 10));

			if (replyYn == null || replyYn.isEmpty()) {
				list = oneDao.selectInquiryAll(userid, fromDate, toDate);

			} else {
				list = oneDao.selectInquiry(userid, fromDate, toDate, replyYn);
			}
		}

		// 3. 조회값 저장
		model.addAttribute("inquiryList", list);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", toDate);
		model.addAttribute("replyYn", replyYn);

		return "member/boardInquiryList";
	}
	
	
	@RequestMapping("pointLog")
	public String pointLog() throws Exception{
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			userid = "";
		}
		List<Point> li = imd.pointLogList(userid);
		request.setAttribute("li", li);
		
		int point = imd.calcPoint(userid);
		int totalpoint = imd.accPoint(userid);
		request.setAttribute("point", point);
		request.setAttribute("totalpoint", totalpoint);
		
		return "member/pointLog";
	}
	
	//내가 쓴 리뷰
	@RequestMapping("myReview")
	public String myReview() throws Exception{
		String userid = (String) session.getAttribute("userid");
		
		List<Review> li = imd.myReview(userid);
		request.setAttribute("li", li);
		
		return "member/myReviewList";
	}
}