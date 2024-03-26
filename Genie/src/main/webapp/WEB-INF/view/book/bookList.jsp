<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/css/bookList.css">

	<script>
		function orderbySortmap(sm) {
	        var urlParams = new URLSearchParams(window.location.search);
	        var currentSortMap = urlParams.get('sortmap');
	
	        var newOrder = 'asc';
	        if (currentSortMap && currentSortMap.startsWith(sm)) {
	            newOrder = currentSortMap.endsWith('asc') ? 'desc' : 'asc';
	        }
	
	        var newSortMap = sm +' '+ newOrder;
	
	        window.location.href = '${pageContext.request.contextPath}/book/bookList?sortmap=' + newSortMap;
	    }
		
		function updateAmount(index) {
            //alert(index)
            
             let inputElement = document.querySelectorAll('#amount');
             let inputValue = parseInt(inputElement[index].value) || 0;
  
             // 최대값을 10 또는 ${b.inventory}로 설정
             let maxAmount = Math.min(10, ${b.inventory});
  
             // 입력된 값이 최대값보다 크다면 최대값으로 설정
             if (inputValue > maxAmount) {
                 inputElement[index].value = maxAmount;
                 
             }
         }

	</script>
	<style>
	.on {
		    color: #0500fb;
	}
	</style>

</head>

<body>

<div id=wrap>
<div class="min_height">
			<div class="side_t2">
				<!-- sub navi -->
				<div class="cate_comm">
					<ul class="cate_d1">
						<li class="cate_d1_li open">
							<a href="bookList?category="><span class="cate_d1_link ">국내 도서</span></a>
							<div class="cate_d2">
								<ul>
									<li class="${category eq '잡지' ? 'on' : '' }"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category=잡지'">잡지</a></li>
									<li class="${category eq '에세이' ? 'on' : '' }"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category=에세이'">에세이</a></li>
									<li class="${category eq '만화' ? 'on' : '' }"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category=만화'">만화</a></li>
									<li class="${category eq '인문학' ? 'on' : '' }"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category=인문학'">인문학</a></li>
									<li class=" ${category == '유아' ? 'on' : '' }"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">유아</a></li>
									<li class=" "><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">어린이</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">청소년</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">여행</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">소설</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">고전</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">달력/기타</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">건강/취미/레저</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">대학교재</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">컴퓨터/모바일</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">외국어</a></li>
									<li class=""><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/book/bookList?category='">자기계발</a></li>
								</ul>
							</div>
						</li>
					
						<li class="cate_d1_li open"><span class="cate_d1_link ">중고도서</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="#">구매하기</a></li>
									<li class="cate_d2_link"><a href="#">판매하기</a></li>
									<li class="cate_d2_link"><a href="#"></a></li>
								</ul>
							</div>
						</li>
				
					</ul>
				
				</div>
				<!-- //sub navi -->
			</div>	
		
				
			
			<!-- 컨텐츠 영역 -->
			<article id="bandiContainer" style="">
				<div>
				
				<!-- 정렬 방식 버튼------------------------------------- -->
						

						<div>
						    <button class="btn_type blue"><a onclick="orderbySortmap('pubdate')">출판날짜순</a></button>
						    <button class="btn_type blue"><a onclick="orderbySortmap('title')">제목순</a></button>
						    <button class="btn_type blue"><a onclick="orderbySortmap('price')">가격순</a></button>
						</div>
				
				<!-- 책정보 ---------------------------------------------------------------------->
				
				
					<!-- 메인 섹션 영역 -->
					<section id="mainSection">
						<c:set var="bookNumber" value="${bookNumber}"/>
						<c:forEach var="b" items="${li }">
						
						<fmt:parseNumber var="discount" value="${b.price/10*9 }" integerOnly="true"/>
						<div class="view_type" id="AREA_G_2">
								<li>
									<div class="thumb_area" onmouseover="onImage(4771964);" onmouseout="outImage(4771964);">
										<div class="thumb_left_big">
											<!-- <a href="/front/product/detailProduct.do?prodId=4771964"> -->
						<%-- ${bookNumber } --%>
						<c:set var="bookNumber" value="${bookNumber-1}"/>
               			
	                    <c:if test="${sessionScope.sessionAge ge b.grade}" >
	                    <a href="index?booknum=${b.booknum}">
                          <img src="${pageContext.request.contextPath}/image/book/${b.bookimg}" width="118px"  height="177px" onerror="">
                        </a>
                       </c:if>   
                       <c:if test="${sessionScope.sessionAge lt b.grade}" >   
                          <img src="${pageContext.request.contextPath}/image/book/19book_200cover.jpg" width="118px"  height="177px" onerror="">   
                       </c:if>
										</div>
										
									</div>
									<dl class="book_contents">
										<dt>
											<a href="index?booknum=${b.booknum}">
												<!-- <span class="tit_category">[도서]</span> 
												<span id="prod_name_pre" class="pro_name"></span> -->
												<strong>${b.title }</strong>
											</a>
											<div class="tag_area"></div>
										</dt>
										<dd class="txt_block">
											<span class="info"><span class="author first_child">
											${b.author }
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
                           <c:if test="${b.inventory != 0 }">
                           <form action="cartPro" method="post">
                           <dl class="btn_area">
                              <dt>      
                              <input type="hidden" id="booknum" name="booknum" value="${b.booknum}">
                               <input type="hidden" id="ischecked" name="ischecked" value="1">
                              <span class="num_txt">수량</span>
                              <input type="number" id="amount" name="amount" min="1" value="1" class="num" max="${b.inventory }"
                                         size="3" maxlength="2" oninput="updateAmount('${status.index }')">
                                 
                              </dt>
                              <dd>
                                 <span class="btn_type blue"><a
                                    href="javascript:goOrder('4771964');"><button type="submit">바로구매</button></a></span>
                              </dd>
                              
                               
                              </form>
                           
        

                           
                           </c:if>
                              <c:if test="${b.inventory == 0 }">
                           
                           <dl class="btn_area">
                              <dt>                        
                              </dt>
                              <dd>
                                 <span class="btn_type blue"><a
                                    href="javascript:goOrder('4771964');">품절상품</a></span>
                              </dd>
                              
                           
                           </c:if>
                              <dd>
                              <form action="slangPro" method="post">
                                 <input type="hidden" id="booknum" name="booknum" value="${b.booknum}">
                                 <input type="hidden" id="ischecked" name="ischecked" value="1">
                                 <span class="btn_type white"><a
                                    href="javascript:add_wish_array_common('4771964', true);"><button type="submit">찜하기</button></a></span></form>
                              </dd>
                           </dl>
									<%-- <a href="${pageContext.request.contextPath}/book/bookUpdateForm?booknum=${b.booknum}">책정보수정</a> --%>
								</li>
								</div>
								</c:forEach>
			<!-- 책정보 끝---------------------------------------------------------------------->					





					</section>
					
		
					
					
					
				</div>
			</article>
			
			
		
			
	</div>
	<!-- 하단 페이징 ---------------------------------------------------------------------->
		<div class="page">
			<ul class="pagination modal">
				<li <c:if test ="${start<=bottomline }">disabled</c:if>>
					<a class="arrow left" href="${pageContext.request.contextPath }/book/bookList?sortmap=${sortmap }&pageNum=${pageNum-1}"><
					</a>
				</li>
				<c:forEach var="p" begin="${start }" end="${end }">
					<li <c:if test ="${pageInt==p }"> active</c:if>>
						<a class="cative num" href="${pageContext.request.contextPath }/book/bookList?sortmap=${sortmap }&pageNum=${p}">${p}
						</a>
					</li>
				</c:forEach>
				<li <c:if test ="${end>=maxPage }"> disabled</c:if>>
					<a class="arrow right" href="${pageContext.request.contextPath }/book/bookList?sortmap=${sortmap }&pageNum=${pageNum+1}">>
					</a>
				</li>				
			</ul>
		</div>
		
	
</div>
			
</body>
</html>