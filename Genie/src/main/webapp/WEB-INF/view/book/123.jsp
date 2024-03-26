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
	font-size: 1.5em; /* 크기를 2em으로 지정합니다. */
	/* 다른 스타일을 필요에 따라 추가할 수 있습니다. */
}

/* .highlight 클래스에 대한 스타일 */
.highlight {
	color: #fc0;
	font-size: 1.5em; /* 크기를 2em으로 지정합니다. */
	font-weight: bold; /* 예시로 글꼴을 굵게 지정했습니다. */
}

.discount {
	color: red;
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
</head>
<body>

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
		<div class="Ere_prod_Binfowrap">
			<!-- 서지 정보 시작 -->
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
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">정가</div>
									<div class="Ritem">${book.price}</div></li>
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
											<div class="Ritem">${book.inventory}</div></li>

										<br>
										<br>
										<br>
										<br>
										<br>
										<br>




										<!-- 버튼 -->
								</div>
						</div>


						<div class="Ere_btn_e_cart Ere_floatL">
							<a
								href="${pageContext.request.contextPath}/book/bookUpdateForm?booknum=${book.booknum}">게시글
								수정</a>
						</div>
						<form novalidate action="bookDeletePro" method="post">
							<input type="hidden" name="booknum" value="${book.booknum}">
							<div class="Ere_btn_e_cart Ere_floatL">
								<a href=""><button type="submit">게시글 삭제</button></a>
							</div>
						</form>
				</div>

				<!-- 서지 정보 끝 -->
			</div>
			<div class="Ere_clear"></div>
		</div>
		<div class="Ere_space70"></div>

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

			<div class="Ere_clear"></div>
		</div>

		<div class="Ere_space40"></div>
</body>
</html>