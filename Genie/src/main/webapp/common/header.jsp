<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Genie</title>
	<!-- jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- font -->
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	<!-- swiper-slide -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<!-- font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<!-- 파일 연결 -->
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	<script src="${pageContext.request.contextPath}/js/index.js" defer></script>
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navigationBar.css">


	
<%
    String sessionId = (String) session.getAttribute("userid");
    int sessionAge = 0; // 변수를 선언하고 초기화합니다.


    if (sessionId == null) {
        session.setAttribute("sessionAge", 1); // 세션 ID가 없는 경우, sessionAge를 1로 설정하여 세션에 저장합니다.
    } else {
       	session.setAttribute("sessionAge", (Integer) session.getAttribute("userage")); // 세션 ID가 있는 경우, userage 값을 가져와서 세션에 저장합니다.
    }

    String keyword = (String) session.getAttribute("keyword");
%>

<script> 

//장바구니 수량 가져오기


	//우측 네비바 ------------
	window.onload = function() {
		
	   var currentPage = window.location.pathname.split('/').pop();
	   console.log("cp:"+currentPage)
	   if (currentPage === 'login' || currentPage == 'join' ) {
	        var elementToHide = document.getElementById('pos_scroll');
	        if (elementToHide) {
	            elementToHide.style.display = 'none';
	        }
	   }

	};

	var scrollPosition = 0;
	
	window.onscroll = function () {
		scrollPosition = document.documentElement.scrollTop;
		updateScrollPosition(scrollPosition);
	};
	
	function updateScrollPosition(position) {
		var sidebar = document.getElementById('scroll');
		var pageHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
		var maxTop = pageHeight - 280;
		sidebar.style.top = Math.min((pageHeight-position>1300?position + 280:pageHeight-1050), maxTop) + 'px';
	}
	
	
	//검색창 엔터키 활성화
	function enterkey(){
		if(window.event.keyCode == 13){
			keywordPro()
		}
	}

	//헤더 검색창 키워드값 넘기기
	function keywordPro(){
      let keyword = document.querySelector("#keyword").value
      location.href="${pageContext.request.contextPath}/book/bookList?keyword="+keyword
            
       if (keyword.trim() !== "") {
              location.href = "${pageContext.request.contextPath}/book/bookList?keyword=" + keyword;
          } else {
             location.href = "${pageContext.request.contextPath}/book/bookList?keyword=" + keyword+"&category=";
          }
    }
	
	
	//쿠키 가져오기(booknum , bookimg)
	window.addEventListener('load',function getCookie2() {
        var nameEQ = name + "=";
        var cookies = document.cookie.split(';');
        let ddd = document.querySelector("#recentbooks")
        console.log(cookies)
       
      
        for (var i = 0; i < cookies.length; i++) {
      
        	if (cookies[i].includes("img")){
        		let  cook = cookies[i].split("=")
        		let  bnum = cookies[i-1].split("=")
        		ddd.innerHTML =" <a href='${pageContext.request.contextPath}/book/index?booknum="+bnum[1]+"'><img id='bbb123' src='${pageContext.request.contextPath}/image/book/"+cook[1]+"'></a>" 
        				  + ddd.innerHTML
        	} 
        	
        	// 최대 저장할 쿠키 개수
       		var maxCookies = 3;

        	// 현재 쿠키의 개수
       		var currentCookies = cookies.length;
        	
       		console.log(currentCookies)
        	 // 쿠키의 개수가 최대 개수보다 큰 경우, 첫 번째 쿠키 제거
            if (currentCookies > maxCookies*2) {
                var expiredCookie = cookies[0];
                document.cookie = expiredCookie + ";expires=01 Jan 2000 00:00:00 UTC;path=/";
                var expiredCookie2 = cookies[1];
                document.cookie = expiredCookie2 + ";expires=01 Jan 2000 00:00:00 UTC;path=/";
                
            }
            document.querySelector("#recount").innerHTML = Math.floor(currentCookies/2);
            
         	
        }
        return null;
    });
    /* getCookie2() */
 

</script>


</head>
<body>
	<div id=wrap>
		<div class="header">
			<div class="header_logo">
				<div class="container">
					<a href="${pageContext.request.contextPath}/book/main"> <img
						src="${pageContext.request.contextPath}/image/logo/genieLogo.png"
						alt="header_logo_img">
					</a>
				</div>
			</div>
			
			
			<div class="header_search">
				<div class="container">
				
				
				
					<div class="inner">
					
					
					
					
						<input type="text" placeholder="검색어를 입력하세요" id="keyword" name="keyword"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder='검색어를 입력하세요'"
							onkeyup="enterkey()" value="${keyword }">
							<a onclick="keywordPro()" class="searchbutton">&nbsp;</a>
						
							<c:if test="${not empty sessionScope.keyword}">
								<a href="${pageContext.request.contextPath}/book/deleteSession" class="resetbutton">
									<input type="submit" value=""/>
					            </a>
							</c:if>
				
						
					</div>
					<div class="header_side-menu">
						<ul class="float-grid">
							<li class="btn-my">
								<button></button>
								<ul class="sub-menu float-grid">
									<%if(sessionId == null) { %>
										<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
										<li><a href="${pageContext.request.contextPath}/member/join">회원가입</a></li>

									<%} else { %>
										<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
										<li><a href="${pageContext.request.contextPath}/order/slang">찜목록</a></li>
										
									<%} %>
									<li><a href="${pageContext.request.contextPath}/member/memberInfo">마이페이지</a></li>
								</ul>
							</li>
							<li class="btn-cart">
							<button onclick="location.href='${pageContext.request.contextPath}/order/shoppingBasket'"></button>
							</li>
							<span id="cartCount">0</span>
						</ul>
					</div>
					<div class="header-ad">
						<a href="#" class="img-box"> <img
							src="https://image.aladin.co.kr/img/bn/ebook/2022/02/left_220411_MD.jpg"
							alt="header-ad-img">
						</a>
					</div>
				</div>
			</div>
			
			<div class="header_menu">
				<div class="container">
					<div class="inner">
						<ul>
							<div>
								<li class="btn-category"><span>전체 카테고리 보기</span></li>
									<li><a></a></li>
									<li><a></a></li>
									
									<li><a href="${pageContext.request.contextPath}/board/notice/main">공지사항</a></li>
									<li><a href="${pageContext.request.contextPath}/board/event/main">지니이벤트</a></li>
									<li><a href="${pageContext.request.contextPath}/board/faq/main">FAQ</a></li>
								
								<!-- <li class="hashtag"><a href="#">#JSP</a></li>
								<li class="hashtag"><a href="#">#MyBATIS</a></li>
								<li class="hashtag"><a href="#">#XML</a></li>
								<li class="hashtag"><a href="#">#JS</a></li> -->
							</div>
						</ul>
					</div>
				</div>
				<div class="popup-category">
					<div class="container">
						<ul>
							<li>
								<div class="title">국내도서</div>
								<div class="text float-grid">
									<ul>
										<li><a href="${pageContext.request.contextPath}/book/bookList?category=잡지">잡지</a></li>
										<li><a href="${pageContext.request.contextPath}/book/bookList?category=만화">만화</a></li>
										<li><a href="#">유아</a></li>
										<li><a href="#">어린이</a></li>
										<li><a href="#">전집/중고전집</a></li>
										<li><a href="#">청소년</a></li>
										<li><a href="#">좋은부모</a></li>
										<li><a href="#">초등학교참고서</a></li>
										<li><a href="#">중학교참고서</a></li>
										<li><a href="#">고등학교참고서</a></li>
										<li><a href="#">여행</a></li>
										<li><a href="#">가정/요리/뷰티</a></li>
										<li><a href="#">건강/취미/레저</a></li>
										<li><a href="#">달력/기타</a></li>
										<li><a href="#">고전</a></li>
										<li><a href="#">소설/시/희곡</a></li>
									</ul>
									<ul>
										<li><a href="${pageContext.request.contextPath}/book/bookList?category=에세이">에세이</a></li>
										<li><a href="${pageContext.request.contextPath}/book/bookList?category=인문학">인문학</a></li>
										<li><a href="#">장르소설</a></li>
										<li><a href="#">사회과학</a></li>
										<li><a href="#">역사</a></li>
										<li><a href="#">과학</a></li>
										<li><a href="#">예술/대중문화</a></li>
										<li><a href="#">종교/역학</a></li>
										<li><a href="#">경제경영</a></li>
										<li><a href="#">자기계발</a></li>
										<li><a href="#">외국어</a></li>
										<li><a href="#">컴퓨터/모바일</a></li>
										<li><a href="#">대학교재</a></li>
										<li><a href="#">수험서/자격증</a></li>
										<li><a href="#">공무원 수험서</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">외국도서</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">영미도서</a></li>
										<li><a href="#">소설/시/희곡</a></li>
										<li><a href="#">ELT/어학/사전</a></li>
										<li><a href="#">인문/사회</a></li>
										<li><a href="#">경제경영</a></li>
										<li><a href="#">자기계발</a></li>
										<li><a href="#">자연과학</a></li>
										<li><a href="#">컴퓨터</a></li>
										<li><a href="#">예술/대중문화</a></li>
										<li><a href="#">가정/원예/인테리어</a></li>
										<li><a href="#">공예/취미/수집</a></li>
										<li><a href="#">여행</a></li>
										<li><a href="#">건강/스포츠</a></li>
										<li><a href="#">청소년</a></li>
										<li><a href="#">해외잡지</a></li>
										<li><a href="#">일본도서</a></li>
									</ul>
									<ul>
										<li><a href="#">잡지</a></li>
										<li><a href="#">코믹</a></li>
										<li><a href="#">문학</a></li>
										<li><a href="#">실용/취미/생활</a></li>
										<li><a href="#">애니메이션 굿즈</a></li>
										<li><a href="#">중국도서</a></li>
										<li><a href="#">소설</a></li>
										<li><a href="#">중국어 교재</a></li>
										<li><a href="#">어린이</a></li>
										<li><a href="#">캐릭터</a></li>
										<li><a href="#">그림책</a></li>
										<li><a href="#">리더스</a></li>
										<li><a href="#">챕터북</a></li>
										<li><a href="#">동화책</a></li>
										<li><a href="#">오디오북</a></li>
										<li><a href="#">어린이사전</a></li>
									</ul>
									<ul>
										<li><a href="#">개념학습</a></li>
										<li><a href="#">코스북</a></li>
										<li><a href="#">영어학습</a></li>
										<li><a href="#">교과학습</a></li>
										<li><a href="#">미국교과서</a></li>
										<li><a href="#">수상작</a></li>
										<li><a href="#">제2외국어/이중언어</a></li>
										<li><a href="#">기타 언어권</a></li>
										<li><a href="#">프랑스 도서</a></li>
										<li><a href="#">독일 도서</a></li>
										<li><a href="#">스페인 도서</a></li>
										<li><a href="#">베트남 도서</a></li>
										<li><a href="#">기타 도서</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">eBook</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">소설/시</a></li>
										<li><a href="#">로맨스</a></li>
										<li><a href="#">라이트노벨</a></li>
										<li><a href="#">판타지/무협</a></li>
										<li><a href="#">만화</a></li>
										<li><a href="#">BL</a></li>
										<li><a href="#">에세이</a></li>
										<li><a href="#">자기계발</a></li>
										<li><a href="#">경제경영</a></li>
										<li><a href="#">사회과학</a></li>
										<li><a href="#">인문학</a></li>
										<li><a href="#">역사</a></li>
										<li><a href="#">청소년</a></li>
										<li><a href="#">예술/대중문화</a></li>
										<li><a href="#">종교/역학</a></li>
										<li><a href="#">어린이</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">eBook 뷰어</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">아이폰 뷰어</a></li>
										<li><a href="#">안드로이드 뷰어</a></li>
										<li><a href="#">PC 뷰어</a></li>
										<li><a href="#">크레마</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">온라인 중고샵</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">중고매장</a></li>
										<li><a href="#">중고 국내도서</a></li>
										<li><a href="#">소설/시/희곡</a></li>
										<li><a href="#">에세이</a></li>
										<li><a href="#">어린이</a></li>
										<li><a href="#">유아</a></li>
										<li><a href="#">중고전집</a></li>
										<li><a href="#">경제경영</a></li>
										<li><a href="#">인문학</a></li>
										<li><a href="#">사회과학</a></li>
										<li><a href="#">중고 음반</a></li>
										<li><a href="#">중고 DVD/블루레이</a></li>
										<li><a href="#">중고 외국도서</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">알라딘 굿즈</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">문구</a></li>
										<li><a href="#">독서용품</a></li>
										<li><a href="#">데스크용품</a></li>
										<li><a href="#">디지털</a></li>
										<li><a href="#">가방·파우치</a></li>
										<li><a href="#">생활용품</a></li>
										<li><a href="#">리빙·키친</a></li>
										<li><a href="#">의류·잡화</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">음반</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">가요</a></li>
										<li><a href="#">클래식</a></li>
										<li><a href="#">팝</a></li>
										<li><a href="#">재즈</a></li>
										<li><a href="#">국악</a></li>
										<li><a href="#">월드뮤직</a></li>
										<li><a href="#">종교/명상/기타</a></li>
										<li><a href="#">J-POP</a></li>
										<li><a href="#">OST</a></li>
										<li><a href="#">LP</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="title">블루레이/DVD</div>
								<div class="text float-grid">
									<ul>
										<li><a href="#">드라마/코미디</a></li>
										<li><a href="#">TV시리즈</a></li>
										<li><a href="#">액션/어드벤처</a></li>
										<li><a href="#">S.F./판타지</a></li>
										<li><a href="#">공포/스릴러</a></li>
										<li><a href="#">애니메이션</a></li>
										<li><a href="#">음악DVD</a></li>
										<li><a href="#">블루레이</a></li>
									</ul>
								</div>
							</li>
						</ul>
						<button class="btn-close"></button>
					</div>
				</div>
			</div>
			
		</div>
		<div class="top-bar">
			<div class="container">
				<ul>
					<div>
						<li class="btn-sec-0"><a href="#"> <img
								src="https://image.aladin.co.kr/img/common/ev_logo.png" alt="">
						</a></li>
						<li class="btn-sec-"><a href="javascript:void(0);">지니 랭킹
								도서</a></li>
						<li class="btn-sec-"><a
							href="${pageContext.request.contextPath}/board/event/main">이
								달의 이벤트</a></li>
						<!-- <li class="btn-sec-"><a href="javascript:void(0);">지니
								중고매장</a></li> -->
						<li class="btn-sec-"><a href="${pageContext.request.contextPath}/book/bookList">전체 도서</a></li>
						
						<!-- 공간 -->
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<!-- // 공간 -->
						
						
						<li><a href="${pageContext.request.contextPath}/book/bookinfo">상품등록</a></li>
						

						<!-- 01.26 수정 : 관리자 페이지 생성 -->
						<c:choose>
							<c:when test="${admin eq '1'}">
								<li><a
								href="${pageContext.request.contextPath}/board/faq/main">관리자페이지</a></li>
								
								<li><a
								href="${pageContext.request.contextPath}/admin/adminOrderLog">주문관리</a></li>
							</c:when>
							<c:otherwise>
								<c:if test="${userid != null}">
								<li><a
								href="${pageContext.request.contextPath}/order/orderLog">구매내역</a></li>
							</c:if>
							</c:otherwise>
						</c:choose>
						
						<li><a
						href="${pageContext.request.contextPath}/board/faq/main">고객센터</a></li>
						<!-- ================================= -->
					</div>
				</ul>
			</div>

		</div>
	</div>

	
	
	<!-- 우측 네비게이션 바 -->
	<div id="pos_scroll" style="width: 0px; height: 0px;">
		<!-- 스크롤 -->
		<div id="scroll" style="position: absolute; left: 50%; margin-left: 630px; margin-top:50px;">
			<div>
				<a href="${pageContext.request.contextPath}/order/shoppingBasket" title="" class="quick_cart">장바구니</a>
				<dl>
					<dt>
						최근본상품<span id="recount"></span>
					</dt>
					<dd>
						<div id="gdscroll"
							style="min-height:300px; height: absolute; overflow: hidden; margin-bottom: 15px;">
							<div id="recentbooks">

							</div>
							<div style="height: 5px; font-size: 0"></div>
						</div>
					</dd>

				</dl>

				<div class="quick_page">
					<span>1/1</span>
				</div>
	
				<div class="quick_arr">
					<a href="javascript:gdscroll(-265)" class="quick_prev">&nbsp;</a> 
					<a href="javascript:gdscroll(265)" class="quick_next">&nbsp;</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //스크롤 -->
	

	
</body>

<script>

	document.querySelector("#cartCount").innerHTML = ${cartCount};   

</script>
</html>