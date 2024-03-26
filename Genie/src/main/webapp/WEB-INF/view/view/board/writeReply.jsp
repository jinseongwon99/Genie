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

					<div id="conBig"
						style="width: 1001px !important; padding-left: 27px !important;">

						<p class=" t_gr"></p>

						<p></p>
						<div class="boardRegisterDiv">


							<!-- 1대1문의 질문 info -->
							<!-- list  -->
							<p
								style="font-family: Noto Sans; font-size: 16px; font-weight: 600; text-align: center; margin-top: 20px; color: #8c7e7e;">1:1
								문의 내용</p>

							<table width="760" border="0" cellpadding="0" cellspacing="0"
								class="table_comm">

								<thead>
									<tr>
										<th style="width: 10%;">상담일자</th>
										<th style="width: 20%;">아이디</th>
										<th style="width: 10%;">상담종류</th>
										<th style="width: 20%;">주문번호</th>
										<th>제목</th>
									</tr>
								</thead>
								<tbody>


									<!-- 문의 질문 -->
									<tr>
										<td>${inquiry.getCreateDate()}</td>
										<td>${inquiry.getUserId()}</td>
										<td>${inquiry.getCategoryName(inquiry.getCategory())}</td>
										<td>${inquiry.getOrderId()}</td>
										<td>${inquiry.getTitle()}</td>
									</tr>


									<!-- 1대1 문의/답변 open -->

									<tr>
										<td class="manageQues t_left" colspan="5"
											id="${inquiry.getInquiryId()}">

											<div class="ques">
												<strong>${inquiry.getTitle()}</strong>
												<p>${inquiry.getContent()}</p>

											</div>

										</td>
									</tr>

								</tbody>
							</table>
							<!-- //list  -->


							<p
								style="font-family: Noto Sans; margin-top: 80px; margin-bottom: 20px; font-size: 16px; font-weight: 600; text-align: center; color: #8c7e7e;">1:1
								문의 답변 작성</p>

							<!-- reply 입력form -->
							<form name="reply"
								action="${pageContext.request.contextPath}/board/oneOnOne/replyPro"
								method="post">
								<input type="hidden" name="inquiryId"
									value="${inquiry.getInquiryId()}">

								<table id="5" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0" style="margin-left: 50px;">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>

										<tr>
											<th style="text-align: center !important;">답변 내용 :</th>
											<td class="td_L10 tdE"><textarea
													style="min-width: 600px; height: 240px;"
													name="replyContent"></textarea></td>
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