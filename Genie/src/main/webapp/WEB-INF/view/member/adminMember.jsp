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
						<p class="faq_title">고객 정보 관리</p>
						<p class="faq_mtitle">관리자 페이지</p>
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

											function pagingSearch(url) {

												var type = document
														.querySelector('select[name="searchType"]').value;
												var key = document
														.querySelector('input[name="searchKeyword"]').value;

												window.location.href = url
														+ "&key=" + key
														+ "&type=" + type;
											}
										</script>
										<br>
										<form name="FaqForm"
											action="${pageContext.request.contextPath}/admin/member?page="
											method="post">

											<p class="select">
												<select name="searchType">
													<option value=""
														${search.getSearchType() eq '' ? 'selected' : ''}>고객
														분류 선택</option>

													<option value="userId"
														${search.getSearchType() eq 'userId' ? 'selected' : ''}>아이디</option>

													<option value="name"
														${search.getSearchType() eq 'name' ? 'selected' : ''}>이름</option>

												</select>
											</p>
											<p class="searchbox">
												<input type="text" name="searchKeyword"
													value="${search.getSearchKeyword()}"
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
							function confirmDelete(userid) {
								var result = confirm(userid + '님을 강제 탈퇴하시겠습니까?');

								if (result) { // 사용자가 확인을 선택한 경우 
									// 삭제 pro로 이동 
									window.location.href = '${pageContext.request.contextPath}/admin/adminMemDeletePro?userid='
											+ userid;
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
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>포인트</th>
									</tr>
								</thead>
								<tbody>
									<!-- loop -->



									<!-- 
											Faq 
											1) faqList : faq 리스트 
									 -->

									<c:forEach var="i" items="${memberList}">
										<tr>
											<td><a href="javascript:void(0);"
												onclick="openContent('${i.getUserid()}', '4014');">${i.getUserid()}</a></td>
											<td><a href="javascript:void(0);"
												onclick="openContent('${i.getUserid()}', '4014');">${i.getName()}</a></td>
											<td><a href="javascript:void(0);"
												onclick="openContent('${i.getUserid()}', '4014');">${i.getEmail()}</a></td>
											<td class="td_L20" style="text-align: center;"><a
												href="javascript:void(0);"
												onclick="openContent('${i.getUserid()}', '4014');">${i.getPoint()}</a>
												<div class="slideBtn" id="slide12366"></div></td>


										</tr>
										<tr>
											<td colspan="4" class="line"
												style="height: 0.95px !important;"></td>
										</tr>

										<tr>
											<td colspan="4" class="reply_con">
												<div class="reply" id="${i.getUserid()}"
													style="padding: 10px 50px 10px 50px;">
													포인트 내역 <span style="font-size:13px">[최근 10건]</span>
													<p>&nbsp;</p>

													<!--  포인트 내역 table -->
													<table width="760" border="0" cellpadding="0"
														cellspacing="0" class="table_comm" style="margin: 0 auto;">
														<colgroup>
															<col width="120">
															<col width="200">
															<col width="80">
															<col width="100">
														</colgroup>
														<thead>
															<tr>
																<th
																	style="background: #f1f1f1; font-size: 16px; text-align: center;">적립일</th>
																<th
																	style="background: #f1f1f1; font-size: 16px; text-align: center;">주문번호</th>

																<th
																	style="background: #f1f1f1; font-size: 16px; text-align: center;">구분</th>
																<th
																	style="background: #f1f1f1; font-size: 16px; text-align: center;">금액</th>
															</tr>
														</thead>
														<tbody>

															<!-- loop -->


														<c:forEach var="b" items="${logMap[i.userid] }">
															<tr>
																<td style="border: 0.5px solid #f1f1f1;">${b.regdate }</td>
																<td style="border: 0.5px solid #f1f1f1;">${b.orderid == null ? b.orderlogid : b.orderid}</td>
																<td style="border: 0.5px solid #f1f1f1;">${b.changepoint>0?'획득':'사용' }</td>
																<td style="border: 0.5px solid #f1f1f1;"><strong>${b.changepoint }</strong></td>
															</tr>
														</c:forEach>
														</tbody>
													</table>
													<!--  //포인트 내역 table -->


													<div class="con" style="text-align: right;">
														<p class="counsel">

															<a href="javascript:void(0);"
																onclick="location.href='${pageContext.request.contextPath}/admin/adminMemUpdateForm?userid=${i.getUserid()}'"><b>고객
																	정보수정</b></a> <a href="javascript:void(0);"
																onclick="confirmDelete(${i.getUserid()})"><b>강제탈퇴</b></a>

														</p>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

									<c:if test="${memberList == null or memberList.isEmpty()}">
										<tr>
											<td colspan="4">조회한 고객정보가 없습니다.</td>
										</tr>
										<tr>
											<td colspan="4" class="line"></td>
										</tr>
									</c:if>


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
										onclick="pagingSearch('${pageContext.request.contextPath}/admin/member?page=1')">
										<img
										src="${pageContext.request.contextPath}/image/paging/btn_pagePrevG.gif">
									</a>

									<!-- 이전페이지(<) 처리 -->
									<c:if test="${paging.getStartPage() > 1}">
									<a href="javascript:void(0);"
										onclick="pagingSearch('${pageContext.request.contextPath}/admin/member?page=${paging.getStartPage() - 1}')">
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
													onclick="pagingSearch('${pageContext.request.contextPath}/admin/member?page=${i}')">${i}</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0);"
													onclick="pagingSearch('${pageContext.request.contextPath}/admin/member?page=${i}')">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>

								</span> <span class="next-btn"> <!-- 3. 다음페이지(>) 처리 --> <c:if
										test="${paging.getPageSize() > paging.getOnePage() && paging.getEndPage() < paging.getPageSize()}">
										<a href="javascript:void(0);"
											onclick="pagingSearch('${pageContext.request.contextPath}/admin/member?page=${paging.getEndPage() + 1}')">
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