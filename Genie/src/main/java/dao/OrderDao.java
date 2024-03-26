package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Order;
import model.OrderLog;
import model.Slang;

@Component
public class OrderDao {
	private static final String NS = "order.";
	@Autowired
	SqlSession sqlSession;
	
	//찜목록 아이템 리스트 추출
	public List<Order> slangList(String userid){
		return sqlSession.selectList(NS+"slangList", userid);
	}
	//장바구니 아이템 총 금액 계산
	public int slangTotal(String userid) {
		return sqlSession.selectOne(NS+"slangTotal", userid);
	}
	//찜목록 아이템 삭제
	public int deleteSlangItem(int slangid) {
		return sqlSession.delete(NS+"deleteSlangItem", slangid);
	}
	//찜목록 선택 아이템 삭제
	public int deleteSlangCheckItem(String userid) {
		return sqlSession.delete(NS+"deleteSlangCheckItem", userid);
	}
	
	public List<Order> ischeckedSlangItem(String userid){
		return sqlSession.selectList(NS+"ischeckedSlangItem", userid);
	}
	
	public int insertFromStoCart(String userid, int booknum) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("booknum", booknum);
		return sqlSession.insert(NS+"insertFromStoCart", map);
	}
	
	public int checkCartExist(String userid, int booknum) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("booknum", booknum);
		return sqlSession.selectOne(NS+"checkCartExist", map);
	}
	
	
	//장바구니 아이템 리스트 추출
	public List<Order> cartList(String userid){
		return sqlSession.selectList(NS+"cartList", userid);
	}
	//장바구니 아이템 수량 산출
	public int cartCount(String userid) {
		return sqlSession.selectOne(NS+"cartCount", userid);
	}
	//장바구니 아이템 총 금액 계산
	public int total(String userid) {
		return sqlSession.selectOne(NS+"total", userid);
	}
	
	//재고량 산출
	public int getInven(int booknum) {
		return sqlSession.selectOne(NS+"getInven", booknum);
	}
	//장바구니 아이템 수량 변경
	public int changeItemAmount(Map map) {
		return sqlSession.update(NS+"changeItemAmount", map);
	}
	//장바구니 아이템 삭제
	public int deleteItemCart(int cartid) {
		return sqlSession.delete(NS+"deleteItemCart", cartid);
	}
	//장바구니 선택 아이템 삭제
	public int deleteCheckItem(String userid) {
		return sqlSession.delete(NS+"deleteCheckItem", userid);
	}

	
	//장바구니 아니템 수량 추출
	public int itemCount(String userid) {
		return sqlSession.selectOne(NS+"itemCount", userid);
	}
	//장바구니 구매 아이템 리스트 추출
	public List<Order> orderList(String userid){
		return sqlSession.selectList(NS+"orderList", userid);
	}
	//장바구니 사용자 정보 추출 (Member 에서 가져와야함)
	public Order oneMember(String userid) {
		return sqlSession.selectOne(NS+"oneMember", userid);
	}
	//장바구니 구매 아이템 총 금액 계산
	public int getOrderTotalPay(String userid) {
		return sqlSession.selectOne(NS+"getOrderTotalPay", userid);
	}
	
	//장바구니 품목 재고량 검사
	public int checkInven(int booknum) {
		return sqlSession.selectOne(NS+"checkInven", booknum);
	}
	//장바구니 품목 이름 추출
	public String getBookName(int booknum) {
		return sqlSession.selectOne(NS+"getBookName", booknum);
	}
	//구매페이지 용 구매 장바구니 아이템 추출
	public List<Order> listCart(String userid){
		return sqlSession.selectList(NS+"listCart", userid);
	}
	//구매
	public int orderItem(OrderLog o) {
		return sqlSession.insert(NS+"orderItem", o);
	}
	//상품 재고량 조정
	public int invenAdj(int booknum, int amount) {
		Map map = new HashMap<>();
		map.put("booknum", booknum);
		map.put("amount", amount);
		return sqlSession.update(NS+"invenAdj", map);
	}
	//멤버에 포인트 차감
	public int useUserPoint(String userid, int point) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("point", point);
		return sqlSession.update(NS+"useUserPoint", map);
	}
	//사용 포인트 로그 저장
	public int useUserPointLog(String userid, String orderid, int point) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		map.put("point", point * (-1));
		return sqlSession.insert(NS+"useUserPointLog", map);
	}
	
	//장바구니 초기화
	public int clearCart(String userid) {
		return sqlSession.delete(NS+"clearCart", userid);
	}
	
	//구매기록 리스트 추출
	public List<OrderLog> orderLogList(String userid){
		return sqlSession.selectList(NS+"orderLogList", userid);
	}
	//구매기록 수 추출
	public int logListCount(String userid) {
		return sqlSession.selectOne(NS+"logListCount", userid);
	}
	
	//주문기록 번호별 상품 출력
	public List<OrderLog> orderDetail(String userid, String orderid){
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		return sqlSession.selectList(NS+"orderDetail", map);
	}
	//주문기록 번호별 상품 출력
	public int orderInfo(OrderLog ol2){
		return sqlSession.insert(NS+"orderInfo", ol2);
	}
	//주문기록 번호별 총금액 출력
	public int orderDetailTotal(String userid, String orderid){
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		System.out.println(map);
		return sqlSession.selectOne(NS+"orderDetailTotal", map);
	}
	//주문기록 번호별 상품 출력
	public List<OrderLog> orderDetailInfo(String orderid){
		return sqlSession.selectList(NS+"orderDetailInfo", orderid);
	}
	/*
	//주문기록 번호별 상품 가격 출력
	public int orderDetailGetTotal(String orderid) {
		return sqlSession.selectOne(NS+"orderDetailGetTotal", orderid);
	}
	*/
	
	//수취확인 상태 업데이트
	public int updateState(int orderlogid) {
		return sqlSession.update(NS+"updateState", orderlogid);
	}
	//수취확인 상태 업데이트 : info
	public int updateStateInfo(String orderid) {
		return sqlSession.update(NS+"updateStateInfo", orderid);
	}
	//수취확인 일괄 업데이트용 목록
	public List<OrderLog> orderLogDetailList(String userid, String orderid) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		return sqlSession.selectList(NS+"orderLogDetailList", map);
	}
	//교환신청
	public int updateStateChange(int orderlogid) {
		return sqlSession.update(NS+"updateStateChange", orderlogid);
	}
	//반품신청
	public int updateStateReturn(int orderlogid) {
		return sqlSession.update(NS+"updateStateReturn", orderlogid);
	}
	
	//포인트 추출
	public int selectPoint(int orderlogid) {
		System.out.println("-------2--------");
		return sqlSession.selectOne(NS+"selectPoint", orderlogid);
	}
	//멤버에 포인트 가산
	public int getPoint(String userid, int point) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("point", point);
		return sqlSession.update(NS+"getPoint", map);
	}
	//포인트로그 테이블에 가산정보 추가
	public int getPointLog(String userid, int orderlogid, int point) {
		Map map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderlogid", orderlogid);
		map.put("point", point);
		return sqlSession.insert(NS+"getPointLog", map);
	}
	
	
	public int updateCheckState(int itemId, boolean checked) {
		Map map = new HashMap<>();
		map.put("itemId", itemId);
		map.put("checked", checked);
		return sqlSession.update(NS+"updateCheckState", map);
    }
	public int updateSlangCheckState(int itemId, boolean checked) {
		Map map = new HashMap<>();
		map.put("itemId", itemId);
		map.put("checked", checked);
		return sqlSession.update(NS+"updateSlangCheckState", map);
    }
	
	
	public int updateLogStateCancle(String orderid) {
		return sqlSession.update(NS+"updateLogStateCancle", orderid);
	}
	public int updateInfoStateCancle(String orderid) {
		return sqlSession.update(NS+"updateInfoStateCancle", orderid);
	}
	
	
	//관리자 모든 주문 조회
	public List<OrderLog> getAllOrderLog() {
		return sqlSession.selectList(NS+"getAllOrderLog");
	}
	//모든 주문 조회 로그 수
	public int allLogListCount() {
		return sqlSession.selectOne(NS+"allLogListCount");
	}
	//주문 상태 업데이트
	public int adminOrderLogState(String orderid, String state) {
		Map map = new HashMap<>();
		map.put("orderid", orderid);
		map.put("state", state);
		return sqlSession.update(NS+"adminOrderLogState", map);
	}
	//주문 상태 업데이트
	public int adminOrderInfoState(String orderid, String state) {
		Map map = new HashMap<>();
		map.put("orderid", orderid);
		map.put("state", state);
		return sqlSession.update(NS+"adminOrderInfoState", map);
	}
	//관리자용 주문기록 번호별 상품 출력
	public List<OrderLog> adminOrderDetail(String orderid){
		return sqlSession.selectList(NS+"adminOrderDetail", orderid);
	}
	//관리자용 주문기록 번호별 상품 출력
	public List<OrderLog> adminOrderDetailInfo(String orderid){
		return sqlSession.selectList(NS+"adminOrderDetailInfo", orderid);
	}
	//관리자용 주문기록 번호별 총금액 출력
	public int adminOrderDetailTotal(String orderid){
		return sqlSession.selectOne(NS+"adminOrderDetailTotal", orderid);
	}
	public String adminCheckOrderState(String orderid) {
		return sqlSession.selectOne(NS+"adminCheckOrderState", orderid);
	}
	
	
	//유저 포인트 조회
	public int checkUserPoint(String userid) {
		return sqlSession.selectOne(NS+"checkUserPoint", userid);
	}
	
}
