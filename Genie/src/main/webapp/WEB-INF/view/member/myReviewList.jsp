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



</head>
<style>

.text-muted {
	color: #fc0;
	font-size: 1.0em; 
}


</style>
<body>


	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">

				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">내가 쓴 리뷰</p>
						<p class="counsel_mtitle">현재까지 내가 작성한 리뷰를 조회할 수 있으며 책 제목을 클릭하여 해당 리뷰를 상세보기할 수 있습니다.</p>
					</div>

					<!-- left contents -->


					<!-- left contents -->
			<div class="side_t2">
				<!-- sub navi -->
				<div class="cate_comm">
					<ul class="cate_d1">
						<li class="cate_d1_li open"><span class="cate_d1_link ">마이페이지</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberInfo'">마이페이지</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberUpdateForm'">회원정보수정</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberPassForm'">비밀번호변경</a></li>
								</ul>
							</div></li>
							
						<li class="cate_d1_li open"><span class="cate_d1_link ">내 판매 상품</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/userBook/book'">판매중인 도서 목록</a></li>
				
								</ul>
							</div></li>


						<li class="cate_d1_li open"><span class="cate_d1_link ">주문</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/slang'">찜목록</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/shoppingBasket'">장바구니</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/orderLog'">주문조회</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/pointLog'">포인트내역</a></li>
								</ul>
							</div></li>

						<li class="cate_d1_li open"><span class="cate_d1_link ">내 활동</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/list'">내 문의</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/myReview'">내가 쓴 리뷰</a></li>
								</ul>
							</div></li>


						<li class="cate_d1_li open"><span class="cate_d1_link "></span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</a></li>

									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberDeleteForm'">회원탈퇴</a></li>

								</ul>
							</div></li>

					</ul>

				</div>
				<!-- //sub navi -->

			</div>
			<!-- //left contents -->
 
					<!-- right contents -->
					<div class="con_t3">
						<h3 class="cateTit  mt10 mb15"></h3>

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
									<th>제목</th>
									<th>리뷰내용</th>
									<th>작성일자</th>
									<th>별점</th>
								</tr>
							</thead>
							
							<tbody>
								<c:if test="${not empty li}">
									<c:forEach var="b" items="${li}">
										<tr>
											
											<td></td>
											<td>${b.title }</td>
											<td><a href="${pageContext.request.contextPath}/book/index?booknum=${b.booknum}" style="text-decoration: underline;">${b.review}</td>
											<td>${b.reviewdate }</td>
											<td>	<div class="div_TOC_Short">
											<small class="text-muted ${b.point}"> </small>	

											<script>
												$(".0").html("&#9734; &#9734; &#9734; &#9734; &#9734;");
												$(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
												$(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
												$(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
												$(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
												$(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;"); 
											</script>
										</div></td>
										
										</tr>
									
									</c:forEach>
								</c:if>

								<c:if test="${empty li}">
									<tr>
										<td colspan="4" class="alt" height="100">작성 내역이 없습니다.</td>
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