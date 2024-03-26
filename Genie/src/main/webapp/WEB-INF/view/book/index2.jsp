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
    currentAmount = Math.min(Math.min(${book.inventory}, 10), Math.max(0, inputAmount)); // 최대값 book.inventory 또는 10으로 설정, 최소값은 0으로 설정
    document.getElementById('amount').value = currentAmount;
}

// 예시로 동적으로 변경되는 값 (r.point)을 설정
var dynamicValue = "highlight"; // 이 값을 변경하여 테스트

// 해당 값을 가지고 클래스를 동적으로 변경
$(document).ready(function() {
    $(".text-muted").addClass(dynamicValue);
});

//쿠키가져오기
function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (60*60 * 1000)); //쿠키 유효기간 : 60초
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}


setCookie("booknum_${book.booknum}","${book.booknum}", 1);
setCookie("img_${book.booknum}","${book.bookimg}", 1);

</script>
</head>
<body>

	<div id="wrap">
		<form action="cartPro" method="post">
			<!-- 상단 타이틀 시작 -->
			<div class="Ere_prod_topwrap">

				<!-- 여백 -->
				<div class="Ere_space10"></div>
				<!-- 상단 타이틀 시작 -->
				<div class="Ere_prod_titlewrap">
					<!-- 좌측 타이틀-->
					<div class="left">
						<div class="tlist">
							<ul>

								<li>
									<div>
										<span class="Ere_bo_title">${book.title}</span>

									</div>
								</li>

							</ul>
						</div>
					</div>
				</div>
				<!-- 라인 -->
				<div class="Ere_line1"></div>
				<!-- 여백 -->
				<div class="Ere_space30"></div>
				<!-- 상단 타이틀 끝-->
				<div class="Ere_clear"></div>
			</div>
			<!-- 상단 타이틀 끝 -->

			<!-- 도서 커버 및 서지정보 1140px -->
			<div style="margin-left: 408px;">

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
				<div class="Ere_prod_Binfowrap">
					<!-- 서지 정보 시작 -->
					<div id="star-rate-container">
						<div class="star-ratings">
							<div class="star-ratings-fill space-x-2 text-lg"
								:style="{ width: ratingToPercent + '%' }">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
					</div>
					<div class="info">
						<fmt:parseNumber var="discount" value="${book.price/10*9 }"
							integerOnly="true" />

						<div>
							<span class="p_new_price_phs"><span>카테고리:&nbsp;</span>${book.category}</span>
						</div>
						<div class="Ere_space30"></div>
						<!-- 상품 정보 -->
						<div class="info_list">
							<ul>
								<li><div class="Litem">저자</div>
									<div class="Ritem">${book.author}</div></li>
								<div class="info_list">
									<ul>
										<li><div class="Litem">출판사</div>
											<div class="Ritem">${book.publisher}</div></li>
										<div class="info_list">
											<ul>
												<li><div class="Litem">발간일</div>
													<div class="Ritem">${book.pubdate}</div></li>
											</ul>
										</div>

										<div class="info_list">
											<ul>
												<li><div class="Litem">정가</div>
													<div class="Ritem">
														<span>${book.price}</span>
													</div></li>
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
												<li><div class="Litem">재고량</div>
													<div class="Ritem">${book.inventory}</div></li>

												<br>
												<br>
												<br>
												<br>
												<br>

												<input type="hidden" id="booknum" name="booknum"
													value="${book.booknum}">
												<input type="hidden" id="ischecked" name="ischecked"
													value="1">
												<c:if test="${book.inventory != 0 }">
													<div class="info_list">
														<ul>
															<li><div class="Litem">구매수량</div>
																<div class="Ritem">
														</ul>
													</div>
													<input type="number" id="amount" name="amount" value="1"
														oninput="updateAmount()">
										</div>
										<!-- 버튼 -->
								</div>
						</div>
						<div class="Ere_btn_e_cart Ere_floatL">
							<button type="submit" id="cartbutton">장바구니 담기</button>
						</div>
		</form>
		</c:if>
		<c:if test="${book.inventory == 0 }">
	</div>
	</div>
	</div>
	<div class="Ere_btn_e_cart Ere_floatL">
		<a href="#">품절 상품</a>
	</div>
	</form>
	</c:if>
	<form action="slangPro" method="post">
		<input type="hidden" id="booknum" name="booknum"
			value="${book.booknum}"> <input type="hidden" id="ischecked"
			name="ischecked" value="1">
		<div class="Ere_btn_e_cart Ere_floatL">
			<button type="submit" id="cartbutton">찜하기</button>
		</div>
	</form>
	</div>

	<!-- 서지 정보 끝 -->
	</div>
	<div class="Ere_clear"></div>
	</div>


	<div class="Ere_line2"></div>
	<!-- 여백 -->
	<div class="Ere_space50"></div>
	<!--// 도서 커버 및 서지정보 1140px -->

	<div class="Ere_space20"></div>

	<!-- 컨텐츠 시작 id="tbContnets" -->
	<div class="Ere_prod_middlewrap">
		<!-- 책소개-->

		<div class="Ere_prod_mconts_box">

			<div class="Ere_prod_mconts_LS">책소개</div>
		
			<div class="Ere_prod_mconts_R">
				${book.summary}
				<div class="Ere_line2"></div>
			</div>
			<div class="Ere_clear"></div>
		</div>

		<div class="Ere_prod_blogwrap">



			<style type="text/css">
a:link {
	text-decoration: none !important;
	color: #444;
}

a:hover {
	text-decoration: none !important;
	color: #444;
}
</style>


			<div class="Ere_prod_mblog_box">
				<div class="Ere_prod_mblog_L">100자평</div>
	
	
	<c:set var="reviewuserid" value="${reviewLi}" />
	${ reviewuserid}
	<%-- <c:choose>
	
				<c:when test="reviewuserid!=null">
				<!-- 리뷰----------------------------------------------- -->
				<div class="Ere_prod_mblog_R">
					<form action="reviewPro" method="post">
						<!-- 별점, 공유하기 버튼 시작 -->
						<div class="hundred_box">
						
						
						
						
							<div class="Hleft1">
								<div class="starbox">
									<div class="star-rating">
										<input type="radio" id="5-stars" name="point" value="5" /> <label
											for="5-stars" class="star">&#9733;</label> <input
											type="radio" id="4-stars" name="point" value="4" /> <label
											for="4-stars" class="star">&#9733;</label> <input
											type="radio" id="3-stars" name="point" value="3" /> <label
											for="3-stars" class="star">&#9733;</label> <input
											type="radio" id="2-stars" name="point" value="2" /> <label
											for="2-stars" class="star">&#9733;</label> <input
											type="radio" id="1-star" name="point" value="1" /> <label
											for="1-star" class="star">&#9733;</label> <input type="radio"
											id="0-star" name="point" value="0" /> <label for="0-star"
											class="star"></label>
									</div>
									<input id="count" name="count" type="hidden" value="1">
									<input id="booknum" name="booknum" type="hidden"
										value="${book.booknum}">
									<div class="Ere_clear"></div>
								</div>

								<div class="Ere_clear"></div>
							</div>
							<!--// 별점, 공유하기 버튼 끝 -->
							<div class="Ere_space10"></div>
							<!-- 텍스트 박스, 버튼 시작 -->
							<script>
        // textarea 요소를 선택합니다.
        var textarea = document.getElementById('review');

        // input 이벤트를 사용하여 텍스트 내용이 변경될 때마다 호출되는 함수를 정의합니다.
        textarea.addEventListener('input', function () {
            // 현재 텍스트 내용의 길이를 가져옵니다.
            var currentLength = textarea.value.length;

            // maxlength 속성에 설정된 최대 길이를 가져옵니다.
            var maxLength = parseInt(textarea.getAttribute('maxlength'));

            // 최대 길이를 초과하는 경우 텍스트를 자릅니다.
            if (currentLength > maxLength) {
                textarea.value = textarea.value.slice(0, maxLength);
            }
        });
    </script>
							<div class="hundred_box">
								<div class="Hleft1">
									<div class="">
										<textarea id="review" name="review" cols="87" rows="3"
											maxlength="100" class="Btext_area watermark"
											style="resize: none; width: 95%;"></textarea>

									</div>
								</div>

								<div class="Hright1">
									<div class="Ere_btn_register">
										<button type="submit" id="reviewbtn">등록</button>
									</div>
								</div>
							</div>
					</form>
		<!-- 리뷰----------------------------------------------- -->
		</c:when>
		<c:otherwise>
		
		
		
		</c:otherwise>
	</c:choose> --%>
		
					<div class="Ere_clear"></div>
				</div>
				
				

				<!--// 텍스트 박스, 버튼 끝 -->
				<div class="Ere_space10"></div>

				<!-- 여백 -->
				<div class="Ere_space30"></div>



				<div id="CommentReviewList">

					<div class="review_list_wrap">
						<ul>





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

																<div class="Ere_btn_blog_sym">
																	<a href="javascript:void(0);"
																		onclick="fn_CommentReview_ThanksTo(this, '/blog/popup/wpaper_thanksto_V2.aspx?PaperId=15224530&amp;ItemId=332268816');">Thanks
																		to</a>
																</div>


																<div class="Ere_btn_blog_sym">

																	<a href="javascript:void(0);"
																		onclick="fn_paper_recommend('CommentReview', 'recom', 15224530);">공감</a>

																</div>
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

							<div class="Ere_btn_more">
								<a href="javascript:void(0);" onclick="incrementPageNum()"><strong>더보기</strong>
									<div class="more_arrow"></div></a>
							</div>
							<div class="Ere_btn_more">
								<a
									href="http://localhost:8080/Genie/book/index?booknum=${book.booknum}"><strong>닫기</strong>
									<div class="more_arrow"></div></a>
							</div>

							<div class="Ere_space40"></div>

						</div>

					</div>

				</div>
			</div>
			<div class="Ere_clear"></div>
		</div>
	</div>

	<div class="Ere_space40"></div>
	<!-- ===================하단 반품 내용======================= -->

	<div class="Ere_prod_middlewrap">
		<div class="Ere_prod_mblog_box">
			<div class="Ere_prod_mconts_L Ere_PT10">반품/교환안내</div>
			<div class="Ere_prod_mblog_R">
				<div class="return_box">
					<!--테이블 -->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="25%" class="Tit_table1">반품/교환 방법</td>
								<td width="75%" class="Tit_table2">"나의계정&gt;주문조회&gt;반품/교환신청",
									<a href="/cs_center/wcs_ConsultQS.aspx?CategoryId1=76">1:1상담</a>
									&gt; <a href="/cs_center/wcs_ConsultQS.aspx?CategoryId1=76">반품/교환</a>
									또는 고객센터(1544-2514)<br> 판매자 배송상품은 판매자와 반품/교환이 협의된 상품에 한해 가능
								</td>
							</tr>
							<tr>
								<td width="25%" class="Tit_table3">반품/교환 가능기간</td>
								<td width="75%" class="Tit_table4">o 변심반품 수령 후 20일(단, 중고매장
									상품은 구매 후 구매 다음날로 부터 7일, 회원직거래 중고상품은 출고일로 부터 구매확정 전 상태로 6일, 전자책
									단말기 등 전자제품은 수령 후 7일 이내 제품 포장 미개봉시, eBook은 결제 후 다운로드 받지 않은 상태,
									웹뷰어로 보거나 듣지 않은 상태에서 20일 이내)<br>
								<br>o 파본 등 상품결함 시 '문제점 발견 후 30일(단, 수령일로 부터 3개월)' 이내
								</td>
							</tr>
							<tr>
								<td width="25%" class="Tit_table3">반품/교환 비용</td>
								<td width="75%" class="Tit_table4">o 변심 혹은 구매착오의 경우에만 반송료
									고객 부담<br>o 해외직배송도서의 변심 혹은 구매착오로 인한 취소/반품은 판매가의 20% 취소수수료
									고객 부담<br>
								<br>* 취소수수료 : 수입제반비용(국내 까지의 운송비, 관세사비, 보세창고료, 내륙 운송비, 통관비
									등)과 재고리스크(미판매 리스크, 환차손)에 따른 비용 등<br> 단, 아래의 주문/취소 조건인 경우,
									취소 수수료 면제<br> &nbsp;- 오늘 00시~06시 주문을 오늘 06시 이전 취소<br>
									&nbsp;- 오늘 06시 이후 주문 후 다음 날 06시 이전 취소<br>

								</td>
							</tr>
							<tr>
								<td width="25%" class="Tit_table3">반품/교환 불가 사유</td>
								<td width="75%" class="Tit_table4">o 소비자의 책임 있는 사유로 상품 등이
									손실 또는 훼손된 경우<br> o 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
									예) 전자책 단말기,가전제품, 래핑이 제거된 만화책/라이트노벨/수험서/문제집류<br> o 복제가 가능
									또는 단기간 내 완독 가능 상품의 자체 포장이나 래핑을 훼손한 경우<br> 예)
									음반,DVD,비디오,Blu-ray,소프트웨어, 잡지, 영상 화보집<br> o 소비자 요청에 의한 주문
									제작 상품(분철도서, POD 도서 등)<br> o 세트 상품 일부만 반품 불가(전체 반품 후 낱권
									재구매)<br> o 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드 받았거나 웹뷰어로 보기
									혹은 듣기를 한 경우<br> o 대여 기간이 종료된 eBook, 오디오북 대여제 상품<br> o
									신선도 문제로 일정 기한 경과 시 상품 가치가 현저하게 감소하는 상품 (원두, 콜드브루, 드립백 등)
								</td>
							</tr>
							<tr>
								<td width="25%" class="Tit_table5">소비자 피해보상<br>환불지연에
									따른 배상
								</td>
								<td width="75%" class="Tit_table6">o 상품의 불량에 의한 반품, 교환,
									A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준 (공정거래위원회 고시)에 준하여 처리됨<br>o
									대금 환불 및 환불 지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라
									처리함
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="Ere_clear"></div>
		</div>
	</div>

	<div class="Ere_space40"></div>

	</div>

	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
	<script>
new Vue({
  el: '#star-rate-container',
  data: {
    restaurant: {
      averageScore: ${book.reviewAvg} // Example average score
    }
  },
  computed: {
    ratingToPercent: function() {
      const score = +this.restaurant.averageScore * 20;
      return score ;
    }
  }
})
</script>

</body>
</html>