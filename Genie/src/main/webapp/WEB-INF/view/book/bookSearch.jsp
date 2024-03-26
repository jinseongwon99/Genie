<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/bookList.css">


</head>
<body>

	<div id=wrap>

		<div class="min_height">
			<!-- 컨텐츠 영역 -->
			<article id="bandiContainer" style="">
				<!-- 상단 검색 키워드 영역 -->
				<!-- 검색 결과 값 영역 -->
				<div id="topResult">
					<div class="search_data">
						<p id="AREA_TOTAL">
							<em class="emph_on">"${keyword}"</em>(으)로 통합검색 <em class="emph_on">"${count }"</em>건 검색
						</p>
					</div>
					<!-- <div class="search_wrap" style="display: none;">
						<div class="search_keyword" style="display: none;">
							<h3 class="search_tit">추천 검색어</h3>
							<ul class="search_lst" id="AREA_E_1"></ul>
						</div>
						<div class="search_keyword" style="display: none;">
							<h3 class="search_tit">연관 키워드</h3>
							<ul class="search_lst" id="AREA_E_2"></ul>
						</div>
					</div> -->
				</div>
				<!-- 검색 결과 값 영역 -->
				<div id="resultWrap">
					
					<!-- 메인 섹션 영역 -->
					<section id="mainSection">
						<!-- 검색 옵션 영역 -->
						<div class="search_option">
							<!-- <div class="select_left">
								<span class="info"><span class="first_child"><a
										href="#AREA_G_2" id="PRODUCT_TOTAL">상품 [162]</a></span><span><a
										href="#AREA_G_3_1" id="TODAY_TOTAL">오늘의 책 [0]</a></span><span><a
										href="#AREA_G_3_2" id="THEME_TOTAL">테마북 [0]</a></span></span>
							</div> -->
							<!-- 우측 셀렉트 영역 -->
							<!-- <div id="AREA_D">
								<select id="sch_sort" class="inp_opt">

									<option value="j">정확도 높은 순</option>
									<option value="pt" selected="">발행일 최신 순</option>
									<option value="st">판매량 많은 순</option>
									<option value="ra">평점 높은 순</option>
									<option value="rt">리뷰 많은 순</option>
									<option value="drt">할인율 순</option>
									<option value="scta">가격 순</option>
								</select> <select id="sch_listSize" class="inp_opt">
									<option value="20" selected="">20개씩</option>
									<option value="50">50개씩</option>
									<option value="100">100개씩</option>
								</select> <select id="sch_viewType" class="inp_opt">
									<option value="view_type" selected="">자세히</option>
									<option value="view_type_simple">간단히</option>
								</select> <span class="soldout"> <input id="pb1" type="checkbox"
									value="Y" title="품절 제외"><label for="pb1">품절 제외</label>
								</span>
							</div> -->
							<!--// 우측 셀렉트 영역 -->
						</div>
						<!--// 검색 옵션 영역 -->

						<c:forEach var="b" items="${li }">
						<fmt:parseNumber var="discount" value="${b.price/10*9 }" integerOnly="true"/>
						<div class="view_type" id="AREA_G_2">
							<!-- 맨위책 ---------------------------------------------------------------------->
							
							
								<li>
									<div class="thumb_area" onmouseover="onImage(4771964);"
										onmouseout="outImage(4771964);">
										<div class="thumb_left_big">
											<!-- <a href="/front/product/detailProduct.do?prodId=4771964"> -->
												<img
												src="${pageContext.request.contextPath}/image/book/${b.bookimg}" width="118px"  height="177px"
												 onerror="">
											</a>
										</div>
										<div class="btn_popup">
											<a href="/front/product/detailProduct.do?prodId=4771964"
												class="btn_new" id="blank_link_4771964" target="_blank"
												style="display: none;"><span class="ico_new">새창열기</span></a>
										</div>
									</div>
									<dl class="book_contents">
										<dt>
											<a href="bookDetail?booknum=${b.booknum}">
												<!-- <span class="tit_category">[도서]</span> 
												<span id="prod_name_pre" class="pro_name"></span> -->
												<strong>${b.title }</strong>
											</a>
											<div class="tag_area"></div>
										</dt>
										<dd class="txt_block">
											<span class="info"><span class="author first_child">
											<a href="#" onclick="javascript:changeKwd('박영란');">${b.author }</a>
													저
											</span><span class="publisher"><a href="#"
													onclick="javascript:changeKwd('창비');">${b.publisher }</a></span><span
												class="pubdate">${b.pubdate }</span></span>
										</dd>
										<dd class="txt_price">
											<p>
												<span>${b.price}</span> → <strong><em>${discount}</em>원</strong> (<em>10%</em>할인
												+ <em>5%</em>포인트)
											</p>
										</dd>
										<dd class="txt_desc">
											<div class="review_point">
												<span style="width: 0%"></span>
											</div>
										</dd>
									</dl>
									<dl class="btn_area">
										<dt>
											<input id="" type="checkbox" class="checkbox" value="4771964"
												title="선택"><span class="num_txt">수량</span><input
												type="text" id="cntVal_4771964" value="1" class="num"
												size="3" maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
												class="btn_updn_wrap"><a
												href="javascript:cntUp('4771964','01');" class="btn_num_up">▲</a><a
												href="javascript:cntDown('4771964','01');"
												class="btn_num_dn">▼</a></span>
										</dt>
										<dd>
											<span class="btn_type blue"><a
												href="javascript:goOrder('4771964');">바로구매</a></span>
										</dd>
										<dd>
											<span class="btn_type skyblue"><a
												href="javascript:addCart('4771964');">쇼핑카트 담기</a></span>
										</dd>
										<dd>
											<span class="btn_type white"><a
												href="javascript:add_wish_array_common('4771964', true);">위시리스트</a></span>
										</dd>
									</dl>
									<%-- <a href="${pageContext.request.contextPath}/book/bookUpdateForm?booknum=${b.booknum}">책정보수정</a> --%>
								</li>
								</div>
								</c:forEach>



						<!-- //검색 리스트 -->

						<!-- 하단 버튼 영역-->
						<!-- <div class="btn_under" style="">
							<a href="javascript:addWishes();" class="wishlist">위시리스트 담기</a> <a
								href="javascript:addCarts();" class="wishlist">쇼핑카트 담기</a> <span
								class="check_all"> <input id="pb2" type="checkbox"
								value="" title="전체"><label for="pb2">전체</label>
							</span>
						</div> -->
						<!--// 하단 버튼 영역-->

						<!-- 페이징 영역 -->
						<!-- <div class="paging" id="AREA_G_2_PAGE">
								<a href="/search/search.do" onclick="pageMove(0); return false;" class="on">1</a>
								<a href="/search/search.do" onclick="pageMove(1); return false;" class="">2</a>
								<a href="/search/search.do" onclick="pageMove(2); return false;" class="">3</a>
								<a href="/search/search.do" onclick="pageMove(3); return false;" class="">4</a>
								<a href="/search/search.do" onclick="pageMove(4); return false;" class="">5</a>
								<a href="/search/search.do" onclick="pageMove(5); return false;" class="">6</a>
								<a href="/search/search.do" onclick="pageMove(6); return false;" class="">7</a>
								<a href="/search/search.do" onclick="pageMove(7); return false;" class="">8</a>
								<a href="/search/search.do" onclick="pageMove(8); return false;" class="">9</a>
								<a href="/search/search.do" onclick="goNextPage(); return false;" class="next">next</a>
						</div> -->
						<!--// 페이징 영역 -->

						<!-- 컨텐츠 영역 -->
						<!-- <article class="pop_cont" id="AREA_G_3_1" style="display: none;">
							<header class="cont_bg">
								<hgroup>
									<h2>
										오늘의 책 <span id="AREA_G_3_1_TOTAL">(0)</span>
									</h2>
									<h3>반디앤루니스와 리뷰어들이 함께 읽고 쓴 독서 감상기입니다.</h3>
								</hgroup>
								<a href="#" onclick="showMoreTodayBook(this);" class="link_more"
									style="display: block;">더보기</a>
							</header>
							<article class="cont_wrap">
								<ul id="AREA_G_3_1_DETAIL"></ul>
							</article>
						</article> -->

						<!-- 오늘의 책 페이징 영역 -->
						<!-- <div class="paging" id="AREA_G_3_1_PAGE" style="display: none;"></div>
						// 오늘의 책 페이징 영역

						<article class="pop_cont" id="AREA_G_3_2" style="display: none;">
							<header class="cont_bg">
								<hgroup>
									<h2>
										테마북 <span id="AREA_G_3_2_TOTAL">(0)</span>
									</h2>
									<h3>회원분들이 생각하는 이슈와 테마 그리고 추천도서</h3>
								</hgroup>
							</header>
							<article class="cont_wrap">
								<ul id="AREA_G_3_2_DETAIL"></ul>
							</article>
						</article> -->
						<!--// 컨텐츠 영역 -->

					</section>
				</div>
			</article>
		</div>
	</div>
</body>
</html>