<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css"
	type="text/css">

</head>
<body>
	<div id="wrap">
		<div id="contentBody">
			<div id="contentWrap">


				<form name="tempOrdForm" method="post">
					<input type="hidden" name="sch_bgn_dtm" value=""> <input
						type="hidden" name="sch_end_dtm" value="">
				</form>

				<div class="conWrap">

					<!-- left contents -->
				<div class="my">
					<div class="ml5 side_t2">
						<div class="cate_comm">
							<h2 class="cate_tit">마이페이지</h2>
							<ul class="cate_d1">
								<li class="cate_d1_li open"><span class="cate_d1_link ">주문관리</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myOrderList.do">주문/배송
													조회</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myOrderRetList.do">취소/반품/교환
													내역</a></li>

											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myOrderTaxBillTargetList.do">증빙서류발급</a></li>
										</ul>
									</div></li>

								<li class="cate_d1_li open"><span class="cate_d1_link ">포인트와
										혜택</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myPointHist.do?pointType=02">예치금</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myPointHist.do?pointType=01">적립금</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myPointHist.do?pointType=03">전환금</a></li>

											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myCouponList.do">쿠폰/상품권</a></li>

										</ul>
									</div></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">관심
										리스트</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myLatesProdList.do">최근
													본 상품</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myWishList.do">위시리스트</a></li>

											<li style="display: none;" class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myInterestedWriter.do">관심작가/신간알림</a></li>
										</ul>
									</div></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">활동
										내역</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myOrderHistory.do?prodType=book">구매
													내역/리뷰</a></li>


										</ul>
									</div></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">나의
										상담</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myCounselHist.do">1:1
													상담 내역</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/help/helpContactUsForm.do">1:1
													상담하기</a></li>
										</ul>
									</div></li>
								<li class="cate_d1_li open"><span class="cate_d1_link ">회원정보</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/updateMyInfo.do">회원정보
													수정</a></li>
											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/myDeliPlaceList.do">배송지
													관리</a></li>



											<li class="cate_d2_link"><a
												href="https://www.bandinlunis.com/front/myshopping/memLeaveForm.do">회원
													탈퇴</a></li>
										</ul>
									</div></li>
							</ul>

						</div>



					</div>

					<!-- //left contents -->

					<!-- right contents -->
					<div class="con_t3">


						<h3 class="cateTit mt50 pb10 pos_rel">
							<span class="bold">최근 주문/배송 내역 </span> <span class="t_11gr t_normal">|
								고객님의 최근 1개월 주문 내역입니다.</span> 
								
						</h3>


						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="table_comm">
							<colgroup>
								<col width="200">
								<col width="100">
								<col width="100">
								<col>
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문일자</th>
									<th>출고예정일</th>
									<th>상품명</th>
									<th>주문금액</th>
								</tr>
							</thead>
							<tbody>
								<!-- loop -->

								<!-- //loop -->


								<tr>
									<td colspan="5" height="70">최근 주문내역이 없습니다.</td>
								</tr>

							</tbody>
						</table>


						<h3 class="cateTit mb15 mt50 pb10 pos_rel">
							<span class="bold">위시리스트 </span> <strong class="t_11_ point_red_">[0]</strong>
							
						</h3>


						<div class="al_center t_gr" style="height: 100px">위시리스트에 담은
							책이 없습니다.</div>


						<h3 class="cateTit  mt50 mb15 pb10 pos_rel fl_clear">
							<span class="bold">최근 본 상품 </span> <strong class="t_11_ point_red_">[1]</strong>
							
						</h3>

						<ul class="my_shopping_prod_list">

							<li><span class="my_shopping_img"><a
									href="/front/product/detailProduct.do?prodId=4778182"><img
										src="http://image.bandinlunis.com/upload/product/4778/4778182.jpg"
										onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type02.gif'"></a></span>
								<span class="my_shopping_txt"><a
									href="/front/product/detailProduct.do?prodId=4778182">가짜사랑권하는사회:진짜사랑을...</a></span>
								<span class="point_red mt10 t_normal"><strong>15,750</strong>

							</span></li>
	
						</ul>




						<h3 class="cateTit  mt50   pb10 pos_rel fl_clear">
							<span class="bold">나의 상담 내역 </span> 
						</h3>

						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="mb45 table_comm">
							<colgroup>
								<col width="110">
								<col width="100">
								<col>
								<col width="150">
							</colgroup>
							<thead>
								<tr>
									<th>상담날짜</th>
									<th>구분</th>
									<th>제목</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>



								<tr>
									<td colspan="4" height="100">상담 내역이 없습니다.</td>
								</tr>

							</tbody>
						</table>



						<!-- //right contents -->
					</div>
				</div>
				</div>
				<!-- //body -->
			</div>

		</div>

	</div>
</body>
</html>