<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	

</head>
<body>
	<div id="wrap">
		
		<div class="section">
		

		<!-- 이벤트 배너 탭 ------------------------------------------------------------------------------------------------------>
			
			<div class="section-slide">
				<div class="container1">

					<div class="swiper-main-slide">
						<div class="swiper-wrapper">

							<script>
								function goEvent(id) {
								    window.location.href = '${pageContext.request.contextPath}/board/event/info?eventId='+id;
								}
							</script>

							<c:forEach var="i" begin="1" end="3">
								<div class="swiper-slide slide-${i}">
									<div class="inner inline-grid">
										<div class="img-box">
											<img
												src="${pageContext.request.contextPath}/image/event/banner/${eventList.get(i-1).getImage()}"
												onclick="goEvent(${eventList.get(i-1).getEventId()})">
										</div>

									</div>
								</div>
							</c:forEach>

						</div>
					</div>


				</div>
			</div>
			<!-- ======================================= -->
			
			
			
	<!-- 랭킹 추천 탭 ------------------------------------------------------------------------------------------------------>		
			
			
			 <div class="section-recom">
				<div class="container">
					<div class="title">
						<h1>랭킹 추천 도서</h1>
						<!-- <p>지금 로그인하시면 추천 마법사가 선택한 책을 보여드립니다!</p>
						<ul class="keywords inline-grid">
							<li>추천 키워드</li>
							<li>#인문학</li>
							<li>#소설</li>
							<li>#사회문제</li>
							<li>#에세이</li>
						</ul> -->
					</div>
					<div class="swiper-recom">
						<div class="swiper-wrapper">
						<c:forEach var="b" items="${li2 }">
							<div class="swiper-slide slide-1 slide_1">
								<div class="inner">
									<div class="tag-box">
										<ul>
											<li class="book-category">
												<span>${b.category }</span>
											</li>
											<!-- <li class="book-event">
												<span class="book-event_title">관련 이벤트</span>
											</li> -->
										</ul>
									</div>
									<a href="index?booknum=${b.booknum}">
									<c:if test="${sessionScope.sessionAge ge b.grade}" >
			                           <div class="img-box">
			                                    <img src="${pageContext.request.contextPath}/image/book/${b.bookimg}"
			                                                alt="" width="244px" height="300px">
			                                                </div>
			                           </c:if>   
			                       <c:if test="${sessionScope.sessionAge lt b.grade}" >   
			                          <div class="img-box">
			                                    <img src="${pageContext.request.contextPath}/image/book/19book_200cover.jpg"
			                                                alt="">
			                                                </div>
			                          </c:if>
			                          </a>

									<div class="text-box text-box_bg">
										<h2 class="book-title">${b.title }</h2>
										<p class="book-writer">${b.author}</p>
										<!-- <p class="book-des">말힘과 글힘의 기초를 다지는 단어 수업</p> -->
									</div>
								</div>
							</div>
							</c:forEach>
							
						</div>
						<div class="swiper-button-box">
							<div class="swiper-button-next">
								<img src="https://113midm.github.io/redesign_aladin/image/Arrow-next.svg" alt="">
							</div>
							<div class="swiper-button-prev">
								<img src="https://113midm.github.io/redesign_aladin/image/Arrow-next.svg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div> 
			
			
		<!-- 신기한거 탭 ------------------------------------------------------------------------------------------------------>	
			
			<!-- <div class="section-today">
				<div class="container">
					<div class="inner inline-grid">
						<div class="book-box">
							<div class="book-img-box">
								<div class="book-center">
									<div class="img-box">
										<img id="book-img-center"
											src="https://image.aladin.co.kr/product/29246/9/cover500/8932922055_1.jpg"
											alt="">
									</div>
								</div>
								<div class="book-right">
									<div class="img-box">
										<img id="book-img-right"
											src="https://image.aladin.co.kr/product/29231/77/cover500/k252837196_1.jpg"
											alt="">
									</div>
									
									
									
									
									<div class="text-box book-right">
										<ul>
											<li class="line">
												<span></span>
												<span></span>
											</li>
											<li class="book-title">더러운 손을 거기에 닦지 마</li>
											<li class="book-writer">아시자와 요 지음</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="book-main">
							<div class="text-box book-center active">
								<p class="sent">호주에서 등교 거부 시위 조직에 앞장섰던 열다섯 살의 노스라트 파레하는 정치인들을 향해 이렇게 외쳤다. 「당신들은 우리 미래를
									짓뭉개고 있어요. 우리는 더 나은 미래를 원해요. 젊은 사람들은 투표조차 할 수 없는데 당신들이 아무 대응도 하지 않으면 그 결과는 고스란히 우리
									젊은이들 몫이 될 겁니다.」</p>
								<h2 class="book-title">『미래가 우리 손을 떠나기 전에』</h2>
								<h3 class="book-writer">나오미 클라인,리베카 스테포프 지음<br>이순희 옮김</h3>
							</div>
							<div class="text-box book-right">
								<p class="sent">아내는 가스 불 끄는 것을 잊을까 두려워서 혼자 있을 때는 불을 사용하지 않는다. 하지만 이대로 증상이 진행되면 혼자 있을 때는
									불을 사용하지 않는다는 것 자체를 잊을지도 모른다.</p>
								<h2 class="book-title">『더러운 손을 거기에 닦지 마』</h2>
								<h3 class="book-writer">아시자와 요 지음<br>박정임 옮김</h3>
							</div>
							<div class="bg-box">
								<img src="https://113midm.github.io/redesign_aladin/image/Croods%20Sitting-f.png"
									alt="">
								<img src="https://113midm.github.io/redesign_aladin/image/Croods%20Sitting%20on%20Floor-m.png"
									alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="today-bg"></div>
			</div> -->


	<!-- 신간도서 탭 ------------------------------------------------------------------------------------------------------>

			<div class="section-used">
				<div class="container">
					<div class="title">
						<h1>신간도서</h1>
						<!-- <ul class="float-grid">
							<li><a href="#">주간 베스트셀러</a></li>
							<li><a href="#">새로 들어온 상품</a></li>
						</ul> -->
					</div>
					
					<div class="swiper-used">
						<div class="swiper-wrapper">
						
							<div class="swiper-slide slide-1 float-grid">
							<c:forEach var="nb" items="${li }">
								<div class="slide_1">
									<div class="inner">
										<div class="tag-box">
											<ul>
												<li class="book-category">
													<span>${nb.category }</span>
												</li>
												<!-- <li class="book-event">
													<span class="book-event_title">관련 이벤트</span>
												</li> -->
											</ul>
										</div>
										<a href="index?booknum=${nb.booknum}">
										<c:if test="${sessionScope.sessionAge ge nb.grade}" >
					                           <div class="img-box">
					                                    <img src="${pageContext.request.contextPath}/image/book/${nb.bookimg}"
					                                                alt="">
                                                </div>
			                           </c:if>   
				                       <c:if test="${sessionScope.sessionAge lt nb.grade}" >   
				                          <div class="img-box">
				                                    <img src="${pageContext.request.contextPath}/image/book/19book_200cover.jpg"
				                                                alt="">
			                                                </div>
			                            </c:if>
										</a>
										<div class="text-box text-box_bg">
											<h2 class="book-title">${nb.title }</h2>
											<p class="book-writer">${nb.author }</p>
											<!-- <p class="book-des">이것이 지극한 사랑에 대한 소설이기를 빈다.</p> -->
										</div>
									</div>
								</div>
								</c:forEach>
								
								
						</div>
					</div>
					
					
				</div>
				
			</div>
			
			
		</div>
	</div>
</body>
</html>