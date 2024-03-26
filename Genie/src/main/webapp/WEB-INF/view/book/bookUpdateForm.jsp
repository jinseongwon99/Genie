<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


</style>
<script type="text/javascript">
	var sel_file;
	$(document).ready(function() {
		$("#bookimg").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지 파일만 첨부해주세요.");
				return;
			}

			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#CoverMainImage").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>
	<div>
		<form action="bookUpdatePro" method="post"
			enctype="multipart/form-data">
			<!-- 상단 타이틀 시작 -->
			<input type="hidden" name="booknum" value="${book.booknum }">
			<input type="hidden" name="originfile" value="${book.bookimg }">


			<div class="conWrap">
				<div class="faq_box">
					<p class="faq_title">상품 수정</p>
					<p class="faq_mtitle">판매 도서 수정 페이지</p>
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

						<div class="Ere_space30"></div>
						<!-- 상품 정보 -->

						<div class="info_list">
							<ul>
								<li>
									<div class="Litem">책 제목</div>
									<div class="Ritem">
										<input id="title" type="text" name="title" value="${book.title}" required>
									</div>
								</li>
							</ul>
						</div>



						<div class="info_list">
							<ul>
								<li><div class="Litem">책표지</div>
									<div class="Ritem">
										<label for="file">파일:${book.bookimg }</label>
										<input type="file" class="form-control"  id="bookimg"  name="f">
									</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">카테고리</div>
            <div class="Ritem">
            <input id="category" type="radio" name="category" value="잡지" ${book.category=="잡지" ? "checked": " "} required>잡지	  
			<input id="category" type="radio" name="category" value="만화"  ${book.category=="만화" ? "checked": " "}  required>만화
			<input id="category" type="radio" name="category" value="장르소설" ${book.category=="장르소설" ? "checked": " "} required>장르소설
			<input id="category" type="radio" name="category" value="에세이"  ${book.category=="에세이" ? "checked": " "} required>에세이
			<input id="category" type="radio" name="category" value="인문학"  ${book.category=="인문학" ? "checked": " "} required>인문학
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">저자</div>
									<div class="Ritem">
										<input id="author" type="text" name="author" value="${book.author}"  required/>
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">재고량</div>
									<div class="Ritem">
										<input id="inventory" type="text" name="inventory" value="${book.inventory}"  required/> 
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">출판사</div>
									<div class="Ritem">
										<input id="publisher" type="text" name="publisher" value="${book.publisher}"  required/>
									</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">판매가</div>
									<div class="Ritem">
										<input id="price" type="text" name="price" value="${book.price}"  required/>원
									</div></li>
							</ul>
						</div>



						<div class="info_list">
							<ul>
								<li><div class="Litem">책상태</div>
									<div class="Ritem">
										<input id="bookstate" type="radio" name="bookstate" value="신상" ${book.bookstate=="신상" ? "checked": " "} required >신상
			<input id="bookstate" type="radio" name="bookstate" value="중고" ${book.bookstate=="중고" ? "checked": " "} required>중고
			<input id="bookstate" type="radio" name="bookstate" value="대기" ${book.bookstate=="대기" ? "checked": " "} required>대기

									</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">나이</div>
									<div class="Ritem">
										<input id="grade" type="text" name="grade" value="${book.grade}" required/>
									</div></li>
							</ul>
						</div>



						<div class="info_list"><ul><li><div class="Litem">회원 아이디</div>
			            <div class="Ritem"><input id="userid" type="text" name="userid" value="${book.userid}" required/>
						</div></li></ul></div>


						<div class="info_list">
							<ul>
								<li><div class="Litem">발간일</div>
									<div class="Ritem">
										<input id="pubdate" type="date" name="pubdate" value="${book.pubdate}" required/>
									</div></li>
							</ul>
						</div>

					</div>


					<!-- 버튼 -->


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
				<textarea  id="summary" name="summary" class="summaryinput"  required>
			${book.summary}
			</textarea>
				<br>
				<button type="submit" class="buttoninfo"
					style="margin-left: 699px; margin-top: 20px; margin-bottom: 50px; width: 109px;">수정 완료</button>

			</div>
			<div class="Ere_clear"></div>
		</div>
		</form>
	</div>


</body>
</html>