<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardMain.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiry.css">

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/css/boardInquiryList.css">




</head>
<body>


	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">

				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">1:1 상담 내역</p>
						<p class="counsel_mtitle">불편 사항이나 문의 사항 남겨주시면 신속하고 친절하게 안내해
							드리겠습니다.</p>
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
										onclick="location.href='${pageContext.request.contextPath}/userBook/book'">등록한 도서 목록</a></li>
				
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

						<li class="cate_d1_li open"><span class="cate_d1_link ">문의</span>
							<div class="cate_d2">
								<ul>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/list'">내 문의</a></li>
									<li class="cate_d2_link"><a href="javascript:void(0);"
										onclick="location.href='${pageContext.request.contextPath}/member/myreview'">내가 쓴 리뷰</a></li>
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
					<div class="con_t3">
						<h3 class="mt10 mb15"></h3>
						<form name="counselForm"
							action="${pageContext.request.contextPath}/member/list"
							method="post">
							<input type="hidden" name="fromDate" id="fromDate"
								value="${fromDate}"> <input type="hidden" name="toDate"
								id="toDate" value="${toDate}">
							<div class="box_sort">
								<dl>
									<dt class="pt15">기간별 조회</dt>
									<dd style="width: 80%; margin: 13px 0 0 0;">
										<span class="block"> <a href="javascript:void(0);"
											onclick="setDate(0, 0, 15);"><span>최근15일</span></a> <a
											href="javascript:void(0);" onclick="setDate(0, 1, 0);"><span>1개월</span></a>
											<a href="javascript:void(0);" onclick="setDate(0, 3, 0);"><span>3개월</span></a>
											<a href="javascript:void(0);" onclick="setDate(0, 6, 0);"><span>6개월</span></a>
										</span> <span class="block mt5"> <span id="year"><select
												id="fromYear" name="fromYear"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="2021" ${fromYear eq '2021' ? 'selected' : ''}>2021</option>
													<option value="2022"
														${fromYear eq '2022' ? 'selected' : ''}>2022</option>
													<option value="2023"
														${fromYear eq '2023' ? 'selected' : ''}>2023</option>
													<option value="2024"
														${fromYear eq '2024' ? 'selected' : ''}>2024</option></select></span> <span
											id="month"><select id="fromMonth" name="fromMonth"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01" ${fromMonth eq '01' ? 'selected' : ''}>01</option>
													<option value="02" ${fromMonth eq '02' ? 'selected' : ''}>02</option>
													<option value="03" ${fromMonth eq '03' ? 'selected' : ''}>03</option>
													<option value="04" ${fromMonth eq '04' ? 'selected' : ''}>04</option>
													<option value="05" ${fromMonth eq '05' ? 'selected' : ''}>05</option>
													<option value="06" ${fromMonth eq '06' ? 'selected' : ''}>06</option>
													<option value="07" ${fromMonth eq '07' ? 'selected' : ''}>07</option>
													<option value="08" ${fromMonth eq '08' ? 'selected' : ''}>08</option>
													<option value="09" ${fromMonth eq '09' ? 'selected' : ''}>09</option>
													<option value="10" ${fromMonth eq '10' ? 'selected' : ''}>10</option>
													<option value="11" ${fromMonth eq '11' ? 'selected' : ''}>11</option>
													<option value="12" ${fromMonth eq '12' ? 'selected' : ''}>12</option></select></span>
											<span id="day"><select id="fromDay" name="fromDay"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01" ${fromDay eq '01' ? 'selected' : ''}>01</option>
													<option value="02" ${fromDay eq '02' ? 'selected' : ''}>02</option>
													<option value="03" ${fromDay eq '03' ? 'selected' : ''}>03</option>
													<option value="04" ${fromDay eq '04' ? 'selected' : ''}>04</option>
													<option value="05" ${fromDay eq '05' ? 'selected' : ''}>05</option>
													<option value="06" ${fromDay eq '06' ? 'selected' : ''}>06</option>
													<option value="07" ${fromDay eq '07' ? 'selected' : ''}>07</option>
													<option value="08" ${fromDay eq '08' ? 'selected' : ''}>08</option>
													<option value="09" ${fromDay eq '09' ? 'selected' : ''}>09</option>
													<option value="10" ${fromDay eq '10' ? 'selected' : ''}>10</option>
													<option value="11" ${fromDay eq '11' ? 'selected' : ''}>11</option>
													<option value="12" ${fromDay eq '12' ? 'selected' : ''}>12</option>
													<option value="13" ${fromDay eq '13' ? 'selected' : ''}>13</option>
													<option value="14" ${fromDay eq '14' ? 'selected' : ''}>14</option>
													<option value="15" ${fromDay eq '15' ? 'selected' : ''}>15</option>
													<option value="16" ${fromDay eq '16' ? 'selected' : ''}>16</option>
													<option value="17" ${fromDay eq '17' ? 'selected' : ''}>17</option>
													<option value="18" ${fromDay eq '18' ? 'selected' : ''}>18</option>
													<option value="19" ${fromDay eq '19' ? 'selected' : ''}>19</option>
													<option value="20" ${fromDay eq '20' ? 'selected' : ''}>20</option>
													<option value="21" ${fromDay eq '21' ? 'selected' : ''}>21</option>
													<option value="22" ${fromDay eq '22' ? 'selected' : ''}>22</option>
													<option value="23" ${fromDay eq '23' ? 'selected' : ''}>23</option>
													<option value="24" ${fromDay eq '24' ? 'selected' : ''}>24</option>
													<option value="25" ${fromDay eq '25' ? 'selected' : ''}>25</option>
													<option value="26" ${fromDay eq '26' ? 'selected' : ''}>26</option>
													<option value="27" ${fromDay eq '27' ? 'selected' : ''}>27</option>
													<option value="28" ${fromDay eq '28' ? 'selected' : ''}>28</option>
													<option value="29" ${fromDay eq '29' ? 'selected' : ''}>29</option>
													<option value="30" ${fromDay eq '30' ? 'selected' : ''}>30</option>
													<option value="31" ${fromDay eq '31' ? 'selected' : ''}>31</option></select></span>
											<span> - </span> <span id="year"><select id="toYear"
												name="toYear"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="2021" ${toYear eq '2021' ? 'selected' : ''}>2021</option>
													<option value="2022" ${toYear eq '2022' ? 'selected' : ''}>2022</option>
													<option value="2023" ${toYear eq '2023' ? 'selected' : ''}>2023</option>
													<option value="2024" ${toYear eq '2024' ? 'selected' : ''}>2024</option></select></span>
											<span id="month"><select id="toMonth" name="toMonth"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01" ${toMonth eq '01' ? 'selected' : ''}>01</option>
													<option value="02" ${toMonth eq '02' ? 'selected' : ''}>02</option>
													<option value="03" ${toMonth eq '03' ? 'selected' : ''}>03</option>
													<option value="04" ${toMonth eq '04' ? 'selected' : ''}>04</option>
													<option value="05" ${toMonth eq '05' ? 'selected' : ''}>05</option>
													<option value="06" ${toMonth eq '06' ? 'selected' : ''}>06</option>
													<option value="07" ${toMonth eq '07' ? 'selected' : ''}>07</option>
													<option value="08" ${toMonth eq '08' ? 'selected' : ''}>08</option>
													<option value="09" ${toMonth eq '09' ? 'selected' : ''}>09</option>
													<option value="10" ${toMonth eq '10' ? 'selected' : ''}>10</option>
													<option value="11" ${toMonth eq '11' ? 'selected' : ''}>11</option>
													<option value="12" ${toMonth eq '12' ? 'selected' : ''}>12</option></select></span>
											<span id="day"><select id="toDay" name="toDay"
												style="border: 1pt solid #999999; font-size: 9pt; color: #333333;"><option
														value="01" ${toDay eq '01' ? 'selected' : ''}>01</option>
													<option value="02" ${toDay eq '02' ? 'selected' : ''}>02</option>
													<option value="03" ${toDay eq '03' ? 'selected' : ''}>03</option>
													<option value="04" ${toDay eq '04' ? 'selected' : ''}>04</option>
													<option value="05" ${toDay eq '05' ? 'selected' : ''}>05</option>
													<option value="06" ${toDay eq '06' ? 'selected' : ''}>06</option>
													<option value="07" ${toDay eq '07' ? 'selected' : ''}>07</option>
													<option value="08" ${toDay eq '08' ? 'selected' : ''}>08</option>
													<option value="09" ${toDay eq '09' ? 'selected' : ''}>09</option>
													<option value="10" ${toDay eq '10' ? 'selected' : ''}>10</option>
													<option value="11" ${toDay eq '11' ? 'selected' : ''}>11</option>
													<option value="12" ${toDay eq '12' ? 'selected' : ''}>12</option>
													<option value="13" ${toDay eq '13' ? 'selected' : ''}>13</option>
													<option value="14" ${toDay eq '14' ? 'selected' : ''}>14</option>
													<option value="15" ${toDay eq '15' ? 'selected' : ''}>15</option>
													<option value="16" ${toDay eq '16' ? 'selected' : ''}>16</option>
													<option value="17" ${toDay eq '17' ? 'selected' : ''}>17</option>
													<option value="18" ${toDay eq '18' ? 'selected' : ''}>18</option>
													<option value="19" ${toDay eq '19' ? 'selected' : ''}>19</option>
													<option value="20" ${toDay eq '20' ? 'selected' : ''}>20</option>
													<option value="21" ${toDay eq '21' ? 'selected' : ''}>21</option>
													<option value="22" ${toDay eq '22' ? 'selected' : ''}>22</option>
													<option value="23" ${toDay eq '23' ? 'selected' : ''}>23</option>
													<option value="24" ${toDay eq '24' ? 'selected' : ''}>24</option>
													<option value="25" ${toDay eq '25' ? 'selected' : ''}>25</option>
													<option value="26" ${toDay eq '26' ? 'selected' : ''}>26</option>
													<option value="27" ${toDay eq '27' ? 'selected' : ''}>27</option>
													<option value="28" ${toDay eq '28' ? 'selected' : ''}>28</option>
													<option value="29" ${toDay eq '29' ? 'selected' : ''}>29</option>
													<option value="30" ${toDay eq '30' ? 'selected' : ''}>30</option>
													<option value="31" ${toDay eq '31' ? 'selected' : ''}>31</option></select></span>
											<span> <!-- <a href="javascript: goCounselList();"><span>조회</span></a> -->
												<a href="javascript: update();"><span>날짜 선택</span></a>
										</span>
										</span>
									</dd>
								</dl>
								<dl>
									<dt style="margin: 4px 0 0 0;">내역별 조회</dt>
									<dd>
										<span class="block"> <span> <select
												name="replyYn"
												style="width: 140px; color: #333333; height: 22px">
													<option value="" selected="">전체상담내역</option>
													<option value="Y" ${replyYn eq 'Y' ? 'selected' : ''}>답변내역</option>
													<option value="N" ${replyYn eq 'N' ? 'selected' : ''}>미답변내역</option>
											</select>
										</span> <span> <!-- <a href="javascript: goCounselList();"><span
													style="background: #8C7E7E; color: #FFF;">조회</span></a></span> -->

												<button type="submit">
													<span id="brown">조회</span>
												</button>
										</span>
									</dd>
								</dl>
							</div>

						</form>

						<!-- tab -->
						<div class="al_right"></div>
						<!-- list  -->
						<table width="760" border="0" cellpadding="0" cellspacing="0"
							class="table_comm mt10">
							<colgroup>
								<col width="100">
								<col width="150">
								<col>
								<col width="70">
							</colgroup>
							<thead>
								<tr>
									<th>상담일자</th>
									<th>상담종류</th>
									<th>제목</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>

								<!-- 답변 open / close 함수 -->
								<script>  
									function openCon(id) {
										var id_obj = document.getElementById(id);
										id_obj.style.display = "";
									}

									function closeCon(id) {
										var id_obj = document.getElementById(id);
										id_obj.style.display = "none";
									}
								</script>



								<!-- loop -->


								<!-- 1대1 문의 리스트 
									
									1) DB 결과값 변수 : inquiryList
									2) inquiry 객체 : inquiryList.get(인덱스번호).getInquiry().get~
									3) replay 객체 : inquiryList.get(인덱스번호).getReply().get~
								-->
								<c:if test="${not empty inquiryList}">

									<!-- <script>
									console.log("123");
									</script> -->


									<c:forEach var="i" begin="0" end="${inquiryList.size()-1}">
										<tr>
											<td>${inquiryList.get(i).getInquiry().getCreateDate()}</td>
											<td>${inquiryList.get(i).getInquiry().getCategoryName(inquiryList.get(i).getInquiry().getCategory())}</td>
											<td class="t_left"><a href="#"
												onclick="openCon('${inquiryList.get(i).getInquiry().getInquiryId()}'); return false">
													${inquiryList.get(i).getInquiry().getTitle()}</a></td>

											<td class="alt">${inquiryList.get(i).getInquiry().getResponseStatus() == 0 ? "답변대기" : "답변완료" }</td>
										</tr>


										<!-- 1대1 문의/답변 open -->

										<tr>
											<td class="manageQues t_left" colspan="4"
												id="${inquiryList.get(i).getInquiry().getInquiryId()}"
												style="display: none">
												<div class="ques">
													<strong>${inquiryList.get(i).getInquiry().getTitle()}</strong>
													<p>${inquiryList.get(i).getInquiry().getContent()}</p>

												</div>


												<div class="answ">
													<c:if
														test="${inquiryList.get(i).getInquiry().getResponseStatus() == 1}">
														<script>
									console.log("${inquiryList.get(i).getReply().getReplyContent()}");
									</script>
														<p>${inquiryList.get(i).getReply().getReplyContent()}</p>
														<br>
														<br>

														<p class="btnTR t_11br3">답변날짜:
															${inquiryList.get(i).getReply().getReplyCreateDate()}</p>
													</c:if>
													<br>

													<p class="btnBR2">
														<a href="#"
															onclick="closeCon('${inquiryList.get(i).getInquiry().getInquiryId()}'); return false;">
															<img
															src="${pageContext.request.contextPath}/image/inquiry/btnW_close.gif"
															alt="닫기">
														</a>
													</p>
												</div>

											</td>
										</tr>
									</c:forEach>
								</c:if>

								<c:if test="${empty inquiryList}">
									<tr>
										<td colspan="4" class="alt" height="100">최근 문의 내역이 없습니다.</td>
									</tr>
								</c:if>



							</tbody>
						</table>
						<!-- //list  -->

						<!-- page -->



						<!-- //page -->
					</div>
					<!-- //right contents -->

				</div>
			</div>
		</div>

		<br>
	</div>

	<!-- 1대1 상담내역 기간별 조회 script -->
	<script>
    window.onload = function () {
    	var fromDate1 = document.getElementById("fromDate");
    	var toDate1 = document.getElementById("toDate");
    	
        if (fromDate1.value === "" || toDate1.value === "") {
        	
        } else {
        	var fromYear = document.getElementById("fromYear");
            var fromMonth = document.getElementById("fromMonth");
            var fromDay = document.getElementById("fromDay");

            var toYear = document.getElementById("toYear");
            var toMonth = document.getElementById("toMonth");
            var toDay = document.getElementById("toDay");
			
            var fromDateValue = fromDate1.value.split("-");
            var toDateValue = toDate1.value.split("-");
            
            setSelectOptions("fromYear", fromDateValue[0]);
            setSelectOptions("fromMonth", fromDateValue[1]);
            setSelectOptions("fromDay", fromDateValue[2]);

            setSelectOptions("toYear", toDateValue[0]);
            setSelectOptions("toMonth", toDateValue[1]);
            setSelectOptions("toDay", toDateValue[2]);
        } 
    }
    
 
    function setDate(yearDiff, monthDiff, dayDiff) {
        var toDate = new Date();
        var fromDate = new Date();

        fromDate.setYear(toDate.getFullYear() - yearDiff);
        fromDate.setMonth(toDate.getMonth() - monthDiff);
        fromDate.setDate(toDate.getDate() - dayDiff);

        setSelectOptions("fromYear", fromDate.getFullYear());
        setSelectOptions("fromMonth", fromDate.getMonth() + 1);
        setSelectOptions("fromDay", fromDate.getDate());

        setSelectOptions("toYear", toDate.getFullYear());
        setSelectOptions("toMonth", toDate.getMonth() + 1);
        setSelectOptions("toDay", toDate.getDate());
        
        // fromDate, toDate 의 value값 저장 
        var fromDateForm = document.getElementById("fromDate");
        var toDateForm = document.getElementById("toDate");
     
        fromDateForm.value = getSelectedDate("fromYear") + "-" + getSelectedDate("fromMonth") + "-" + getSelectedDate("fromDay");
        toDateForm.value = getSelectedDate("toYear") + "-" + getSelectedDate("toMonth") + "-" + getSelectedDate("toDay");

    }

    function setSelectOptions(elementId, value) {
        var selectElement = document.getElementById(elementId);
        
        if (selectElement) {
            const options = Array.from(selectElement.options);

            for (const option of options) {
                if (option.value == value) {
                    option.selected = true;
                } else {
                    option.selected = false;
                }
            }
        } else {
            console.error('Element not found for elementId:', elementId);
        }
    }

    function update() {
    	
    	var fromYear = document.getElementById("fromYear");
        var fromMonth = document.getElementById("fromMonth");
        var fromDay = document.getElementById("fromDay");

        var toYear = document.getElementById("toYear");
        var toMonth = document.getElementById("toMonth");
        var toDay = document.getElementById("toDay");
        
    	 // fromDate, toDate 의 value값 저장 
        var fromDateForm = document.getElementById("fromDate");
        var toDateForm = document.getElementById("toDate");
     
        fromDateForm.value = getSelectedDate("fromYear") + "-" + getSelectedDate("fromMonth") + "-" + getSelectedDate("fromDay");
        toDateForm.value = getSelectedDate("toYear") + "-" + getSelectedDate("toMonth") + "-" + getSelectedDate("toDay");
		
    }
    
    function goCounselList() {
        // 여기에 실제로 조회하는 로직 추가
        alert("조회 기간: " + getSelectedDate("fromYear") + "-" + getSelectedDate("fromMonth") + "-" + getSelectedDate("fromDay") +
            " ~ " + getSelectedDate("toYear") + "-" + getSelectedDate("toMonth") + "-" + getSelectedDate("toDay"));
    }

    function getSelectedDate(elementId) {
        return document.getElementById(elementId).value;
    }
</script>

</body>
</html>