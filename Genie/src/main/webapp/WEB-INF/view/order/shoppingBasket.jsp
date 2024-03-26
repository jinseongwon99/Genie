<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shoppingBasket.css" type="text/css">
<script>
document.addEventListener('DOMContentLoaded', function () {
    updateSum();
});

function selectAll(selectAll)  {
  const checkboxes = document.querySelectorAll('.book_check');
  const count = 0;
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
  
  // AJAX 호출
  checkboxes.forEach((checkbox) => {
    var checked = checkbox.checked;
    var itemId = checkbox.id;

    $.ajax({
      type: 'POST',
      url: 'updateCheckState.do',
      data: {
        itemId: itemId,
        checked: checked
      },
      success: function(response) {
        console.log(response);
      },
      error: function(error) {
        console.error(error);
      }
    });
  });

  updateSum()  
}

function updateSum() {
  //  var checkboxes = document.querySelectorAll('input[name="price"]:checked');
    var checkboxes = document.querySelectorAll('.price');
    var sum = 0;
    var itemcount = 0;

    checkboxes.forEach(function (checkbox) {
    	console.log(checkbox.value)
    	if (checkbox.checked) {
        	sum += parseInt(checkbox.value);
	    	itemcount += 1;        	
    	}
    });
    document.getElementById('sum').innerText = '선택 상품 총합 : ' + sum + ' 원';
    document.getElementById('itemcount').innerText = '총 ' + itemcount + '개 상품 선택됨';
}

function changeAmount(index, cartid, booknum) {
	let amounts = document.querySelectorAll(".amount")
	console.log(amounts[index].value)
	location.href='${pageContext.request.contextPath}/order/changeAmount?cartid='+cartid+'&amount='+amounts[index].value+'&booknum='+booknum
}

$(document).ready(function() {
    // 체크박스 상태 변경 시 AJAX 호출
    $('input[type="checkbox"]').change(function() {
        var checkbox = $(this);
        var checked = checkbox.is(':checked');
        var itemId = checkbox.attr('id');

        // AJAX 호출
        $.ajax({
            type: 'POST',
            url: 'updateCheckState.do',
            data: {
                itemId: itemId,
                checked: checked
            },
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.error(error);
            }
        });
    });
});
</script>
</head>
<body>
	<div id=wrap>
		<section class="cart">
			<div class="cart__information">
				<ul>
					<li>장바구니 상품은 로그아웃시 소실됩니다.</li>
					<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
					<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문시 꼭 다시 확인해주시기 바랍니다.</li>
					<li>구매하실 상품을 체크해주세요.</li>
				</ul>
			</div>
			<table class="cart__list">
				
					<thead>
						<tr>
							<td><input type="checkbox" name="book_check" value='selectall' onclick='selectAll(this)'></td>
							<td colspan="2">상품정보</td>
							<td>옵션</td>
							<td>상품금액</td>
							<td>배송비</td>
						</tr>
					</thead>
					<tbody>
					<form   action="test"   method="post">
					<c:forEach var="b" items="${li }" varStatus="sts">
						<tr class="cart__list__detail">					
						<td><input type="checkbox"  class="book_check  price" id="${b.cartid }" value="${b.price*b.amount }"   onclick="updateSum()" ${b.ischecked ==1?"checked":"" }></td>
						<td><img class="book_img" src="${pageContext.request.contextPath}/image/book/${b.bookimg}" alt="상품 이미지 준비중.." style="display: block; margin: 0 auto; width:80px; height:100px;"></td>
						<td><a href="#">${b.publisher }</a> <span class="cart__list__smartstore">&nbsp;알라딘</span>
							<p>${b.title } - ${b.author }</p> <span class="price" name="realprice">${b.price }&nbsp;원</span>
							<span style="text-decoration: line-through; color: lightgray;">${b.price }</span>
						</td>
						<td class="cart__list__option">
							<input type="hidden" name="cartid" value="${b.cartid }">
							<p>상품명 : ${b.category } - ${b.title } / <input text="number" name="amount" class="amount" value="${b.amount}" style="width:25px; font-weight: bolder;">&nbsp;개</p>
							<button type="button" class="cart__list__optionbtn" onclick="changeAmount('${sts.index }', '${b.cartid }', '${b.booknum }')">주문수량 변경하기</button>
							<button type="button" class="cart__list__optionbtn" onclick="location.href='${pageContext.request.contextPath}/order/deleteItem?cartid=${b.cartid }'">삭제하기</button>
						</td>
						<td><span class="price">${b.amount * b.price }원</span><br>
						<td>무료</td>
					</c:forEach>						
					</tbody>
					</form>
					
					<tfoot>
						<tr>
							<td colspan="4">
								<a id="itemcount">&nbsp;</a> 
								<button type="button" class="cart__list__optionbtn" onclick="location.href='${pageContext.request.contextPath}/order/deleteCheckItem'">선택상품 삭제</button>
								</td>
							<td colspan="2"><a id="sum"></a></td>
						</tr>
					</tfoot>
				
			</table>
			<div class="cart__mainbtns">
				<button type="button" class="cart__bigorderbtn left" onclick="location.href='${pageContext.request.contextPath}/book/bookList'">쇼핑 계속하기</button>
				<button type="button" class="cart__bigorderbtn right" onclick="location.href='${pageContext.request.contextPath}/order/orderStep'">주문하기</button>
			</div>
		</section>
	</div>
</body>
</html>