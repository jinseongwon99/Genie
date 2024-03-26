<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지니</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardMain.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiry.css">

</head>
<body>

	<div id="wrap">
		<div id="counselBody">
			<div id="counselWrap">
				<!-- location -->

				<!-- //location -->
				<div class="conWrap p_event" id="selCSS2">

					<div class="counsel_box">
						<p class="counsel_title">이벤트</p>
						<p class="counsel_mtitle">${event.getTitle()}</p>
					</div>


					<!-- left contents -->
					<div>
						<br>

						<!-- event 내용 -->

						<div>
							<img
								src="${pageContext.request.contextPath}/image/event/content/${event.getContent()}"
								alt="이벤트 content" style="width: 1230px;">
						</div>

						<!-- //event banner -->

						<!-- //list area -->

					</div>
					<!-- //left contents -->

					<script>
						// 삭제 여부를 묻는 창
						function confirmDelete(eventId) {
							var result = confirm('삭제하시겠습니까?');

							if (result) { // 사용자가 확인을 선택한 경우 
								// 삭제 pro로 이동 
								window.location.href = '${pageContext.request.contextPath}/board/event/deletePro?eventId='
										+ eventId;

							} else {
								alert('취소되었습니다');
							}
						}
					</script>
					<span
						style="display: flex; align-items: center; justify-content: center;">
						
						<c:if test="${admin eq '1'}">
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/board/event/updateForm?eventId=${event.getEventId()}'"
							value="수정하기"
							style="margin: 5px; text-align: center; font: bolder 12px 돋움; height: 40px; text-decoration: none; border: 1px solid #8f8f8f; background: #9d9d9d; color: #fff !important; border-radius: 5px; padding: 4px 10px;">
							<span style="color: #fff; font-size: 15px !important">수정하기</span>
						</button>

						<button type="button"
							onclick="confirmDelete(${event.getEventId()})" value="삭제하기"
							style="margin: 5px; text-align: center; font: bolder 12px 돋움; height: 40px; text-decoration: none; border: 1px solid #8f8f8f; background: #9d9d9d; color: #fff !important; border-radius: 5px; padding: 4px 10px;">
							<span style="color: #fff; font-size: 15px !important">삭제하기</span>
						</button>
						</c:if>
						
						
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/board/event/main?page=${page}'"
							value="목록보기"
							style="margin: 5px; text-align: center; font: bolder 12px 돋움; height: 40px; text-decoration: none; border: 1px solid #8f8f8f; background: #9d9d9d; color: #fff !important; border-radius: 5px; padding: 4px 10px;">
							<span style="color: #fff; font-size: 15px !important">목록보기</span>
						</button>
					</span> <br>

					<!-- right contents -->

					<!-- //right contents -->
				</div>
			</div>
		</div>


	</div>


</body>
</html>