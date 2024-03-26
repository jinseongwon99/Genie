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
<script>
	function win_upload() {
		var op = "width=500, height=150, left=50, top=150";
		open("${pageContext.request.contextPath}/book/pictureimgForm", "", op);
	}
</script>
</head>
<body>
	<div>
		<form action="bookPro" method="post" name="bookimg">
			<!-- 상단 타이틀 시작 -->

			<div class="conWrap">
				<div class="faq_box">
					<p class="faq_title">상품 등록</p>
					<p class="faq_mtitle">판매 도서 등록 페이지</p>
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
								<img id="bookimg" src="https://ifh.cc/g/GyJJ9h.png"
									class="imgbox" height="600px" width="500px"> <input
									type="hidden" name="bookimg" id="bookimg">

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
										<input id="title" type="text" name="title" placeholder="title"
											required>
									</div>
								</li>
							</ul>
						</div>



						<div class="info_list">
							<ul>
								<li><div class="Litem">책표지</div>
									<div class="Ritem">
										<a href="javascript:win_upload()">사진업로드</a>
									</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">카테고리</div>
									<div class="Ritem">
										<input id="category" type="radio" name="category" value="잡지"
											required>잡지&nbsp;&nbsp;<input id="category" type="radio"
											name="category" value="만화" required>만화&nbsp;&nbsp;<input
											id="category" type="radio" name="category" value="장르소설"
											required>장르소설&nbsp;&nbsp;<input id="category" type="radio"
											name="category" value="에세이" required>에세이&nbsp;&nbsp;<input
											id="category" type="radio" name="category" value="인문학"
											required>인문학
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">저자</div>
									<div class="Ritem">
										<input id="author" type="text" name="author"
											placeholder="author" required />
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">재고량</div>
									<div class="Ritem">
										<input id="inventory" type="number" name="inventory"
											placeholder="inventory" required />
									</div></li>
							</ul>
						</div>
						<div class="info_list">
							<ul>
								<li><div class="Litem">출판사</div>
									<div class="Ritem">
										<input id="publisher" type="text" name="publisher"
											placeholder="publisher" required />
									</div></li>
							</ul>
						</div>

						<div class="info_list">
							<ul>
								<li><div class="Litem">판매가</div>
									<div class="Ritem">
										<input id="price" type="number" name="price"
											placeholder="price" required />원
									</div></li>
							</ul>
						</div>

	

										<input id="bookstate" type="hidden" name="bookstate" value="대기"
											required > 

				
						<div class="info_list">
							<ul>
								<li><div class="Litem">나이</div>
									<div class="Ritem">
										<input id="grade" type="radio" name="grade" value="1" required>전체이용가
										<input id="grade" type="radio" name="grade" value="19"
											required>성인
									</div></li>
							</ul>
						</div>




						<input id="userid" type="hidden" name="userid"
							value="${sessionScope.userid}" required />


						<div class="info_list">
							<ul>
								<li><div class="Litem">발간일</div>
									<div class="Ritem">
										<input id="pubdate" type="date" name="pubdate"
											placeholder="date" required>
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
				<textarea id="summary" name="summary" class="summaryinput"
					placeholder="줄거리를 입력해주세요" required></textarea>
				<br>
				<button type="submit" class="buttoninfo"
					style="margin-left: 699px;margin-top: 20px;margin-bottom: 50px;width: 109px;">제출</button>

			</div>
			<div class="Ere_clear"></div>
		</div>
		</form>
	</div>


	<div class="help-tip"></div>
	<table width="50%" border="0" cellspacing="0" cellpadding="0"
		class="table-tooltip" style="position:absolute;">
		<tbody>
			<tr>
				<td width="15%" class="Tit_tableTF">품질등급</td>
				<td width="16%" class="Tit_tableTF">헌 상태</td>
				<td width="23%" class="Tit_tableTF">표지</td>
				<td width="23%" class="Tit_tableTF">책등 / 책배</td>
				<td width="23%" class="Tit_tableTL">내부 / 제본상태</td>
			</tr>
			<tr class="quality 1" style="">
				<td width="15%" class="Tit_tableCF"><span id="quality_title1"
					class="Ere_fs18">최상</span></td>
				<td width="16%" class="Tit_tableCF"><div class="left">새것에
						가까움</div></td>
				<td width="23%" class="Tit_tableCF">
					<div class="conts_info_list2">
						<ul>
							<li>변색 없음</li>
							<li>찢어진 흔적 없음</li>
							<li>닳은 흔적 없음</li>
							<li>낙서 없음</li>
							<li>얼룩 없음</li>
							<li>도서 겉표지 있음</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCF">
					<div class="conts_info_list2">
						<ul>
							<li>변색 없음</li>
							<li>닳은 흔적 없음</li>
							<li>낙서 없음</li>
							<li>얼룩 없음</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCL">
					<div class="conts_info_list2">
						<ul>
							<li>변색 없음</li>
							<li>낙서 없음</li>
							<li>변형 없음</li>
							<li>얼룩 없음</li>
							<li>제본 탈착 없음</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr class="quality 2" style="">
				<td width="15%" class="Tit_tableCF"><span id="quality_title2"
					class="Ere_fs18">상</span></td>
				<td width="16%" class="Tit_tableCF"><div class="left">약간의
						사용감은 있으나 깨끗한 책</div></td>
				<td width="23%" class="Tit_tableCF">
					<div class="conts_info_list2">
						<ul>
							<li>희미한 변색이나 작은 얼룩이 있음</li>
							<li>찢어진 흔적 없음</li>
							<li>약간의 모서리 해짐</li>
							<li>낙서 없음</li>
							<li>도서 겉표지 있음</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCF">
					<div class="conts_info_list2">
						<ul>
							<li>희미한 변색이나 작은 얼룩이 있음</li>
							<li>약간의 닳은 흔적 있음</li>
							<li>낙서 없음</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCL">
					<div class="conts_info_list2">
						<ul>
							<li>변색 없음</li>
							<li>낙서 없음</li>
							<li>변형 없음</li>
							<li>아주 약간의 접힌 흔적 있음</li>
							<li>얼룩 없음</li>
							<li>제본 탈착 없음</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr class="quality 3" style="">
				<td width="15%" class="Tit_tableCF "><span id="quality_title3"
					class="Ere_fs18">중</span></td>
				<td width="16%" class="Tit_tableCF "><div class="left">사용감이
						많으며 헌 느낌이 나는 책</div></td>
				<td width="23%" class="Tit_tableCF ">
					<div class="conts_info_list2">
						<ul>
							<li>전체적인 변색</li>
							<li>모서리 해짐 있음</li>
							<li>2cm 이하의 찢어짐</li>
							<li>오염 있음</li>
							<li>낙서 있음</li>
							<li>도서 겉표지 없음</li>
							<li>아웃케이스 없음</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCF ">
					<div class="conts_info_list2">
						<ul>
							<li>전체적인 변색</li>
							<li>모서리 해짐 있음</li>
							<li>오염 있음</li>
							<li>낙서 있음 (이름 포함)</li>
						</ul>
					</div>
				</td>
				<td width="23%" class="Tit_tableCL ">
					<div class="conts_info_list2">
						<ul>
							<li>변색 없음</li>
							<li>2cm 이하 찢어짐 있음</li>
							<li>5쪽 이하의 필기 및 풀이 또는 밑줄 있음</li>
							<li>얼룩 및 오염 있음</li>
							<li>제본 탈착 없음</li>
							<li>본문 읽기에 지장 없는 부록 없음</li>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>