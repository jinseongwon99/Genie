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
						<p class="counsel_title">1:1 상담</p>
						<p class="counsel_mtitle">불편 사항이나 문의 사항 남겨주시면 신속하고 친절하게 안내해
							드리겠습니다.</p>
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
					<div id="conBig" style="width: 100%;">

						<p class=" t_gr"></p>
						<div class="help">
							<img
								src="${pageContext.request.contextPath}/image/faq/helpContact_html_li_txt.png"
								alt="평일 17시 이후  문의 건은 익일 09시부터 순차적으로 답변이 가능합니다.
								토, 일요일 및 공휴일 문의는 평일 운영시간 내 순차적으로 답변이 가능합니다.
								상담하신 내용에 대한 답변은 기재하신 이메일 주소로 전송되며, [나의쇼핑> 1:1 상담내역] 에서 언제든지 확인이 가능합니다
								2018년 10월 18일부터 산업안전보건법에 고객응대 근로자 보호조치가 시행됩니다. 고객응대근로자에게 폭언을 하지 말아주세요. 
							"
								usemap="#li_img">

						</div>

						<p></p>
						<div class="boardRegisterDiv">
							<form name="inquiry"
								action="${pageContext.request.contextPath}/board/oneOnOne/inquiryPro"
								method="post">


								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="boardList07">

									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>

										<tr>
											<th>ID</th>
											<td class="td_L10">${member.userid}</td>
											<th>이름</th>
											<td class="td_L10 tdE">${member.name}</td>
										</tr>


										<tr>
											<td colspan="4" class="td_line"></td>
										</tr>


										<tr>
											<td colspan="4" class="td_line"></td>
										</tr>
										<tr>
											<th>상담유형</th>
											<td class="td_L10 tdE" colspan="3">
												<p id="cateIdSelectArea1" class="fl_left mr5">
													<select id="category" name="category"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
															value="">분류 선택</option>
														<option value="book">도서</option>
														<option value="order">주문 / 결제</option>
														<option value="member">회원</option>
														<option value="delivery">배송</option>
														<option value="etc">그 외</option>
													</select>
												</p>
												<p id="cateIdSelectArea2" class="fl_left mr5"></p>
											</td>
										</tr>
									</tbody>
								</table>
								<table id="0" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>

								</table>

								<c:if test="${!orderLog.isEmpty()}">
									<table id="2" class="boardList07" width="100%" border="0"
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
												<th>주문번호</th>
												<td class="td_L10 tdE">
													<p>

														<select name="orderId" id="orderId">
															<c:forEach var="i" items="${orderLog}">
																<option value="${i.getOrderid()}">${i.getOrderid()}</option>
															</c:forEach>
														</select> 
										
													</p>
													<p id="commentLength" class="al_right t_11gr"
														style="display: none";=""></p>
												</td>
											</tr>

										</tbody>
									</table>
								</c:if>




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
											<th>제목</th>
											<td class="td_L10 tdE"><input type="text" name="title"
												style="min-width: 350px;" maxlength="100">
												<p id="commentLength" class="al_right t_11gr"
													style="display: none";=""></p></td>
										</tr>
									</tbody>
								</table>
								<table id="5" class="boardList07" width="100%" border="0"
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
											<th>내용</th>
											<td class="td_L10 tdE"><textarea
													style="min-width: 600px; height: 240px;" name="content"></textarea>
											</td>
										</tr>
									</tbody>
								</table>

								<!-- btn area -->
								<div style="margin: 10px 300px;">
									<button type="submit" id="app" class="btnC mt25 mb25">
										<a>등록하기</a>
									</button>

								</div>

							</form>
						</div>



					</div>
					<!-- //right contents -->
				</div>
			</div>
		</div>

		<br>
	</div>



</body>
</html>