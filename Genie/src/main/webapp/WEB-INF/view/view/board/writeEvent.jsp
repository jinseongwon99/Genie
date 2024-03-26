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




</head>
<body>

	<div id=wrap>

		<div id="counselBody">
			<div id="counselWrap">


				<!-- Location -->
				<div class="conWrap p_center" id="selCSS2">
					<div class="counsel_box">
						<p class="counsel_title">이벤트 등록</p>
						<p class="counsel_mtitle">관리자 전용 - 이벤트 등록</p>
					</div>

									<!-- left contents -->

					<div class="side_t2">
						<!-- sub navi -->
						<div class="cate_comm">
							<ul class="cate_d1">
								<li class="cate_d1_li open"><span class="cate_d1_link ">자주
										찾는 질문 FAQ</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/faq/main'">FAQ</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/faq/writeForm'">FAQ
														등록</a></li>
											</c:if>
										</ul>
									</div></li>


								<li class="cate_d1_li open"><span class="cate_d1_link ">1:1
										상담</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/inquiryForm'">1:1
													상담하기</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/replyList'">1:1
														상담 답변등록</a></li>
											</c:if>

											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/oneOnOne/list'">1:1
													상담내역</a></li>
										</ul>
									</div></li>

								<li class="cate_d1_li open"><span class="cate_d1_link ">공지사항</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/notice/main'">공지사항</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/notice/writeForm'">공지사항
														등록</a></li>
											</c:if>

										</ul>
									</div></li>


								<li class="cate_d1_li open"><span class="cate_d1_link ">이벤트</span>
									<div class="cate_d2">
										<ul>
											<li class="cate_d2_link"><a href="javascript:void(0);"
												onclick="location.href='${pageContext.request.contextPath}/board/event/main'">이벤트</a></li>

											<c:if test="${admin eq '1'}">
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/board/event/writeForm'">이벤트
														등록 </a></li>
											</c:if>
										</ul>
									</div></li>

								

								<c:if test="${admin eq '1'}">
									<li class="cate_d1_li open"><span class="cate_d1_link ">고객
											관리</span>
										<div class="cate_d2">
											<ul>
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/admin/member'">고객
														정보 관리</a></li>
											</ul>
										</div></li>

									<li class="cate_d1_li open"><span class="cate_d1_link ">도서
											관리</span>
										<div class="cate_d2">
											<ul>
												<li class="cate_d2_link"><a href="javascript:void(0);"
													onclick="location.href='${pageContext.request.contextPath}/admin/book'">도서
														정보 관리</a></li>
											</ul>
										</div></li>

								</c:if>


							</ul>

						</div>
						<!-- //sub navi -->

					</div>
					<!-- //left contents -->

					<!-- right contents -->
					<br>
					<div id="conBig" style="width: 100%;">

						<p class=" t_gr"></p>

						<p></p>
						<div class="boardRegisterDiv">
							<form name="event"
								action="${pageContext.request.contextPath}/board/event/writePro"
								method="post" enctype="multipart/form-data">


								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="boardList07">

									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>

								</table>
								<table id="0" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>

								</table>

								<table id="1" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>제목</th>
											<td class="td_L10 tdE"><input type="text" name="title"
												style="min-width: 350px;" maxlength="100">
												<p id="commentLength" class="al_right t_11gr"
													style="display: none"></p></td>
										</tr>
									</tbody>
								</table>

								<!-- 배너 이미지 저장 -->
								<table id="5" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>배너 이미지</th>
											<td class="td_L10 tdE"><input type="file" name="file1"
												style="border: none; height: 25px;"></td>
										</tr>
									</tbody>
								</table>


								<!-- 내용 이미지 저장 -->
								<table id="5" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td class="td_L10 tdE"><input type="file" name="file2"
												style="border: none; height: 25px;"></td>
										</tr>
									</tbody>
								</table>

								<!-- 이벤트 날짜 등록 -->
								<table id="5" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>진행 기간</th>
											<td class="td_L10 tdE"><input type="hidden"
												name="startdate" id="startdate" value=""> <input
												type="hidden" name="enddate" id="enddate" value="">

												<!-- 날짜 선택 --> <span class="block mt5"> <span
													id="year"><select id="fromYear" name="fromYear"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="2021">2021</option>
															<option value="2022">2022</option>
															<option value="2023">2023</option>
															<option value="2024">2024</option></select></span> <span id="month"><select
														id="fromMonth" name="fromMonth"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option></select></span> <span id="day"><select
														id="fromDay" name="fromDay"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="27">27</option>
															<option value="28">28</option>
															<option value="29">29</option>
															<option value="30">30</option>
															<option value="31">31</option></select></span> <span
													style="margin-left: 10px; margin-right: 10px;"> - </span> <span
													id="year"><select id="toYear" name="toYear"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="2021">2021</option>
															<option value="2022">2022</option>
															<option value="2023">2023</option>
															<option value="2024">2024</option></select></span> <span id="month"><select
														id="toMonth" name="toMonth"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option></select></span> <span id="day"><select
														id="toDay" name="toDay"
														style="border: 1pt solid #999999; font-size: 9pt; color: #333333; min-width: 90px;"><option
																value="01">01</option>
															<option value="02">02</option>
															<option value="03">03</option>
															<option value="04">04</option>
															<option value="05">05</option>
															<option value="06">06</option>
															<option value="07">07</option>
															<option value="08">08</option>
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="27">27</option>
															<option value="28">28</option>
															<option value="29">29</option>
															<option value="30">30</option>
															<option value="31">31</option></select></span> <span> <!-- <a href="javascript: goCounselList();"><span>조회</span></a> -->
														<button type="button" onclick="onSubmitForm()"
															value="선택완료"
															style="display: inline-block; font: bolder 12px 돋움; height: 40px; text-align: center; text-decoration: none; border: 1px solid #8f8f8f; background: #9d9d9d; color: #fff !important; border-radius: 5px; padding: 4px 10px;">
														<span style="color: #fff; font-size:15px !important">선택완료</span>
														</button>
												</span>
											</span></td>
										</tr>
									</tbody>
								</table>

								<!-- <table id="5" class="boardList07" width="100%" border="0"
									cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="150">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<td colspan="2" class="td_line"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td class="td_L10 tdE"><textarea
													style="min-width: 600px; height: 240px;" name="content"></textarea>
											</td>
										</tr>
									</tbody>
								</table> -->

								<!-- btn area -->
								<div style="margin: 10px 300px;">
									<button type="submit" id="app" class="btnC mt25 mb25">
										<a>등록하기</a>
									</button>

								</div>

							</form>
						</div>



					</div>
					<!-- //right contents -->
				</div>
			</div>
		</div>

		<br>
	</div>

	<script>
		// submit 버튼을 눌렀을 때 날짜값을 fromDate, toDate에 저장 
		function onSubmitForm() {
			console.log("!23");
			// fromDate, toDate 의 value값 저장 
			var fromDateForm = document.getElementById("startdate");
			var toDateForm = document.getElementById("enddate");
		
			fromDateForm.value = getSelectedDate("fromYear") + "-"
					+ getSelectedDate("fromMonth") + "-"
					+ getSelectedDate("fromDay");
			toDateForm.value = getSelectedDate("toYear") + "-"
					+ getSelectedDate("toMonth") + "-"
					+ getSelectedDate("toDay");
			
			console.log(fromDateForm.value);
			console.log(toDateForm.value);
			
		}
		
		function getSelectedDate(elementId) {
	        return document.getElementById(elementId).value;
	    }
	</script>

</body>


</html>