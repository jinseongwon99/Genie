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
				<div id="resultWrap">
					<!-- 메인 섹션 영역 -->
					
					<h2>도서 검색</h2>
					<div>검색 키워드 : [${keyword}]</div>					
					
					<section id="mainSection">
						<c:forEach var="b" items="${sli }">
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
									
								</li>
								</div>
								</c:forEach>
								</section>
								</div>
								</article>
								</div>
								</div>
								


</body>
</html>