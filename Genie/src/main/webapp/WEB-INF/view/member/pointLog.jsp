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
	function DeliveryPage(orderid) {
		var url = 'http://nplus.doortodoor.co.kr/web/detail.jsp?slipno='
				+ orderid;
		window.open(url);
	}
</script>

<%	
	String id = (String) session.getAttribute("userid");
%>

</head>
<body>


	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">

				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">포인트 획득/사용 내역 조회</p>
						<p class="counsel_mtitle">포인트 획득 및 사용에 관한 내역을 조회하실 수 있습니다.</p>
						<p class="counsel_mtitle">내역은 최근 3개월간의 내역만 공개됩니다.</p>
					</div>

					<!-- left contents -->


					<!-- left contents -->
					<div class="side_t2">
						<!-- sub navi -->
						<div class="cate_comm">
							<ul class="cate_d1">
								<li class="cate_d1_li open"><span class="cate_d1_link on"><a
										href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/orderLog'">주문
											기록 조회</a></span></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">주문
										기록 조회</span>
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
										onclick="location.href='${pageContext.request.contextPath}/board/notice/main'">포인트획득내역</a></span></li>
								<li class="cate_d1_li open"><span class="cate_d1_link "><a
										href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/board/event/main'">포인트사용내역</a></span></li>

							</ul>

						</div>
						<!-- //sub navi -->

					</div>
					<!-- //left contents -->

					<!-- right contents -->
					<h3 class="cateTit  mt10 mb15">
						<span style="font-size: 20px; margin-left: 20px;" ><%=id %>님의
							MyPage</span> <span class="t_11gr t_normal" style="font-size: 20px;">|
						</span>
					</h3>

					<div class="box_summery al_center mb15" style="text-align: center;">
						등급 : <strong class="price" style="font-size: 18px;">${totalpoint>300000?'VIP':totalpoint>100000?'플래티넘':totalpoint>30000?'골드':totalpoint>10000?'실버':'브론즈' }</strong>
						<br /> <span class="ml40">누적 포인트 : <strong class="price"
							style="font-size: 18px;"> <strong>${totalpoint }</strong>

						</strong>
						</span> <br /> <span class="ml40">보유 포인트 : <strong class="price"
							style="font-size: 18px;"> <strong>${point }</strong>

						</strong>
						</span>
					</div>

					<div class="con_t3">
						<!-- tab -->
						<div class="al_right"></div>
						<!-- list  -->
						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="table_comm mt10">
							<colgroup>
								<col width="150">
								<col width="150">
								<col width="150">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th>일자</th>
									<th>주문번호</th>
									<th>주문id</th>
									<th>포인트</th>
									<th>구분</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${not empty li}">
									<c:forEach var="b" items="${li}">
										<tr>
											<td>${b.regdate }</td>
											<td>${b.orderid }</td>
											<td>${b.orderlogid }</td>
											<td>${b.changepoint }</td>
											<td>${b.changepoint>0 ? '획득':'사용' }</td>
										</tr>
									</c:forEach>
								</c:if>

								<c:if test="${empty li}">
									<tr>
										<td colspan="4" class="alt" height="100">최근 포인트 획득/사용 내역이
											없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<!-- //list  -->

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