<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/bookList.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/NewFile.css">




<style>
.conWrap {
	width: 1230px !important;
	margin: 20px auto;
}

.faq_box {
	width: 1230px;
	height: 160px;
	border: 1px solid #e5e5e5;
	background: #e5e5e5;
}

.faq_box .faq_title {
	font-family: Noto Sans;
	font-size: 36px;
	font-weight: 600;
	text-align: center;
	margin: 50px 0 0 0;
	color: #8c7e7e;
}

.faq_box .faq_mtitle {
	font-family: Noto Sans;
	font-size: 16px;
	font-weight: 600;
	text-align: center;
	margin: 23px 0 0 0;
	color: #8c7e7e;
}

.Ere_space70 {
	margin: 0;
	padding: 0;
	height: 600px;
}

.buttoninfo {
	background-color: #002c6a;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.summaryinput {
	width: 100%;
	height: 6.25em;
	border: 2px solid rgb(213, 194, 194);
	resize: none;
	outline-color: #002c6a;
}

.help-tip {
	position: absolute;
	bottom: 839px;
	left: 987px;
	text-align: center;
	background-color: #BCDBEA;
	border-radius: 50%;
	width: 24px;
	height: 24px;
	font-size: 14px;
	line-height: 26px;
	cursor: pointer;
}

.help-tip:before {
	content: '?';
	font-weight: bold;
	color: #fff;
}

.table-tooltip {
	display: none;
	position: relative;
	bottom: 610px;
	left: 515px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	z-index: 999;
}

.help-tip:hover+.table-tooltip {
	display: block;
}
</style>
<style>
.Ere_space70 {
	margin: 0;
	padding: 0;
	height: 600px;
}

.container1 {
	max-width: 1000px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* 변경: 오른쪽 마진을 추가하여 오른쪽으로 늘리기 */
	margin-left: 250px;
}

.rating-container {
	margin-bottom: 20px;
}

.review-container {
	margin-bottom: 20px;
}

textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.review {
	background-color: #002c6a;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
/* component */
.star-rating {
	border: none;
	display: flex;
	flex-direction: row-reverse;
	font-size: 2em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #fc0;
}

.Ere_btn_register {
	display: inline-block;
	*zoom: 1;
	*display: inline;
	padding: 0;
	vertical-align: middle;
	text-align: center;
	overflow: hidden;
	text-decoration: none;
	cursor: pointer;
	background: #0fa8ff;
}

.Ere_btn_register button {
	white-space: nowrap;
	text-decoration: none;
	outline: 0;
	color: #FFF;
	font-size: 15px;
	font-weight: bold;
	font-family: malgun, "Malgun Gothic", Dotum, 돋움, sans-serif;
	line-height: 1.5;
	display: block;
	white-space: nowrap;
	background: #0fa8ff;
	margin: 0;
	width: 95px;
	padding: 23px 0px 22px 0px;
}

.text-muted {
	color: #fc0;
	font-size: 1.4em; /* 크기를 2em으로 지정합니다. */
	/* 다른 스타일을 필요에 따라 추가할 수 있습니다. */
}

/* .highlight 클래스에 대한 스타일 */
.highlight {
	color: #fc0;
	font-size: 1.4em; /* 크기를 2em으로 지정합니다. */
	font-weight: bold; /* 예시로 글꼴을 굵게 지정했습니다. */
}

.discount {
	color: red;
}

.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}

.star-ratings-fill span {
	font-size: 25px; /* 원하는 크기로 조정 */
}

.star-ratings-base span {
	z-index: 0;
	padding: 0;
	font-size: 25px; /* 원하는 크기로 조정 */
}

#cartbutton{

	width:100.59px !important;
	height:57.89px !important;
}
</style>
<script>
<!--최소값-->
	let currentAmount = 0;

	function updateAmount() {
		let inputAmount = parseInt(document.getElementById('amount').value) || 0;
		currentAmount = Math.max(0, inputAmount);
		document.getElementById('amount').value = currentAmount;
	}

	// 예시로 동적으로 변경되는 값 (r.point)을 설정
	var dynamicValue = "highlight"; // 이 값을 변경하여 테스트

	// 해당 값을 가지고 클래스를 동적으로 변경
	$(document).ready(function() {
		$(".text-muted").addClass(dynamicValue);
	});
</script>
	<script>
								// 삭제폼 
								function deleteForm(booknum) {
									// 확인 대화 상자를 표시하여 사용자에게 삭제 여부를 물음
									var result = confirm("삭제하시겠습니까?");
					
									// 사용자가 확인을 선택한 경우
									if (result) {
										
										// 삭제 pro로 이동 
										window.location.href = "${pageContext.request.contextPath}/userBook/bookDeletePro?booknum=" + booknum;

									} else {
										// 사용자가 취소를 선택한 경우
										alert("삭제가 취소되었습니다.");
									}
								}
							</script>
</head>
<body>
	<div>
		<form action="bookPro" method="post" name="bookimg">
			<!-- 상단 타이틀 시작 -->

			<div class="conWrap">
				<div class="faq_box">
					<p class="faq_title">도서 정보</p>
					<p class="faq_mtitle">관리자 도서 정보 페이지</p>
				</div>
			</div>

			<div class="Ere_prod_topwrap">

				<!-- 상단 타이틀 시작 -->
				<div class="Ere_prod_titlewrap">
					<!-- 좌측 타이틀-->

					<div class="left">
						<div class="tlist">
							<ul>

								<li></li>

							</ul>
						</div>
					</div>


				</div>

				<!-- 상단 타이틀 끝-->
				<div class="Ere_clear"></div>
			</div>
			<!-- 상단 타이틀 끝 -->

			<!-- 도서 커버 및 서지정보 1140px -->
			<div class="Ere_prod_bookwrap">

				<!-- 도서 -->
				<div class="Ere_prod_Bcoverwrap">


					<!-- 커버 -->
					<div class="cover">


						<!-- 사진 이미지 -->
						<div class="swiper-slide" id="divFlatImg"
							style="text-align: center; z-index: 2;">
							<div style="position: absolute; width: 50%; text-align: center;">
								<img id="CoverMainImage"
									src="${pageContext.request.contextPath}/image/book/${book.bookimg}"
									class="imgbox" height="600px" width="500px">

							</div>
						</div>


					</div>

					<!-- 여백 -->
					<div class="Ere_space20"></div>
					<!-- 오늘의 반값 등 팝업레이어 배너 -->

					<!-- 왼쪽 상단 레이어 -->
				</div>
				<!-- 서지정보 -->
				<div class="Ere_prod_Binfowrap" style="font-size: medium;">
					<!-- 서지 정보 시작 -->
					<div class="info">
						<fmt:parseNumber var="discount" value="${book.price/10*9 }"
							integerOnly="true" />
						<div class="Ere_space30"></div>
						<!-- 상품 정보 -->

						<div class="info_list">
							<ul>
								<li>
									<div class="Litem">책 제목</div>
									<div class="Ritem">${book.title}</div>
								</li>
							</ul>
						</div>


						<div class="info_list">
							<ul>
								<li><div class="Litem">카테고리</div>
									<div class="Ritem">${book.category}</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">저자</div>
									<div class="Ritem">${book.author}</div></li>
							</ul>
						</div>
							<div class="info_list">
							<ul>
								<li><div class="Litem">판매자</div>
									<div class="Ritem">${book.userid}</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">출판사</div>
									<div class="Ritem">${book.publisher}</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">정가</div>
									<div class="Ritem">${book.price}</div></li>

							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">할인가</div>
									<div class="Ritem">
										<strong><em class="discount">${discount}</em>원</strong>(<em>10%</em>할인
										+ <em>5%</em>포인트)
									</div></li>

							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">배송료</div>
									<div class="Ritem">무료</div></li>

							</ul>
						</div>


						<div class="info_list">
							<ul>
								<li><div class="Litem">발간일</div>
									<div class="Ritem">${book.pubdate}</div></li>

							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">재고량</div>
									<div class="Ritem">${book.inventory}</div>
							</ul>
						</div>

					</div>


					<!-- 버튼 -->
				<c:if test="${book.userid eq 'admin'}">
					<div class="Ere_btn_e_cart Ere_floatL">
						<a
							href="${pageContext.request.contextPath}/book/bookUpdateForm?booknum=${book.booknum}">게시글
							수정</a>
					</div>
					<div class="Ere_btn_e_cart Ere_floatL">
					<a
					href="javascript:void(0);"
					onclick="deleteForm(${book.booknum});">도서 삭제
					</a>
					</div>
					</c:if>
				</div>
				
				<!-- 서지 정보 끝 -->
			</div>
			<div class="Ere_clear"></div>
	</div>

	<div class="Ere_space10"></div>

	<!-- 여백 -->
	<div class="Ere_space50"></div>
	<!--// 도서 커버 및 서지정보 1140px -->

	<div class="Ere_space20"></div>

	<!-- 컨텐츠 시작 id="tbContnets" -->
	<div class="Ere_prod_middlewrap">
		<!-- 책소개-->

		<a id="E652532410_introduce"></a>
		<div class="Ere_prod_mconts_box">


			<div class="Ere_prod_mconts_LS">책소개</div>

			<div class="Ere_prod_mconts_R">
				${book.summary}
				<div class="Ere_line2"></div>
			</div>

			<div class="Ere_clear"></div>
		</div>
		</form>
		
				<div id="CommentReviewList">

					<div class="review_list_wrap">
						<ul>

<div class="Ere_prod_mblog_box">
				<div class="Ere_prod_mblog_L">100자평</div>
				<div class="Ere_prod_mblog_R">



							<div class="hundred_list">

								<c:set var="reviewid" value="${count}" />

								<c:forEach var="r" items="${reviewLi }">
								
									<div class="HL_star">

										<div class="div_TOC_Short">
											<small class="text-muted ${r.point}"> </small>

											<script>
												$(".0").html("&#9734; &#9734; &#9734; &#9734; &#9734;");
												$(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
												$(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
												$(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
												$(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
												$(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;"); 
											</script>
										</div>
									</div>
									<div class="HL_write">
										<div class="blog_list3">

											<ul>
												<li><a href="javascript:void(0);"
													onclick="fn_ToggleCommentReviewPaper('15120750')"> </a>
												<div class="" id="div_commentReviewPaper15120750">

														<div id="spnPaper15120750" style="display:">
															${r.review }</div>
													</div></li>
												<li>
													<div class="left">

														<span class="Ere_sub_gray8 Ere_fs13 Ere_PR10 ">${r.userid}</span>
														<span class="Ere_sub_gray8 Ere_fs13 Ere_PR10 ">${r.reviewdate }</span>
														<li>
															<%-- ${r.reviewdate } --%>

															<div class="right">
													     
															

															 <form action="ReviewDelete" method="post">
															 	<div class="Ere_btn_blog_sym">
															 		
																	 <a>
																		<button type="submit">댓글 삭제</button>
																	</a>

															    </div>
																	<input type="hidden" name="reviewid" id=reviewid value="${r.reviewid}"> 
																	<input type="hidden" name="booknum" id=booknum value="${book.booknum}"> 
															</form>
														   
														</div>

													</li>
											</ul>
										</div>
									</div>
								</c:forEach>
								<div class="Ere_clear"></div>
							</div>
							<div class="Ere_space20"></div>
						</ul>
					</div>
					<div class="review_number" style="border-top: 0;">
						<script type="text/javascript">
        // 페이지 로딩 시에 pageNum 초기화
        var pageNum = 2;

        function incrementPageNum() {
            // 현재 URL을 가져오기
            var currentUrl = window.location.href;

            // URL에 pageNum 파라미터가 있는지 확인
            var regex = /[?&]pageNum=(\d+)/;
            var match = currentUrl.match(regex);

            if (match) {
                // pageNum 파라미터가 있으면 값을 가져와서 1 증가시키기
                var currentPageNum = parseInt(match[1], 10);
                var newPageNum = currentPageNum + 1;

                // 새로운 URL 생성
                var newUrl = currentUrl.replace(regex, '&pageNum=' + newPageNum);

                // 새로운 URL로 이동
                window.location.href = newUrl;
            } else {
                // pageNum 파라미터가 없으면 새로 추가하여 초기값으로 설정
                var separator = currentUrl.indexOf('?') !== -1 ? '&' : '?';
                window.location.href = currentUrl + separator + 'pageNum=' + pageNum;
            }
        }
    </script>
						<div id="divReviewPageMore" style="">
<c:if test="${count % 4 == 0 }">
							<div class="Ere_btn_more">
								<a href="javascript:void(0);" onclick="incrementPageNum()"><strong>더보기</strong>
									<div class="more_arrow"></div></a>
							</div>
</c:if>
<c:if test="${count gt 4}">
							<div class="Ere_btn_more">
								<a
									href="http://localhost:8080/Genie/book/index?booknum=${book.booknum}"><strong>닫기</strong>
									<div class="more_arrow"></div></a>
							</div>
</c:if>
							<div class="Ere_space40"></div>

						</div>


					</div>

				</div>
	</div>
<br>
<br>
<br>
<br>
</body>
</html>