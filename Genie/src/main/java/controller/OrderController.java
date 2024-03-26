package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import dao.OrderDao;
import model.Order;
import model.OrderLog;

@Controller
@RequestMapping("/order/")
public class OrderController {
	@Autowired
	OrderDao od;
	HttpSession session;
	HttpServletRequest req;
	
	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		this.req = request;
		this.session = request.getSession();
		request.setCharacterEncoding("utf-8");		
	}
	
	//찜목록 페이지 매핑
	@RequestMapping("slang")
	public String slang(String userid) throws Exception {
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			String msg = "로그인해주세요.";
			String url = "/member/login";
			req.setAttribute("msg", msg);
	        req.setAttribute("url", url);
	        return "alert";
		}
		System.out.println("slang---"+userid);
		List<Order> li = od.slangList(userid);
		if(!li.isEmpty()) {
			int total = od.slangTotal(userid);
			req.setAttribute("total", total);			
		}
		System.out.println(li);
		req.setAttribute("li", li);
		
		return "order/slang";
	}
	//찜목록 아이템 삭제
	@RequestMapping("deleteSlangItem")
	public String deleteSlangItem(int slangid) throws Exception {
		int num;
		num = od.deleteSlangItem(slangid);
		
		String msg = "삭제하였습니다.";
		String url = "/order/slang";
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//찜목록 선택 아이템 삭제
	@RequestMapping("deleteSlangCheckItem")
	public String deleteSlangCheckItem(String userid) throws Exception {
		userid = (String)session.getAttribute("userid");
		int num = od.deleteSlangCheckItem(userid);
		
		String msg = "선택상품을 전부 삭제하였습니다.";
		String url = "/order/slang";
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	
	//찜목록 장바구니 추가
	@RequestMapping("insertFromStoC")
	public String insertFromStoC(Order o) {
		String userid = (String)session.getAttribute("userid");
		
		// slang에서 1인 애들 받아와서
		List<Order> li = od.ischeckedSlangItem(userid);
		System.out.println(li);
		
		int size = li.size();
		
		if(li.isEmpty()) { 
			String msg = "장바구니에 추가할 상품이 없습니다."; 
			String url = "/order/slang";
			req.setAttribute("msg", msg); 
			req.setAttribute("url", url);
			return "alert"; 
		}
		
		int cnt = 0;
		for (Order o2 : li) {
			o.setBooknum(o2.getBooknum());
			int num = od.checkCartExist(userid, o.getBooknum());
			if(num == 0) {
				int num2 = od.insertFromStoCart(userid, o.getBooknum());								
			}
			else {
				cnt ++;
			}
		}
				
		String msg = "선택상품을 추가하였습니다.";
		if(size == cnt) {
			msg = "모든 상품이 이미 장바구니에 존재합니다.";
		}
		String url = "/order/shoppingBasket";
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "alert";
	}
	
	
	//장바구니 페이지 매핑
	@RequestMapping("shoppingBasket")
	public String shoppingBasket(String userid) throws Exception {
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			String msg = "로그인해주세요.";
			String url = "/member/login";
			req.setAttribute("msg", msg);
	        req.setAttribute("url", url);
	        return "alert";
		}
		List<Order> li = od.cartList(userid);
		if(!li.isEmpty()) {
			int cartCount = od.cartCount(userid);
			int total = od.total(userid);
			int itemCount = od.itemCount(userid);
			session.setAttribute("cartCount", cartCount);
			req.setAttribute("li", li);
			req.setAttribute("total", total);
			req.setAttribute("itemCount", itemCount);
		}
		return "order/shoppingBasket";
	}
	
	//장바구니 아이템 수량 변경
	@RequestMapping("changeAmount")
	public String changeAmount(Order o) throws Exception {
		String userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		
		System.out.println(o);
		String msg = "수량을 변경 하였습니다.";
		String url = "/order/shoppingBasket";
		
		
		int left = od.getInven(o.getBooknum());
		System.out.println(left);
		System.out.println(o.getAmount());
		if(o.getAmount() > left) {
			msg = "재고가 부족합니다. 남은 재고량 : " + left;
			url = "/order/shoppingBasket";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		else if(o.getAmount() > 10) {
			msg = "구매제한 수량을 초과하였습니다. 최대 구매 가능량 : 10";
			url = "/order/shoppingBasket";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		else if(o.getAmount() < 1) {
			msg = "잘못된 수량을 입력하였습니다.";
			url = "/order/shoppingBasket";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		int num;
		Map map = new HashMap<>();
		map.put("cartid", o.getCartid());
		map.put("amount", o.getAmount());
		System.out.println(map);
		num = od.changeItemAmount(map);
		
		int cartCount = od.cartCount(userid);
		session.setAttribute("cartCount", cartCount);

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//장바구니 아이템 삭제
	@RequestMapping("deleteItem")
	public String deleteItem(int cartid) throws Exception {
		String userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		System.out.println(cartid);
		int num;
		num = od.deleteItemCart(cartid);
		
		int cartCount = od.cartCount(userid);
		session.setAttribute("cartCount", cartCount);
		String msg = "삭제하였습니다.";
		String url = "/order/shoppingBasket";
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//장바구니 선택 아이템 삭제
	@RequestMapping("deleteCheckItem")
	public String deleteCheckItem(String userid) throws Exception {
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		int num;
		num = od.deleteCheckItem(userid);
		
		int cartCount = od.cartCount(userid);
		session.setAttribute("cartCount", cartCount);
		
		String msg = "선택상품을 전부 삭제하였습니다.";
		String url = "/order/shoppingBasket";
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	
	
	//주문 페이지 매핑
	@RequestMapping("orderStep")
	public String orderStep(String userid) throws Exception {
		userid = (String)session.getAttribute("userid");

		//Cart 조회
		List<Order> li = od.orderList(userid);
		if(li.isEmpty()) {
			String msg = "선택상품이 존재하지 않습니다.";
			String url = "/order/shoppingBasket";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		
		String msg = "재고량이 부족한 상품이 있습니다. 상품명 : ";
		String url = "/order/shoppingBasket";
		int cnt = 0;
		for(Order o : li) {
			int inven = od.checkInven(o.getBooknum());
			System.out.println(inven);
			String bookname = od.getBookName(o.getBooknum());

			if(o.getAmount() > inven ) {
				msg = msg + "/" + bookname;
				cnt++;
			}
		}
		if(cnt > 0) {
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		
		req.setAttribute("li", li);
		
		//Member Model 변경필요
		Order mv = od.oneMember(userid);
		System.out.println(mv);
		req.setAttribute("mv", mv);
		int total = od.getOrderTotalPay(userid);
		req.setAttribute("total", total);
		
		return "order/orderStep";
	}
	

	//주문기록 조회 페이지 매핑
	@RequestMapping("orderLog")
	public String orderLog(String userid, String orderLogPageNum) throws Exception {
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		//구매기록
		List<OrderLog> li = od.orderLogList(userid);

		int LogCount = od.logListCount(userid);
		req.setAttribute("logCount", LogCount);
		
		req.setAttribute("li", li);
		//구매기록 수
		
		
		return "order/orderLog";
	}
	
	//주문기록 상세 페이지(주문번호 별)
	@RequestMapping("orderLogDetail")
	public String orderLogDetail(String userid, String orderid) throws Exception { 
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		//구매기록
		List<OrderLog> li = od.orderDetail(userid, orderid);
		List<OrderLog> li2 = od.orderDetailInfo(orderid);
		int total = 0;
		
		total = od.orderDetailTotal(userid, orderid);
		
		req.setAttribute("userid", userid);
		req.setAttribute("total", total);
		req.setAttribute("li", li);
		req.setAttribute("li2", li2);
		
		return "order/orderLogDetail";
	}
	
	
	//토스 테스트
	@RequestMapping("tossTest")
	public View tossTest() throws Exception  {
		
		return new InternalResourceView("/toss/checkout.jsp");
	}
	//토스 성공
	@RequestMapping("success")
	public View success() throws Exception {
		
		return new InternalResourceView("/toss/success.jsp");
	}
	//토스 실패
	@RequestMapping("fail")
	public View fail() throws Exception {
		
		return new InternalResourceView("/toss/fail.jsp");
	}
	
	//주문기능
	@RequestMapping("orderPro")
	public String orderPro(OrderLog ol) throws Exception {
		String userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		System.out.println(ol);
		
		//보유한 포인트보다 크거나, 주문금액보다 큰 포인트 사용시 불가처리하기
		int point = ol.getDiscount();
		int total = od.total(userid);
		if(od.checkUserPoint(userid) < point) {
			String msg = "주문실패 : 보유한 포인트보다 많은 포인트를 사용시도하였습니다.";
			String url = "/order/orderStep";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		else if(0 > point || point > total) {
			String msg = "주문실패 : 지불 금액 범위를 넘어난 포인트를 사용시도하였습니다.";
			String url = "/order/orderStep";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		
		
		//난수 + 날짜로 랜덤id 만들기
		Random random = new Random();
		String num = String.valueOf(random.nextInt(9000) + 1000);
		LocalDate currentDate = LocalDate.now();
		int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        int day = currentDate.getDayOfMonth();
        String orderid = num+year+month+day;
		        
        //구매 정보 저장
        List<Order> li = od.listCart(userid);
        	
		for (Order o : li) {
			ol.setOrderid(orderid);
			ol.setUserid(userid);
			ol.setBooknum(o.getBooknum());
			ol.setAmount(o.getAmount());
			
			int num2 = od.orderItem(ol);	
			int num5 = od.invenAdj(o.getBooknum(), o.getAmount());
		}
		//배송지 저장
		OrderLog ol2 = new OrderLog();
		ol2.setOrderid(orderid);
		ol2.setOrdername(ol.getOrdername());
		ol2.setOrdertel(ol.getOrdertel());
		ol2.setOrderemail(ol.getOrderemail());
		ol2.setDiscount(ol.getDiscount());
		ol2.setCashcard(ol.getCashcard());
		ol2.setOrderaddr(ol.getOrderaddr());
		int num3 = od.orderInfo(ol2);
		//사용 포인트 로그 저장
		if(ol.getDiscount()>0) {
			System.out.println("할인량 : " + ol.getDiscount());
			int num6 = od.useUserPoint(userid, ol.getDiscount());;
			int num7 = od.useUserPointLog(userid, orderid, ol.getDiscount());
		}
		//장바구니 초기화 (코드 작성간 주석처리)
		int num4 = od.clearCart(userid);
		
		String msg = "상품을 구매하였습니다.";
		String url = "/order/orderLogDetail?orderid=" + orderid;
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		
		int cartCount = od.cartCount(userid);
		session.setAttribute("cartCount", cartCount);
		
		return "alert";
	}
	
	//수취확인시
	@RequestMapping("recConf")
	public String recConf(String userid) throws Exception {
		System.out.println("recCof");
		userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		
		int orderlogid = Integer.parseInt(req.getParameter("orderlogid"));
		String orderid = req.getParameter("orderid");
		
		
		System.out.println(userid +"--"+ orderlogid +"--"+ orderid);
		
		int num, num2, num3;
		
		//orderstate 를 배달완료 -> 수취확인으로 변경
		num = od.updateState(orderlogid);
		
		//포인트 추출
		int point = od.selectPoint(orderlogid);
		//유저에게 포인트 부여
		num2 = od.getPoint(userid, point);
		//포인트 부여 기록 저장
		num3 = od.getPointLog(userid, orderlogid, point);
		
		System.out.println(orderid);
		
		String msg = "수취확인이 정상적으로 진행되었습니다.";
		String url = "/order/orderLogDetail?orderid=" + orderid;
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		
		return "alert";
	}
	//수취 일괄 확인시
	@RequestMapping("recAll")
	public String recAll(OrderLog ol) throws Exception {
		String userid = (String)session.getAttribute("userid");
		if(userid==null) {
			userid = "";
		}
		String orderid = ol.getOrderid();
		
		System.out.println(userid + "--" + orderid);
		
		//배달완료 상품 리스트 추출
		List<OrderLog> li = od.orderLogDetailList(userid, orderid);
		if(li.isEmpty()) {
			String msg = "해당하는 상품이 존재하지 않습니다.";
			String url = "/order/orderLogDetail?orderid=" + orderid;
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
		
		System.out.println(li);
		for(OrderLog ol2 : li) {
			//배송완료 > 수취완료 로 상태 업데이트
			int num1 = od.updateState(ol2.getOrderlogid());
			//포인트 출력
			int point = od.selectPoint(ol2.getOrderlogid());
			//포인트 부여
			int num2 = od.getPoint(ol2.getUserid(), point);
			//포인트 부여 기록 저장
			int num3 = od.getPointLog(ol2.getUserid(), ol2.getOrderlogid(), point);
			
			System.out.println(ol2);
		}
		//orderinfo 에서 배송완료 > 수취완료로 전환
		int num4 = od.updateStateInfo(orderid);
		
		String msg = "수취확인이 정상적으로 진행되었습니다.";
		String url = "/order/orderLogDetail?orderid=" + orderid;
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//교환신청
	@RequestMapping("reqChangeItem")
	public String reqChangeItem() throws Exception {
		int orderlogid = Integer.parseInt(req.getParameter("orderlogid"));
		String orderid = req.getParameter("orderid");
		
		//교환상태로 변경
		int num = od.updateStateChange(orderlogid);
		
		String msg = "교환신청이 진행되었습니다.";
		String url = "/order/orderLogDetail?orderid=" + orderid;
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//반품신청
	@RequestMapping("reqReturnItem")
	public String reqReturnItem() throws Exception {
		int orderlogid = Integer.parseInt(req.getParameter("orderlogid"));
		String orderid = req.getParameter("orderid");
		
		//교환상태로 변경
		int num = od.updateStateReturn(orderlogid);
		
		String msg = "반품신청이 진행되었습니다.";
		String url = "/order/orderLogDetail?orderid=" + orderid;
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	//취소신청
	@RequestMapping("reqCancleOrder")
	public String reqCancleOrder() throws Exception{
		String orderid = req.getParameter("orderid");
		
		//취소상태로 변경
		int num = od.updateLogStateCancle(orderid);
		int num2 = od.updateInfoStateCancle(orderid);
		
		String msg = "취소신청이 진행되었습니다.";
		String url = "/order/orderLog";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}
	
	
	
	//장바구니 체크박스
	@RequestMapping(value = "/updateCheckState.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateCheckState(@RequestParam int itemId, @RequestParam boolean checked) {
        // 여기에서 DAO를 호출하여 데이터베이스 업데이트 수행
        od.updateCheckState(itemId, checked);
        return "Success";
    }
	//찜목록 체크박스
	@RequestMapping(value = "/updateSlangCheckState.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateSlangCheckState(@RequestParam int itemId, @RequestParam boolean checked) {
        // 여기에서 DAO를 호출하여 데이터베이스 업데이트 수행
        od.updateSlangCheckState(itemId, checked);
        return "Success";
    }

	
}
