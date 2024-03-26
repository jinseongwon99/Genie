package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import dao.BookMybatisDao;
import dao.EventDao;
import dao.NoticeDao;
import dao.OrderDao;
import model.Book;
import model.Cart;
import model.Event;
import model.Member;
import model.Notice;
import model.Review;
import model.Slang;

@Controller
@RequestMapping("/book/")
public class BookController {

	HttpSession session;

	@Autowired
	BookMybatisDao bd;
	HttpServletRequest req;
	
	@Autowired
	EventDao eventDao;
	@Autowired
	NoticeDao noticeDao;
	@Autowired
	OrderDao orderDao;
	
	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
		this.req = request;
	}

	@RequestMapping("addBookInput")
	public String addBookInput() throws Exception {

		return "book/addBookInput";
	}

	@RequestMapping("addBookPro")
	public String addBookPro(Book book) throws Exception {
		String msg = "추가하였습니다.";
		String url = "/book/addBookForm";

		int num = bd.addBook(book);
		if (num > 0) {
			msg = "추가하였습니다.";
			url = "/book/index";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "alert";
	}

	// 01.26 변경 : 메인화면 이벤트 배너 링크 이동 연결 작업 //
	@RequestMapping("main")
	public String index(String sortmap, String inventory) throws Exception {

		// 추가
		List<Event> eventList = eventDao.selectThree();
		req.setAttribute("eventList", eventList);

		List<Book> li = bd.newBookList();
		req.setAttribute("li", li);
		List<Book> li2 = bd.rankBookList(inventory);
		req.setAttribute("li2", li2);
		
		Notice nt = noticeDao.getOneNotice();
		int ntId = nt.getNoticeId();
		String ntTitle = nt.getTitle();
		//System.out.println(ntId);
		//System.out.println(ntTitle);
		session.setAttribute("ntId", ntId);
		session.setAttribute("ntTitle", ntTitle);

		return "book/main";
	}

	@RequestMapping("bookList")
	public String bookList(String pageNum, String sortmap, String category, String keyword) throws Exception {
		req.setAttribute("sortmap", sortmap);

		if (category != null) {// pageNum
			session.setAttribute("category", category);
		}
		if (keyword != null) {
	         String keyword2 = keyword.trim();
	         session.setAttribute("keyword", keyword2);
	    }

		category = (String) session.getAttribute("category");
		keyword = (String) session.getAttribute("keyword");
		

		session.setAttribute("pageNum", "1");
		if (pageNum != null) {// pageNum
			session.setAttribute("pageNum", pageNum);
		}

		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		int limit = 5;
		int pageInt = Integer.parseInt(pageNum);
		int bookCount = bd.bookCount(category, keyword);
		int bookNumber = bookCount - ((pageInt - 1) * limit);

		int bottomLine = 10;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (bookCount / limit) + (bookCount % limit == 0 ? 0 : 1);
		if (end > maxPage) {
			end = maxPage;
		}

		List<Book> li = bd.bookList(pageInt, limit, category, sortmap, keyword);

		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("start", start);
		req.setAttribute("end", end);
		req.setAttribute("maxPage", maxPage);
		req.setAttribute("pageInt", pageInt);
		req.setAttribute("bookNumber", bookNumber);
		req.setAttribute("bookCount", bookCount);
		req.setAttribute("keyword", keyword);
		req.setAttribute("li", li);
		System.out.println(session.getAttributeNames());
		return "book/bookList";
	}
	@RequestMapping("Bookcheck")
	public String Bookcheck(String pageNum, String sortmap,String bookstate) throws Exception {
		req.setAttribute("sortmap", sortmap);

		

		
		bookstate = (String) session.getAttribute("bookstate");
		

		session.setAttribute("pageNum", "1");
		if (pageNum != null) {// pageNum
			session.setAttribute("pageNum", pageNum);
		}

		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		int limit = 5;
		int pageInt = Integer.parseInt(pageNum);
		int bookCount = bd.checkCount(bookstate);
		int bookNumber = bookCount - ((pageInt - 1) * limit);

		int bottomLine = 10;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (bookCount / limit) + (bookCount % limit == 0 ? 0 : 1);
		if (end > maxPage) {
			end = maxPage;
		}

		List<Book> li = bd.Bookcheck(pageInt, limit, sortmap,bookstate);

		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("start", start);
		req.setAttribute("end", end);
		req.setAttribute("maxPage", maxPage);
		req.setAttribute("pageInt", pageInt);
		req.setAttribute("bookNumber", bookNumber);
		req.setAttribute("bookCount", bookCount);

		req.setAttribute("li", li);
		System.out.println(session.getAttributeNames());
		return "book/checkBook";
	}
	@RequestMapping("bookUpdateForm")
	public String bookUpdateForm(int booknum) throws Exception {
		Book book = bd.oneBook(booknum);
		req.setAttribute("book", book);
		return "book/bookUpdateForm";
	}

	@RequestMapping("bookUpdatePro")
	public String bookUpdatePro(@RequestParam("f") MultipartFile multipartFile, Book book) throws Exception {
		String path = req.getServletContext().getRealPath("/") + "image/tpbook/";
		String filename = null;

		Book originbook = bd.oneBook(book.getBooknum());

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
				book.setBookimg(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			book.setBookimg(originbook.getBookimg());
		}

		int num = bd.updateBook(book);
		String msg = "업데이트에 성공 하였습니다.";
		String url = "/book/indexmanager?booknum=" + originbook.getBooknum();

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	
	@RequestMapping("checkBook")
	public String checkbook(Book book) throws Exception {
		bd.checkBook(book);
		String msg = "상품등록을 했습니다.";
		String url = "/book/Bookcheck";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	
	
	@RequestMapping("bookDeleteForm")
	public String bookDeleteForm() throws Exception {
		// TODO Auto-generated method stub

		req.setAttribute("booknum", req.getParameter("booknum"));

		return "book/bookDeleteForm";
	}

	@RequestMapping("bookDeletePro")
	public String bookDeletePro(int booknum) throws Exception {

		Book book = bd.oneBook(booknum);

		String msg = "삭제에 실패하였습니다.";
		String url = "/book/indexmanager?booknum=" + booknum;

		int count = bd.bookDelete(booknum);

		msg = "삭제에 성공하였습니다.";
		url = "/book/bookList";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";

	}

	@RequestMapping("indexmanager")
	public String indexmanager(int booknum) throws Exception {

		Book book = bd.oneBook(booknum);
		req.setAttribute("book", book);
		return "book/indexmanager";
	}

	/* 관리자 판매등록 */
	@RequestMapping("bookinfo") // 책 등록 페이지
	public String book() throws Exception {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			String msg = "로그인을 하십시오";
			String url = "/member/login";

			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		return "book/bookinfo";
	}

	@RequestMapping("bookPro")
	public String bookPro(Book book) throws Exception {
		int num = bd.insertBook(book);
		System.out.println(book);
		String msg = "게시물 등록 성공";
		String url = "/book/bookList";

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("index")
	   public String index(int booknum, String pageNum) throws Exception {
	       String userid = (String) session.getAttribute("userid");
	       Book book = bd.oneBook(booknum);
	       int bookage = book.getGrade();
	  
	  
	       // 관리자인지 먼저 검사합니다.
	       if (userid != null && userid.equals("admin")) {
	    	   if (pageNum == null)
	               pageNum = "1";
	    	   int pageInt = Integer.parseInt(pageNum);
	    	   List<Review> reviewLi = bd.reviewList(booknum, pageInt);
	    	   int count = reviewLi.size();
	    	   req.setAttribute("reviewLi", reviewLi);
	           req.setAttribute("book", book);
	           req.setAttribute("count", count);
	           return "book/indexmanager";
	       }

	       // 그 외의 경우에는 사용자의 로그인 상태 및 연령을 검사합니다.
	       if (bookage == 1) {
	           if (pageNum == null)
	               pageNum = "1";
	           int pageInt = Integer.parseInt(pageNum);

	           List<Review> reviewLi = bd.reviewList(booknum, pageInt);
	           String checkreview  = bd.checkReview(booknum,userid);
		       List<Review> loadreview = bd.reviewload(booknum,userid);
	           int count = reviewLi.size();
	           req.setAttribute("reviewLi", reviewLi);
	           req.setAttribute("book", book);
	           req.setAttribute("count", count);
	           req.setAttribute("checkreview", checkreview);
		       req.setAttribute("loadreview", loadreview);
	       
	           return "book/index";
	       }

	       if (userid == null && bookage > 1) {
	           String msg = "로그인을 하십시오";
	           String url = "/member/login";

	           req.setAttribute("msg", msg);
	           req.setAttribute("url", url);
	           return "alert";
	       }

	       // 사용자의 연령을 검사합니다.
	       String bday = (bd.getBirth(userid)).substring(0, 4);

	       Calendar now = Calendar.getInstance(); // 년월일시분초
	       int currentYear = now.get(Calendar.YEAR);

	       // 태어난 년도
	       int birthYear = Integer.parseInt(bday);
	       int age = (currentYear - birthYear + 1);

	       if (bookage > age) {
	           String msg = "연령제한";
	           String url = "/book/main";

	           req.setAttribute("msg", msg);
	           req.setAttribute("url", url);
	           return "alert";
	       }

	       if (pageNum == null)
	           pageNum = "1";
	       int pageInt = Integer.parseInt(pageNum);

	       List<Review> reviewLi = bd.reviewList(booknum, pageInt);
	       String checkreview  = bd.checkReview(booknum,userid);
	       List<Review> loadreview = bd.reviewload(booknum,userid);
	       int count = reviewLi.size();
	      
	       req.setAttribute("reviewLi", reviewLi);
	       req.setAttribute("book", book);
	       req.setAttribute("count", count);
	       req.setAttribute("checkreview", checkreview);
	       req.setAttribute("loadreview", loadreview);
	   

	       return "book/index";
	   }

	@RequestMapping("reviewPro")
	public String reviewPro(Review r,int booknum) throws Exception {
		String userid = (String) session.getAttribute("userid"); 
		if (userid == null) {
		   String msg = "로그인을 하십시오";
		   String url = "/member/login";
		   req.setAttribute("msg", msg);
		   req.setAttribute("url", url);
		   return "alert";
		}
		
	
		bd.insertReview(r);
		bd.updateAvg(booknum);
		return "redirect:/book/index?booknum=" + r.getBooknum();
	}

	@RequestMapping("pictureimgForm")
	public View pictureimgForm() throws Exception {
		return new InternalResourceView("/single/pictureimgForm.jsp");
	}

	@RequestMapping("pictureimgPro")
	public View pictureimgPro(@RequestParam("bookimg") MultipartFile multipartFile) throws Exception {
		String path = req.getServletContext().getRealPath("/") + "/image/book/";
		String filename = null;

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		req.setAttribute("filename", filename);

		return new InternalResourceView("/single/pictureimgPro.jsp");
	}

	@RequestMapping("cartPro")
	public String cartPro(Cart c) throws Exception {
		String userid = (String) session.getAttribute("userid");
		c.setUserid(userid);
		if (userid == null) {
			String msg = "로그인을 하십시오";
			String url = "/member/login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}

		// 1. 있는지 검사
		// 쿼리 1번
		int num1 = bd.checkCart(c);
		System.out.println(num1);
		if (num1 >= 1) {
			bd.updateCart(c);
		} else {
			bd.insertCart(c);
		}

		String msg = "장바구니에 추가하였습니다.";
		String url = "/order/shoppingBasket";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("slangPro")
	public String slangPro(Slang s) throws Exception {
		String userid = (String) session.getAttribute("userid");
		s.setUserid(userid);

		if (userid == null) {
			String msg = "로그인을 하십시오";
			String url = "/member/login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}

		int num1 = bd.checkSlang(s);
		System.out.println(num1);
		if (num1 >= 1) {
			String msg = "이미 찜한 상품입니다.";
			String url = "/order/slang";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		} else {
			int inven = orderDao.checkInven(s.getBooknum());
			if(inven>0)
				bd.insertSlang(s);
			else
				bd.insertSlangAsZero(s);
		}

		String msg = "찜목록에 추가하였습니다.";
		String url = "/order/slang";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("deleteSession")
	public String deleteSession(HttpSession session) {
		session.removeAttribute("keyword");

		return "redirect:/book/bookList";
	}
	
	@RequestMapping("ReviewDelete")
	public String ReviewDelete(Review r,int booknum)throws Exception  {
		 bd.deleteReview(r);
		 bd.updateAvg(booknum);
		return "redirect:/book/index?booknum=" + r.getBooknum();
		
	}
	
	@RequestMapping("ReviewUpdate")
	public String ReviewUpdate(Review r,int booknum)throws Exception  {

		bd.UpdateReview(r);
		 bd.updateAvg(booknum);
		return "redirect:/book/index?booknum=" + r.getBooknum();
		
	}
	
	

}
