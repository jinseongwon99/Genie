<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardMain.css">

</head>
<body>
	<div id=wrap>
		<div id="faqBody">
			<div id="faqWrap">
				<!-- Location -->

				<!-- //location -->
				<div class="conWrap p_center" id="selCSS2">

					<div class="faq_box">
						<p class="faq_title">자주 찾는 질문 FAQ</p>
						<p class="faq_mtitle">궁금한 점 또는 필요한 내용을 선택하시면 좀 더 상세한 안내를
							도와드립니다.</p>
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
											<ul>
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/admin/Check'">도서
														등록 관리</a></li>
											</ul>
										</div></li>

								</c:if>


							</ul>

						</div>
						<!-- //sub navi -->

					</div>
					<!-- //left contents -->


					<!-- right contents -->

					<div id="conBig" style="width: 750px">

						<!-- searchTop -->
						<div class="boxShadowBr750 t_11gr" id="">
							<div class="con">
								<div class="searchTop">
									<div class="search2">

										<script>
										    function handleEnter(event) {
										        if (event.keyCode === 13) { // Enter 키의 keyCode는 13
										            submitForm();
										            return false;
										        }
										        return true;
										    }
										
										    function submitForm() {
										        document.FaqForm.submit();
										    }
										</script>

										<form name="FaqForm"
											action="${pageContext.request.contextPath}/board/faq/main"
											method="post">

											<p class="select">
												<select name="searchType">
													<option value=""
														${search.getSearchType() eq '' ? 'selected' : ''}>FAQ
														분류 선택</option>

													<option value="order"
														${search.getSearchType() eq 'order' ? 'selected' : ''}>주문/주문변경</option>

													<option value="pay"
														${search.getSearchType() eq 'pay' ? 'selected' : ''}>결제</option>

													<option value="delivery"
														${search.getSearchType() eq 'delivery' ? 'selected' : ''}>배송</option>

													<option value="returns"
														${search.getSearchType() eq 'returns' ? 'selected' : ''}>반품/교환</option>

													<option value="etc"
														${search.getSearchType() eq 'etc' ? 'selected' : ''}>기타</option>

												</select>
											</p>
											<p class="searchbox">
												<input type="text" name="searchKeyword"
													value="${key1}"
													style="margin-left: 10px; width: 500px;"
													onkeypress="return handleEnter(event)"> <a
													href="javascript:void(0);" onclick="submitForm();"><img
													src="${pageContext.request.contextPath}/image/faq/ico_search_1.png"
													class="al_middle" alt="검색"></a>
											</p>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- //searchTop -->
						<!-- right contents -->

						<!-- 상세 tab -->

						<div class="grayBox2">
							<div class="faqsubList">

								<ul>
									<li class="${category eq 'null' || category eq '' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category='">전체질문</a>
										</p>
									</li>
									<li class="${category == 'order' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=order'">주문/주문변경</a>
										</p>
									</li>
									<li class="${category == 'pay' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=pay'">결제</a>
										</p>
									</li>
									<li class="${category == 'delivery' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=delivery'">배송</a>
										</p>
									</li>
									<li class="${category == 'returns' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=returns'">반품/교환</a>
										</p>
									</li>
									<li class="${category == 'etc' ? 'on' : 'bl'}">
										<p>
											<a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=etc'">기타</a>
										</p>
									</li>

								</ul>
							</div>
						</div>

						<!-- //상세 tab -->
						<ul class="detailtab_sub">


						</ul>



						<!-- //상세 tab -->
						<script>
							$(document).ready(function() {
								$('.slideBtn').on('click', function() {
									var id = this.id.replace('slide', '');
									$(this).siblings('a').trigger("click");
									console.log($(this).siblings('a'));
								});
							});

							function openContent(bbsIdx, bid) {

								var sFrm = document.faqList;

								var bx = document.getElementById(bbsIdx);
								var target_img = document
										.getElementById("slide" + bbsIdx);

								if (bx.style.display == 'block') {
									bx.style.display = 'none';
									target_img.classList.remove('open');
								} else {
									bx.style.display = 'block';
									target_img.classList.add('open');
								}

								var param = {
									bid : bid,
									bbsidx : bbsIdx
								};

								if (update == false) {
									Bbs.updateBbsViewCnt(param, function() {
									});
									update = true;
								}
							}
						</script>

						<script>
										// 삭제 여부를 묻는 창
										function confirmDelete(faqId) {
											var result = confirm('삭제하시겠습니까?');
											
											
											if (result) {	// 사용자가 확인을 선택한 경우 
												// 삭제 pro로 이동 
												window.location.href='${pageContext.request.contextPath}/board/faq/deletePro?faqid=' + faqId;
											} else {
												alert('취소되었습니다');
											}
										} 
									</script>

						<form name="faqList" action="" method="get">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="boardList01 mt15">
								<colgroup>
									<col width="78">
									<col width="308">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>질문유형</th>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>
									<!-- loop -->



									<!-- 
											Faq 
											1) faqList : faq 리스트 
									 -->

									<c:forEach var="i" items="${faqList}">
										<tr>
											<td>${i.getFaqId()}</td>
											<td><c:choose>
													<c:when test="${i.getCategory() eq 'order'}">
													주문/주문변경	
												</c:when>
													<c:when test="${i.getCategory() eq 'pay'}">
													결제	
												</c:when>
													<c:when test="${i.getCategory() eq 'delivery'}">
													배송	
												</c:when>
													<c:when test="${i.getCategory() eq 'returns'}">
													반품/교환	
												</c:when>
													<c:when test="${i.getCategory() eq 'etc'}">
													기타	
												</c:when>
												</c:choose></td>
											<td class="td_L20"><a href="javascript:void(0);"
												onclick="openContent('${i.getFaqId()}', '4014');">${i.getQuestion()}</a>

												<div class="slideBtn" id="slide12366"></div></td>
										</tr>
										<tr>
											<td colspan="3" class="line"></td>
										</tr>

										<tr>
											<td colspan="3" class="reply_con">
												<div class="reply" id="${i.getFaqId()}">
													내용:
													<p>&nbsp;</p>
													<textarea rows="20" cols="100" name="answer"
												style="min-width: 350px;" maxlength="1000">${i.getAnswer()}</textarea>




													<div class="con">
														<p class="counsel">
															답변이 충분하지 않으셨나요? <a href="javascript:void(0);"
																onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/inquiryForm'"><b>1:1
																	상담 문의</b></a>


															<c:if test="${admin eq '1'}">
																<a href="javascript:void(0);"
																	onclick="location.href='${pageContext.request.contextPath}/board/faq/updateForm?faqid=${i.getFaqId()}'"><b>수정하기</b></a>
																<a href="javascript:void(0);"
																	onclick="confirmDelete(${i.getFaqId()})"><b>삭제하기</b></a>
															</c:if>
														</p>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

									<c:if test="${faqList == null or faqList.isEmpty()}">
										<tr>
											<td colspan="3">등록된 글이 없습니다.</td>
										</tr>
										<tr>
											<td colspan="3" class="line"></td>
										</tr>
									</c:if>

									<%-- <tr>
										<td>108</td>
										<td>회원 &gt; 회원가입/실명인증</td>
										<td class="td_L20"><a href="<%%>"
											onclick="openContent('12366', '4014');">14세 미만 회원 가입은 어떻게
												하나요?</a>

											<div class="slideBtn" id="slide12366"></div></td>
									</tr>
									<tr>
										<td colspan="3" class="line"></td>
									</tr>

									<tr>
										<td colspan="3" class="reply_con">
											<div class="reply" id="12366">
												내용:
												<p>&nbsp;</p>
												<p>
													14세 미만의&nbsp;회원님께서는 보호자 동의서를 제출하셔야 회원가입이 완료되어 정상적인 구매활동이
													가능합니다. <br> <br>
												</p>
												<p>
													회원 가입 후 가족관계 증명서와 동의서를 작성하셔서&nbsp;FAX 로 보내주시면&nbsp;처리해
													드립니다.&nbsp;<br>
												</p>
												<p>
													■ FAX : &nbsp;02-720-0073<br>
												</p>
												<p>
													<br>■ <a
														href="//www.bandinlunis.com/download/consent.doc"
														target="_blank"><u>보호자 동의서 다운로드</u></a>
												</p>
												<div class="con">
													<p class="counsel">
														답변이 충분하지 않으셨나요? <a href="/front/help/helpContactUsForm.do"><b>1:1
																상담 문의</b></a>
													</p>
												</div>
											</div>
										</td>
									</tr> --%>

									<!-- //loop -->

								</tbody>
							</table>
						</form>
						<!-- //boardList01 -->

						<!-- page -->
						<br>
						<div class="pageTypeA">
							<div>
								
								<!-- 
							[ 페이징 정보 ] 
							faqList = faq 페이징 결과값 
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
										onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=${category}&key=${key1}&page=1'">
										<img
										src="${pageContext.request.contextPath}/image/paging/btn_pagePrevG.gif">
									</a>

									<!-- 이전페이지(<) 처리 -->
									<c:if test="${paging.getStartPage() > 1}">
									<a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=${category}&key=${key1}&page=${paging.getStartPage() - 1}'">
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
												<a class="on" href=""
													onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=${category}&key=${key1}&page=${i}'">${i}</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=${category}&key=${key1}&page=${i}'">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</span> <span class="next-btn"> <!-- 3. 다음페이지(>) 처리 --> <c:if
										test="${paging.getPageSize() > paging.getOnePage() && paging.getEndPage() < paging.getPageSize()}">
										<a href="javascript:void(0);"
											onclick="location.href='${pageContext.request.contextPath}/board/faq/main?category=${category}&key=${key1}&page=${paging.getEndPage() + 1}'">
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
		</div>
	</div>
</body>
</html>