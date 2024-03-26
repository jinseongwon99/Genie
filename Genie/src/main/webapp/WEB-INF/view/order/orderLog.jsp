	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardMain.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiry.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiryList.css">

<script>
function DeliveryPage(orderid)  {
	var url = 'http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=' + orderid; 
	window.open(url);
}
</script>

</head>
<body>


	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">

				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">주문 기록 조회</p>
						<p class="counsel_mtitle">주문목록을 조회하실 수 있으시며 주문번호를 클릭하여 해당 주문을 상세보기할 수 있습니다.</p>
						<p class="counsel_mtitle">상품을 정상적으로 수령하셨을 경우, 수취확인을 통해 포인트를 얻으실 수 있으며, 환불, 교환 요청이 가능합니다.</p>
					</div>

					<!-- left contents -->


					<!-- left contents -->
					<div class="side_t2">
						<!-- sub navi -->
						<div class="cate_comm">
							<ul class="cate_d1">
								<li class="cate_d1_li open"><span class="cate_d1_link on"><a
										href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/orderLog'">주문 기록 조회</a></span></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">주문 기록 조회</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/order/slang'">찜목록</a></li>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/order/shoppingBasket'">장바구니</a></li>
										</ul>
									</div></li>
								<li class="cate_d1_li open"><span class="cate_d1_link "><a
										href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/pointLog'">포인트변동내역</a></span></li>
								

							</ul>

						</div>
						<!-- //sub navi -->

					</div>
					<!-- //left contents -->
 
					<!-- right contents -->
					<div class="con_t3">
						<h3 class="cateTit  mt10 mb15"></h3>
<%--						<form name="counselForm"
							action="${pageContext.request.contextPath}/board/oneOnOne/list"
							method="post">
							<input type="hidden" name="fromDate" id="fromDate"
								value="${fromDate}"> <input type="hidden" name="toDate"
								id="toDate" value="${toDate}">
							<div class="box_sort">
								<dl>
									<dt class="pt15">기간별 조회</dt>
									<dd style="width: 80%; margin: 13px 0 0 0;">
										<span class="block"> <a href="javascript:void(0);"
											onclick="setDate(0, 0, 15);"><span>최근15일</span></a> <a
											href="javascript:void(0);" onclick="setDate(0, 1, 0);"><span>1개월</span></a>
											<a href="javascript:void(0);" onclick="setDate(0, 3, 0);"><span>3개월</span></a>
											<a href="javascript:void(0);" onclick="setDate(0, 6, 0);"><span>6개월</span></a>
										</span> <span class="block mt5"> <span id="year"><select
												id="fromYear" name="fromYear"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="2021">2021</option>
													<option value="2022">2022</option>
													<option value="2023">2023</option>
													<option value="2024">2024</option></select></span> <span id="month"><select
												id="fromMonth" name="fromMonth"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option></select></span> <span id="day"><select
												id="fromDay" name="fromDay"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option></select></span> <span> - </span> <span
											id="year"><select id="toYear" name="toYear"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="2021">2021</option>
													<option value="2022">2022</option>
													<option value="2023">2023</option>
													<option value="2024">2024</option></select></span> <span id="month"><select
												id="toMonth" name="toMonth"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option></select></span> <span id="day"><select
												id="toDay" name="toDay"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option></select></span> <span> <!-- <a href="javascript: goCounselList();"><span>조회</span></a> -->
												<button type="submit">
													<span>조회</span>
												</button>
										</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dt style="margin: 4px 0 0 0;">상태별 조회</dt>
									<dd>
										<span class="block"> <span> <select
												name="replyYn"
												style="width: 140px; color: #333333; height: 22px">
													<option value="배송중" selected>배송중</option>
													<option value="배송완료">배송완료</option>
													<option value="수취확인완료">수취확인 완료</option>
													<option value="반품/환불">반품/환불</option>
													<option value="교환">교환</option>
											</select>
										</span> <span> 
												<button type="submit">
													<span id="brown">조회</span>
												</button>
										</span>
									</dd>
								</dl>
							</div>

						</form>
 --%>
						<!-- tab -->
						<div class="al_right"></div>
						<!-- list  -->
						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="table_comm mt10">
							<colgroup>
								<col width="50">
								<col width="200">
								<col>
								<col width="150">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>주문일자</th>
									<th>주문번호</th>
									<th>비용</th>
									<th>주문상태</th>
								</tr>
							</thead>
							<c:set var="logcount" value="${logCount}"/>
							<tbody>
								<c:if test="${not empty li}">
									<c:forEach var="b" items="${li}">
										<tr>
											<td>${logcount }</td>
											<td>${b.regdate}</td>
											<td>ORDERID : <a href="${pageContext.request.contextPath}/order/orderLogDetail?orderid=${b.orderid }" style="text-decoration: underline;">${b.orderid }</td>
											<td>${b.total }</td>
											<td>${b.orderstate}
											<c:if test="${b.orderstate=='배송완료' }"><button class="cart__list__orderbtn" onclick="DeliveryPage('${b.orderid}')">배송추적</button></c:if>
											<c:if test="${b.orderstate=='배송중' }"><button class="cart__list__orderbtn" onclick="DeliveryPage('${b.orderid}')">배송추적</button></c:if>
											<c:if test="${b.orderstate=='주문접수' }"><button type="button" class="cart__list__orderbtn" onclick="location.href='${pageContext.request.contextPath}/order/reqCancleOrder?orderid=${b.orderid}'">주문취소</button></c:if>
											</td>
										</tr>
									<c:set var="logcount" value="${logcount-1}"/>
									</c:forEach>
								</c:if>

								<c:if test="${empty li}">
									<tr>
										<td colspan="4" class="alt" height="100">최근 배송 내역이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<!-- //list  -->

						<!-- page -->

						
						<!-- //page -->
					</div>
					<!-- //right contents -->

				</div>
			</div>
		</div>

		<br>
	</div>

	<!-- 1대1 상담내역 기간별 조회 script -->
	<script>
    window.onload = function () {
    	var fromDate1 = document.getElementById("fromDate");
    	var toDate1 = document.getElementById("toDate");
    	
        if (fromDate1.value === "" || toDate1.value === "") {
        	setDefaultDate();
        } else {
        	var fromYear = document.getElementById("fromYear");
            var fromMonth = document.getElementById("fromMonth");
            var fromDay = document.getElementById("fromDay");

            var toYear = document.getElementById("toYear");
            var toMonth = document.getElementById("toMonth");
            var toDay = document.getElementById("toDay");
			
            var fromDateValue = fromDate1.value.split("-");
            var toDateValue = toDate1.value.split("-");
            
            setSelectOptions("fromYear", fromDateValue[0]);
            setSelectOptions("fromMonth", fromDateValue[1]);
            setSelectOptions("fromDay", fromDateValue[2]);

            setSelectOptions("toYear", toDateValue[0]);
            setSelectOptions("toMonth", toDateValue[1]);
            setSelectOptions("toDay", toDateValue[2]);
        } 
    }
    
    function setDefaultDate() {
        setDate(1, 0, 0); // 1년 전부터 ~ 현재까지
    }
	
    
    function setDate(yearDiff, monthDiff, dayDiff) {
        var toDate = new Date();
        var fromDate = new Date();

        fromDate.setYear(toDate.getFullYear() - yearDiff);
        fromDate.setMonth(toDate.getMonth() - monthDiff);
        fromDate.setDate(toDate.getDate() - dayDiff);

        setSelectOptions("fromYear", fromDate.getFullYear());
        setSelectOptions("fromMonth", fromDate.getMonth() + 1);
        setSelectOptions("fromDay", fromDate.getDate());

        setSelectOptions("toYear", toDate.getFullYear());
        setSelectOptions("toMonth", toDate.getMonth() + 1);
        setSelectOptions("toDay", toDate.getDate() + 1);
        
        // fromDate, toDate 의 value값 저장 
        var fromDateForm = document.getElementById("fromDate");
        var toDateForm = document.getElementById("toDate");
        
        fromDateForm.value = getSelectedDate("fromYear") + "-" + getSelectedDate("fromMonth") + "-" + getSelectedDate("fromDay");
        toDateForm.value = getSelectedDate("toYear") + "-" + getSelectedDate("toMonth") + "-" + getSelectedDate("toDay");
    }

    function setSelectOptions(elementId, value) {
        var selectElement = document.getElementById(elementId);
        
        if (selectElement) {
            const options = Array.from(selectElement.options);

            for (const option of options) {
                if (option.value == value) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            }
        } else {
            console.error('Element not found for elementId:', elementId);
        }
    }

    function goCounselList() {
        // 여기에 실제로 조회하는 로직 추가
        alert("조회 기간: " + getSelectedDate("fromYear") + "-" + getSelectedDate("fromMonth") + "-" + getSelectedDate("fromDay") +
            " ~ " + getSelectedDate("toYear") + "-" + getSelectedDate("toMonth") + "-" + getSelectedDate("toDay"));
    }

    function getSelectedDate(elementId) {
        return document.getElementById(elementId).value;
    }
</script>

</body>
</html>