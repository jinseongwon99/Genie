<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiry.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardEvent.css">

</head>
<body>
	<div id="wrap">
		<div id="contentBody">
			<div id="contentWrap">
				<div class="conWrap p_center" id="selCSS2">


					<!-- right contents -->
					<div id="conBig" style="width: 100%">

						<!-- 게시판 영역 -->
						<div class="counsel_box">
							<p class="counsel_title">진행중인 이벤트</p>
							<p class="counsel_mtitle">지니에서 진행하고 있는 이벤트를 확인하고 참여해보세요.</p>
						</div>


						<div class="pastEvent">
							<ul class="ingEvent">
								<!-- loop -->


								<c:forEach var="i" items="${eventList}">


								<li>
									<div class="event_img">
										<a
											href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/board/event/info?eventId=${i.getEventId()}'"><img
											alt="이벤트 이미지 배너"
											src="${pageContext.request.contextPath}/image/event/banner/${i.getImage()}"></a>

									</div>
									<p class="dp_ico"></p>
									<p class="dp_tit">${i.getTitle()}</p>
									<p class="mt5 t_gr"></p>
									<p class="dp_date">
										기간 : ${i.getStartDate()} ~ ${i.getEndDate()} <br>
									</p>
								</li>

								</c:forEach>



							</ul>
						</div>
						<!-- //boardList01 -->


						<!-- page -->
				<br>
				<div class="pageTypeA">
					<div>
						
						<!-- 
							[ 페이징 정보 ] 
							eventList = 이벤트 페이징 결과값 
							paging = 페이징 클래스 
							paging.getPage() = 현재 페이지 
							paging.getPageSize() = 총 페이징 넘버 개수
							paging.getRecordSize() = 페이지당 출력할 데이터의 개수
							
							paging.getOnePage() = 한페이지에 출력할 페이징 넘버의 개수 
							paging.getStartPage() = 현재 페이지의 페이징 시작번호 
							paging.getEndPage() = 현재 페이지의 페이징 끝 번호
							
						-->
						
						<!-- 1. 이전페이지(<<, <) 처리 -->
						<span class="prev-btn">
						<c:if test="${paging.getPage() <= paging.getPageSize() && paging.getPage() != 1}">
							<!-- 1 페이지(<<) 처리 -->
							<a href="${pageContext.request.contextPath}/board/event/main?page=1">
							<img src="${pageContext.request.contextPath}/image/paging/btn_pagePrevG.gif"></a>
							
							<!-- 이전페이지(<) 처리 -->
							<c:if test="${paging.getStartPage() > 1}">
							<a href="${pageContext.request.contextPath}/board/event/main?page=${paging.getStartPage() - 1}">
							<img src="${pageContext.request.contextPath}/image/paging/btn_pagePrev.gif"></a>
							</c:if>
						</c:if>
						</span>
						
						<!-- 2. 숫자 페이징 -->
						<span class="pageNum"> 
							<c:forEach var="i" begin="${paging.getStartPage()}" end="${paging.getEndPage() > paging.getPageSize() ? paging.getPageSize() : paging.getEndPage()}">
								<c:choose>
									<c:when test="${i == paging.getPage()}">
										<a class="on" href="${pageContext.request.contextPath}/board/event/main?page=${i}">${i}</a> 
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/board/event/main?page=${i}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					
						</span> <span class="next-btn"> 
						
						<!-- 3. 다음페이지(>) 처리 -->
						
						<c:if test="${paging.getPageSize() > paging.getOnePage() && paging.getEndPage() < paging.getPageSize()}">
							<a href="${pageContext.request.contextPath}/board/event/main?page=${paging.getEndPage() + 1}">
							<img src="${pageContext.request.contextPath}/image/paging/btn_pageNext.gif"></a>	
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
	</div>
</body>
</html>