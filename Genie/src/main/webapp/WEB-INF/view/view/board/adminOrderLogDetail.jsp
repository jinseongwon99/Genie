<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shoppingBasket.css"
	type="text/css">
<%
	int total = 0;
%>

<script>
function DeliveryPage(orderid)  {
	var url = 'http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=' + orderid; 
	window.open(url);
}
</script>

</head>
<body>
	<div id=wrap>
		<section class="cart">
			<table class="cart__list">
					<thead>
						<tr>
							<td colspan="7">주문상품정보 : <%= request.getParameter("orderid") %></td>
						</tr>
						<tr>
							<td colspan="4">상품명</td>
							<td>수량</td>
							<td>상품금액</td>
							<td>상태</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="b" items="${li }">
						<tr class="cart__list__detail">
						<td></td>
						<td><img class="book_img" src="${pageContext.request.contextPath }/image/book/${b.bookimg}" alt="상품 준비중 입니다.." style="display: block; margin: 0 auto; width:120px; height:180px;"></td>
						<td colspan="2"><p>상품명 : ${b.category } - ${b.title }
							<br><sapn class="price" name="realprice">${b.price } 원</sapn>
						</td>
						<td>
							<span class="price" style="text-align: center;">${b.amount }&nbsp;개</span><br>
						</td>
						<td><span class="price">${b.price * b.amount }&nbsp;원</span><br>
						</td>
						<td>
							<span class="price">${b.orderstatedetail}</span><br>
						</td>
					</c:forEach>

					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4"></td>
							<td>총 합계 : </td>
							<td></td>
							<td><span class="price">${total }원</span><br></td>
						</tr>
					</tfoot>
				
					
						
			</table><br></br>
			
			
			<table>
				<form>
				
					<thead>
						<tr>
							<td colspan="6">배달정보</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="b" items="${li2 }">
						<tr>
							<td>주문번호 :</td>
							<td>${b.orderid }</td>
							<td>주문상태 :</td>
							<td>${b.orderstate }</td>
						</tr>
						<tr>
							<td>주문일자 : </td>
							<td>${b.regdate }</td>
							<td>결제확인일 : </td>
							<td>${b.paydate }</td>
						</tr>
						<tr>
							<td>주문인 :</td>
							<td>${userid }</td>
							<td>수취인 : </td>
							<td>${b.ordername }</td> 
						</tr>
						<tr>
							<td colspan="1">배송지 : </td>
							<td colspan="3">${b.orderaddr }</td>
						</tr>
						<tr>
							<td colspan="1">연락처 :</td>
							<td colspan="3">${b.ordertel }</td>
						</tr>
					<thead>
						<tr>
							<td colspan="4">결제정보</td>
						</tr>
					</thead>
						<tr>
							<td colspan="1">카드번호 :</td>
							<td colspan="3">${b.cashcard }</td>
						</tr>
						<tr>
							<td>주문금액 :</td>
							<td>${total }</td>
							<td>사용포인트 : </td>
							<td>${b.discount }</td> 
						</tr>
						<tr>
							<td colspan="1">결제금액 : </td>
							<td colspan="3">${total - b.discount }</td>
						</tr>
					</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
			</table>
			
			<div class="cart__mainbtns">
				<button type="button" class="cart__bigorderbtn left" onclick="location.href='${pageContext.request.contextPath}/admin/adminOrderLog'">목록으로</button>
				<button type="button" class="cart__bigorderbtn right" onclick="location.href='${pageContext.request.contextPath}/admin/adminOrderStateDetail?orderid=<%=request.getParameter("orderid")%>'">처리하기</button>
			</div>
		</form>
		</section>
	</div>
</body>
</html>