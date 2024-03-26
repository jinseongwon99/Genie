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
	href="${pageContext.request.contextPath}/css/boardNotice.css">

</head>
<body>
	<div id=wrap>

		<div class="conWrap p_center" id="selCSS2">
			<div class="notice_box">
				<p class="notice_title">공지사항</p>
				<p class="notice_mtitle">지니의 공지사항을 전해드립니다.</p>
			</div>

			<!-- left contents -->

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
			<div id="conBig" style="width: 750px; font-size: 18px;">
				<br>

				<!-- 게시판 영역 -->

				<script>
					// 검색 버튼 클릭시 실행
					function submitForm() {
						document.searchform.submit();
					}
				</script>

				<form action="${pageContext.request.contextPath}/board/notice/main"
					name="searchform" method="post">
					<div class="al_right mb5" style="margin: 0 0 15px 0;">

						<!-- searchType -->
						<select id="searchType" name="searchType" style="height: 26px;">
							<option value=""
								${search.getSearchType() eq 'all' || search.getSearchType().isEmpty() ? 'selected' : ''}>전체</option>
							<option value="title"
								${search.getSearchType() eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content"
								${search.getSearchType() eq 'content' ? 'selected' : '' }>내용</option>
						</select>

						<!-- keyword -->
						<input style="height: 24px;" type="text" name="searchKeyword"
							size="30" class="o_input" id="search"
							value="${search.getSearchKeyword()}"> <input
							type="button" class="btn_gy_comm btype_a2 hand" value="검색"
							onclick="submitForm()">

					</div>
				</form>


				<table width="750" border="0" cellpadding="0" cellspacing="0"
					class="table_comm">
					<colgroup>
						<col width="94">
						<col width="">
						<col width="130">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<!-- loop -->

						<!-- 
							[ 공지사항 list ] 
							noticeList = 공지사항 페이징 결과값 
							paging = 페이징 클래스 
							paging.getPage = 현재 페이지 
							paging.getPageSize = 페이징 개수
							paging.getRecordSize = 페이지당 출력할 데이터의 개수
						-->
						<c:forEach var="i" items="${noticeList}">

							<tr>
								<td>${i.getNoticeId()}</td>
								<td class="t_left"><a href="javascript:void(0);"
									onclick="location.href='${pageContext.request.contextPath}/board/notice/info?page=${paging.getPage()}&noticeid=${i.getNoticeId()}'">${i.getTitle()}</a></td>
								<td style="font-size: 16px;">${i.getCreateDate()}</td>
							</tr>
						</c:forEach>


						<c:if test="${noticeList.isEmpty()}">
							<tr>
								<td colspan="3" style="text-align: center;">등록된 글이 없습니다.</td>
							</tr>
						</c:if>

						<!-- //loop -->
					</tbody>
				</table>

				<!-- //boardList01 -->

				<!-- page -->
				<br>
				<div class="pageTypeA">
					<div>
						

						<!-- 
							[ 페이징 정보 ] 
							noticeList = 공지사항 페이징 결과값 
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
						<c:if
									test="${paging.getPage() <= paging.getPageSize() && paging.getPage() != 1}">
							<!-- 1 페이지(<<) 처리 -->
							<a href="javascript:void(0);"
								onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=1'">
								<img
								src="${pageContext.request.contextPath}/image/paging/btn_pagePrevG.gif">
							</a>

							<!-- 이전페이지(<) 처리 -->
							<c:if test="${paging.getStartPage() > 1}">
							<a href="javascript:void(0);"
								onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=${paging.getStartPage() - 1}'">
								<img
								src="${pageContext.request.contextPath}/image/paging/btn_pagePrev.gif">
							</a>
							</c:if>
						</c:if>
						</span>

						
						<!-- 2. 숫자 페이징 -->
						<span class="pageNum"> <c:forEach var="i"
								begin="${paging.getStartPage()}"
								end="${paging.getEndPage() > paging.getPageSize() ? paging.getPageSize() : paging.getEndPage()}">
								<c:choose>
									<c:when test="${i == paging.getPage()}">
										<a class="on" href="#"
											onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=${i}'">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0);"
											onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=${i}'">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</span> <span class="next-btn"> <!-- 3. 다음페이지(>) 처리 --> <c:if
								test="${paging.getPageSize() > paging.getOnePage() && paging.getEndPage() < paging.getPageSize()}">
								<a href="javascript:void(0);"
									onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=${paging.getEndPage() + 1}'">
									<img
									src="${pageContext.request.contextPath}/image/paging/btn_pageNext.gif">
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
</body>
</html>