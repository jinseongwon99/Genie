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
function win_open() {
	var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    var windowWidth = 840;
    var windowHeight = 680;
    var left = (screenWidth - windowWidth) / 2;
    var top = (screenHeight - windowHeight) / 2;
    
    
	var op = "width=840, height=680, left="+left+", top="+top;
	open("${pageContext.request.contextPath}/order/tossTest", "toss test", op);
}
</script>
</head>
<body>
	<div id=wrap>
		<section class="cart">
			<div class="cart__information">
				<ul>
					<li>주문상품 확인 및 결제 단계입니다.</li>
					<li>주문하고자 하는 상품의 상품명과 수량을 확인해주세요.</li>
					<li>주문정보가 알맞을 경우 다음단계로, 틀리다면 장바구니로 돌아가 수정해주세요.</li>
				</ul>
			</div>
			<table class="cart__list">
				
					<thead>
						<tr>
							<td></td>
							<td colspan="3">상품명</td>
							<td>수량</td>
							<td>상품금액</td>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="b" items="${li }">
						<tr class="cart__list__detail">
						<td></td>
						<td><img class="book_img" src="${pageContext.request.contextPath}/image/book/${b.bookimg}" alt="상품 이미지 준비중.." style="display: block; margin: 0 auto; width:180px; height:120px;"></td>
						<td colspan="2"><p>상품명 : ${b.category } - ${b.title } 
						</td>
						<td>
							<span class="price" style="text-align: center;">${b.amount }&nbsp;개</span><br>
						</td>
						<td><span class="price">${b.price * b.amount }&nbsp;원</span><br>
						</td>
					</c:forEach>

					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4"></td>
							<td>총 금액 : </td>
							<td><span class="price">${total }원</span><br></td>
						</tr>
					</tfoot>
				
			</table><br></br>
			
			
			<form action="orderPro" method="post">
			<table>
					<thead>
						<tr>
							<td colspan="6">배달지 정보 입력</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>주문인 :</td>
							<td colspan="2">${mv.name }</td>
							<td>수취인 : </td>
							<td colspan="2"><input type="text" name="ordername" value="${mv.name }" required="required"/></td> 
						</tr>
						<tr>
							<td colspan="1">배송지 : </td>
							<td colspan="5"><input type="text" name="orderaddr" value="${mv.addr }" required="required"/></td> 
						</tr>
						<tr>
							<td colspan="1">연락처 :</td>
							<td colspan="2"><input type="text" name="ordertel" value="${mv.tel }" required="required"/></td>
							<td colspan="1">이메일 :</td>
							<td colspan="2"><input type="text" name="orderemail" value="${mv.email }" required="required"/></td>
						</tr>
					<thead>
						<tr>
							<td colspan="6">결제정보</td>
						</tr>
					</thead>
						<tr>
							<td colspan="1">카드번호</td>
							<td colspan="5"><input type="text" name="cashcard" placeholder="카드 정보 입력" required="required"/></td>
						</tr>
						<tr>
							<td>주문금액 :</td>
							<td>${total }&nbsp;원</td>
							<td>보유포인트 : </td>
							<td>${mv.point }&nbsp;점</td>
							<td>사용포인트 : </td>
							<td><input type="number" name="discount" value="0"/></td> 
						</tr>
						<tr>
							<td colspan="1">결제금액</td>
							<td colspan="5">${total - discount }&nbsp;원 <button type="button" onclick="javascript:win_open()">결제하기</button></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
				
			</table>
			<div class="cart__mainbtns">
				<button type="button" class="cart__bigorderbtn left" onclick="location.href='${pageContext.request.contextPath}/order/shoppingBasket'">돌아가기</button>
				<button type="submit" class="cart__bigorderbtn right" >주문하기</button>
			</div>
			</form>
			
		</section>
	</div>
</body>
</html>