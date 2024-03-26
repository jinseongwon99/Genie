<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
<body>


	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">

				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">1:1 상담 답변 등록</p>
						<p class="counsel_mtitle">관리자 전용 - 1:1 상담 답변 등록</p>
					</div>

					<!-- left contents -->

					<div class="side_t2">
						<!-- sub navi -->
						<div class="cate_comm">
							<ul class="cate_d1">
								<li class="cate_d1_li open"><span class="cate_d1_link ">자주
										찾는 질문 FAQ</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main'">FAQ</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/faq/writeForm'">FAQ
														등록</a></li>
											</c:if>
										</ul>
									</div></li>


								<li class="cate_d1_li open"><span class="cate_d1_link ">1:1
										상담</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/inquiryForm'">1:1
													상담하기</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList'">1:1
														상담 답변등록</a></li>
											</c:if>

											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/list'">1:1
													상담내역</a></li>
										</ul>
									</div></li>

								<li class="cate_d1_li open"><span class="cate_d1_link ">공지사항</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/notice/main'">공지사항</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/notice/writeForm'">공지사항
														등록</a></li>
											</c:if>

										</ul>
									</div></li>


								<li class="cate_d1_li open"><span class="cate_d1_link ">이벤트</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/event/main'">이벤트</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/event/writeForm'">이벤트
														등록 </a></li>
											</c:if>
										</ul>
									</div></li>

							

								<c:if test="${admin eq '1'}">
									<li class="cate_d1_li open"><span class="cate_d1_link ">고객
											관리</span>
										<div class="cate_d2">
											<ul>
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/admin/member'">고객
														정보 관리</a></li>
											</ul>
										</div></li>

									<li class="cate_d1_li open"><span class="cate_d1_link ">도서
											관리</span>
										<div class="cate_d2">
											<ul>
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/admin/book'">도서
														정보 관리</a></li>
											</ul>
										</div></li>

								</c:if>


							</ul>

						</div>
						<!-- //sub navi -->

					</div>
					<!-- //left contents -->

					<!-- right contents -->
					<div class="con_t3">

						<!-- tab -->
						<div class="al_right"></div>
						<!-- list  -->
						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="table_comm mt10">
							<colgroup>
								<col width="100">
								<col width="150">
								<col width="70">
								<col width="150">
								<col width="300">
								<col width="70">
							</colgroup>
							<thead>
								<tr>
									<th>상담일자</th>
									<th>아이디</th>
									<th>상담종류</th>
									<th>주문번호</th>
									<th>제목</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>


								<!-- loop -->


								<!-- 1대1 문의 리스트 
									
									1) DB 결과값 변수 : inquiryList 
									ㄴ 객체 : Inquiry
									
								-->
								<c:if test="${not empty inquiryList}">

									<c:forEach var="i" begin="0" end="${inquiryList.size()-1}">
										<tr style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyForm?page=${paging.getPage()}&inquiryid=${inquiryList.get(i).getInquiryId()}'">
											<td>${inquiryList.get(i).getCreateDate()}</td>
											<td>${inquiryList.get(i).getUserId()}</td>
											<td>${inquiryList.get(i).getCategoryName(inquiryList.get(i).getCategory())}</td>
											<td>${inquiryList.get(i).getOrderId()}</td>
											<td class="t_left">${inquiryList.get(i).getTitle()}</td>
											<td class="alt">${inquiryList.get(i).getResponseStatus() == 0 ? "답변대기" : "답변완료" }</td>
										</tr>


									</c:forEach>
								</c:if>

								<c:if test="${empty inquiryList}">
									<tr>
										<td colspan="6" class="alt" height="100">답변 할 문의 내역이
											없습니다.</td>
									</tr>
								</c:if>


							</tbody>
						</table>
						<!-- //list  -->
<br>


						<!-- page -->
						<div class="pageTypeA">
						<div>
						<!-- [ 페이징 정보 ] 
							noticeList = 공지사항 페이징 결과값 
							paging = 페이징 클래스 
							paging.getPage() = 현재 페이지 
							paging.getPageSize() = 총 페이징 넘버 개수
							paging.getRecordSize() = 페이지당 출력할 데이터의 개수
							
							paging.getOnePage() = 한페이지에 출력할 페이징 넘버의 개수 
							paging.getStartPage() = 현재 페이지의 페이징 시작번호 
							paging.getEndPage() = 현재 페이지의 페이징 끝 번호 -->
							
								<!-- 1. 이전페이지(<<, <) 처리 -->
								<span class="prev-btn"> 
									<c:if test="${paging.getPage() <= paging.getPageSize() && paging.getPage() != 1}">
										<!-- 1 페이지(<<) 처리 -->
										<a href="javascript:void(0);"
											onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList?page=1'">
											<img
											src="${pageContext.request.contextPath}/image/paging/btn_pagePrevG.gif">
										</a>
	
										<!-- 이전페이지(<) 처리 -->
										<c:if test="${paging.getStartPage() > 1}">
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList?page=${paging.getStartPage() - 1}'">
												<img src="${pageContext.request.contextPath}/image/paging/btn_pagePrev.gif">
											</a>
										</c:if>
									</c:if>
								</span>

								<!-- 2. 숫자 페이징 -->
								<span class="pageNum"> 
									<c:forEach var="i" begin="${paging.getStartPage()}"
										end="${paging.getEndPage() > paging.getPageSize() ? paging.getPageSize() : paging.getEndPage()}">
										<c:choose>
											<c:when test="${i == paging.getPage()}">
												<a class="on" href="#"
													onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList?page=${i}'">${i}</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList?page=${i}'">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</span> 
								
								<!-- 3. 다음페이지(>) 처리 -->
								<span class="next-btn"> 
									<c:if test="${paging.getPageSize() > paging.getOnePage() && paging.getEndPage() < paging.getPageSize()}">
										<a href="javascript:void(0);"
											onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList?page=${paging.getEndPage() + 1}'">
											<img src="${pageContext.request.contextPath}/image/paging/btn_pageNext.gif">
										</a>
									</c:if>
								</span>
							</div>
						</div>
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
        setSelectOptions("toDay", toDate.getDate());
        
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