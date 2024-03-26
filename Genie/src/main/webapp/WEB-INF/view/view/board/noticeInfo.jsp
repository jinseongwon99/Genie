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


				<!-- 게시판 영역 -->
				<br> <br>
				<table width="750" border="0" cellpadding="0" cellspacing="0"
					class="table_comm_row">
					<colgroup>
						<col>
						<col width="120">
					</colgroup>
					<tbody>
						<tr>
							<td class="bbs_tit">${notice.getTitle()}</td>
							<td class="bbs_date">${notice.getCreateDate()}</td>
						</tr>
						<tr>
							<td class="bbs_con" colspan="2">
								<div class="bbs_con_w">
									<p class="바탕글">
										<span style="font-size: 16px;">${notice.getContent()}</span>
									</p>


								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- //boardList01 -->

				<br>

				<!-- btn -->
				<script>
					// 삭제 여부를 묻는 창
					function confirmDelete(noticeId) {
						var result = confirm('삭제하시겠습니까?');

						if (result) { // 사용자가 확인을 선택한 경우 
							// 삭제 pro로 이동 
							window.location.href = '${pageContext.request.contextPath}/board/notice/deletePro?noticeId=' + noticeId;
									
						} else {
							alert('취소되었습니다');
						}
					}
				</script>

				<form action="/front/help/helpNotice.do" name="listForm"
					method="post">
					<input type="hidden" name="bid" value="">
					<div class="al_right mt10">
					
						<c:if test="${admin eq '1'}">
						<a href="javascript:void(0);"
							onclick="location.href='${pageContext.request.contextPath}/board/notice/updateForm?page=${page}&noticeId=${notice.getNoticeId()}'"
							class="btn_gy_comm btype_a2">수정하기</a> <a href="javascript:void(0);"
							onclick="confirmDelete(${notice.getNoticeId()})"
							class="btn_gy_comm btype_a2">삭제하기</a> 
							</c:if>
							
							<a href="javascript:void(0);"
							onclick="location.href='${pageContext.request.contextPath}/board/notice/main?page=${page}'"
							class="btn_gy_comm btype_a2">목록보기</a>
					</div>
				</form>
				<!-- //btn -->


			</div>
			<!-- //right contents -->
		</div>


	</div>
</body>
</html>