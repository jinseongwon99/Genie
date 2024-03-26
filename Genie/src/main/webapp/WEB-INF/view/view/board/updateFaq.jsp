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




</head>
<body>

	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">


				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">FAQ 수정</p>
						<p class="counsel_mtitle">관리자 전용 - FAQ 수정</p>
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
					<br>
					<div id="conBig" style="width: 100%;">

						<p class=" t_gr"></p>

						<p></p>
						<div class="boardRegisterDiv">
							<form name="faq"
								action="${pageContext.request.contextPath}/board/faq/updatePro?faqid=${faq.getFaqId()}"
								method="post">


								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="boardList07">

									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>

								</table>
								<table id="0" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>

								</table>


								<!-- 카테고리 -->
								<table id="1" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>카테고리</th>
											<td class="td_L10 tdE" colspan="3">
												<p id="cateIdSelectArea1" class="fl_left mr5">
													<select id="category" name="category"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333;">
														<option
															value="">분류 선택</option>
														<option value="order" ${faq.getCategory() eq 'order' ? 'selected' : ''}>주문/주문변경</option>
														<option value="pay" ${faq.getCategory() eq 'pay' ? 'selected' : ''}>결제</option>
														<option value="delivery" ${faq.getCategory() eq 'delivery' ? 'selected' : ''}>배송</option>
														<option value="returns" ${faq.getCategory() eq 'returns' ? 'selected' : ''}>반품/교환</option>
														<option value="etc" ${faq.getCategory() eq 'etc' ? 'selected' : ''}>기타</option>
													</select>
												</p>
												<p id="cateIdSelectArea2" class="fl_left mr5"></p>
											</td>
										</tr>
									</tbody>
								</table>


								<!-- 질문 -->
								<table id="1" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>FAQ 질문</th>
											<td class="td_L10 tdE"><input type="text" name="question" value="${faq.getQuestion()}"
												style="min-width: 350px;" maxlength="100">
												<p id="commentLength" class="al_right t_11gr"
													style="display: none"></p></td>
										</tr>
									</tbody>
								</table>

								<!-- 답변 -->
								<table id="1" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>FAQ 답변</th>
											<td class="td_L10 tdE"><input type="text" name="answer" value="${faq.getAnswer()}"
												style="min-width: 350px;" maxlength="1000">
												<p id="commentLength" class="al_right t_11gr"
													style="display: none"></p></td>
										</tr>
									</tbody>
								</table>

								
								<!-- btn area -->
								<div style="margin: 10px 300px;">
									<button type="submit" id="app" class="btnC mt25 mb25">
										<a>수정하기</a>
									</button>

								</div>

							</form>
						</div>
						
						<br><br><br><br><br><br><br><br>


					</div>
					<!-- //right contents -->
				</div>
			</div>
		</div>

		<br>
	</div>
</body>


</html>