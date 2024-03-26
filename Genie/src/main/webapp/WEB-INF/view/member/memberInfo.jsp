<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardMain.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardNotice.css">

<style>
h1 {
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
}

.table-point {
	text-align: center;
}

.imgdiv {
	margin-left: auto;
	margin-right: auto;
	width: 100px;
}

.cont {
	display: flex;
	justify-content: flex-end;
}

.box_summery {
	border: 1px solid #e1e1e1;
	overflow: hidden;
	padding: 12px;
	margin-bottom: 15px;
}

.al_center {
	text-align: center;
}

.ml40 {
	margin-left: 40px;
}

#but {
	background: #8C7E7E;
	color: #fff;
	border: 1px solid #E5E5E5;
	display: inline-block;
	text-align: center;
	line-height: 33px;
	width: 85px;
	height: 33px;
	border-radius: 5px;
	font-size: 15px;
	font-family: Noto Sans;
	font-weight: 600;
}
</style>
</head>
<body>
	<%-- <div class="imgdiv">
	<img src="${pageContext.request.contextPath }/image/member/picture/${mem.picture==null?'basicmember.png':mem.picture}" >
</div> --%>

	<div id=wrap>

		<div class="conWrap p_center" id="selCSS2">
			<div class="notice_box">
				<p class="notice_title">마이페이지</p>
				<p class="notice_mtitle">${mem.name}님의 마이페이지</p>
			</div>

			<!-- left contents -->
			<div class="side_t2">
				<!-- sub navi -->
				<div class="cate_comm">
					<ul class="cate_d1">
						<li class="cate_d1_li open"><span class="cate_d1_link ">마이페이지</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberInfo'">마이페이지</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberUpdateForm'">회원정보수정</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberPassForm'">비밀번호변경</a></li>
								</ul>
							</div></li>
							
						<li class="cate_d1_li open"><span class="cate_d1_link ">내 판매 상품</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/userBook/book'">판매중인 도서 목록</a></li>
				
								</ul>
							</div></li>


						<li class="cate_d1_li open"><span class="cate_d1_link ">주문</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/slang'">찜목록</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/shoppingBasket'">장바구니</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/order/orderLog'">주문조회</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/pointLog'">포인트내역</a></li>
								</ul>
							</div></li>

						<li class="cate_d1_li open"><span class="cate_d1_link ">내 활동</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/list'">내 문의</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/myReview'">내가 쓴 리뷰</a></li>
								</ul>
							</div></li>


						<li class="cate_d1_li open"><span class="cate_d1_link "></span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</a></li>

									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/memberDeleteForm'">회원탈퇴</a></li>

								</ul>
							</div></li>

					</ul>

				</div>
				<!-- //sub navi -->

			</div>
			<!-- //left contents -->


			<!-- right contents -->
			<div id="conBig" style="width: 800px; font-size: 18px;">
				<br>
				<!-- 게시판 영역 -->
				<h3 class="cateTit  mt10 mb15">
					<span style="font-size: 20px;">${mem.name}님의 MyPage</span> <span
						class="t_11gr t_normal" style="font-size: 20px;">| </span>
				</h3>

				<div class="box_summery al_center mb15">
					등급 : <strong class="price" style="font-size: 18px;">${totalpoint>300000?'VIP':totalpoint>100000?'플래티넘':totalpoint>30000?'골드':totalpoint>10000?'실버':'브론즈' }</strong>

					<span class="ml40">보유 포인트 : <strong class="price"
						style="font-size: 18px;"> <strong>${mem.point }</strong>

					</strong>
					</span> 
				</div>

				<br>

				<!-- 회원정보 -->
				<div class="con_t3">
					<h3 class="cateTit  mt10 mb15">
						<span style="font-size: 20px;">회원정보</span> <span
							class="t_11gr t_normal" style="font-size: 20px;">| </span>
					</h3>

					<!-- 일반 회원  -->

					<table width="760" border="0" cellpadding="0" cellspacing="0"
						class="table_comm_row mt5">
						<colgroup>
							<col width="150">
							<col width="400">
						</colgroup>
						<tbody>
							<tr>
								<th>ID</th>
								<td class="pos_rel">${mem.userid}</td>
		
							</tr>
							<tr>
								<th>이름</th>
								<td>${mem.name}</td>
							</tr>
							<tr>
								<th>보유포인트</th>
								<td>${mem.point}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${mem.email}</td>
			
							</tr>
							<tr>
								<th>나이</th>
								<td>${sessionScope.sessionAge}</td>
			
							</tr>
							<tr>
								<th>성별</th>
								<td>${mem.gender}</td>
							</tr>
						
							<tr>
								<th>전화번호</th>
								<td>${mem.tel}</td>
			
							</tr>
							
							<tr>
								<th>주소</th>
								<td>${mem.addr}</td>
			
							</tr>
						</tbody>
					</table>


					<br>
					
			
					<!-- //일반 회원  -->
		

				</div>

			</div>
			<!-- //right contents -->
		</div>


	</div>






</body>
</html>