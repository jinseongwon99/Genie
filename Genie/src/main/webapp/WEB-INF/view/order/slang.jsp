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
      url: 'updateSlangCheckState.do',
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


$(document).ready(function() {
    // 체크박스 상태 변경 시 AJAX 호출
    $('input[type="checkbox"]').change(function() {
        var checkbox = $(this);
        var checked = checkbox.is(':checked');
        var itemId = checkbox.attr('id');

        // AJAX 호출
        $.ajax({
            type: 'POST',
            url: 'updateSlangCheckState.do',
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
					<li>찜목록은 기본적으로 직접 삭제 전까지 유지됩니다.</li>
					<li>상품 정보 변경 등 특수한 경우 목록이 삭제될 수 있습니다.</li>
					<li>장바구니에 담으실 상품을 체크해주세요.</li>
				</ul>
			</div>
			<table class="cart__list">
				
					<thead>
						<tr>
							<td><input type="checkbox" name="book_check" value='selectall' onclick='selectAll(this)'></td>
							<td colspan="2">상품정보</td>
							<td>상품금액</td>
							<td>재고상태</td>
							<td>기능</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="b" items="${li }" varStatus="sts">
						<tr class="cart__list__detail">
						<c:if test="${b.inventory>0 }">
							<td><input type="checkbox"  class="book_check  price" id="${b.slangid }" value="${b.price }"   onclick="updateSum()" ${b.ischecked ==1?"checked":"" }></td>
						</c:if>
						<c:if test="${b.inventory==0 }">
							<td><input type="checkbox" disabled/>
						</c:if>
						<td><img class="book_img" src="${pageContext.request.contextPath}/image/book/${b.bookimg}" alt="상품 이미지 준비중.." style="display: block; margin: 0 auto; width:120px; height:80px;"></td>
						<td><a href="#">${b.publisher }</a> <span class="cart__list__smarts tore">&nbsp;알라딘</span>
							<p>${b.title } - ${b.author }</p> <span class="price" name="realprice">${b.price }&nbsp;원</span>
							<span style="text-decoration: line-through; color: lightgray;">${b.price }</span>
						</td>
						<td><span class="price">${b.price }원</span><br>
						<td>${b.inventory>0?'재고있음':'품절' }</td>
						<td><button type="button" class="cart__list__optionbtn" onclick="location.href='${pageContext.request.contextPath}/order/deleteSlangItem?slangid=${b.slangid }'">삭제하기</button></td>
					</c:forEach>						
					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4">
								<a id="itemcount">&nbsp;</a> 
								<button type="button" class="cart__list__optionbtn" onclick="location.href='${pageContext.request.contextPath}/order/deleteSlangCheckItem'">선택상품 삭제</button>
								</td>
							<td colspan="2"><a id="sum"></a></td>
						</tr>
					</tfoot>
				
			</table>
			<div class="cart__mainbtns">
				<button type="button" class="cart__bigorderbtn left" onclick="location.href='${pageContext.request.contextPath}/book/bookList'">쇼핑 계속하기</button>
				<button type="button" class="cart__bigorderbtn right" onclick="location.href='${pageContext.request.contextPath}/order/insertFromStoC'">장바구니담기</button>
			</div>
		</section>
	</div>
</body>
</html>