<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/join.css"
	type="text/css">

<script>
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("${pageContext.request.contextPath}/single/pictureimgForm","",op);
}

function selectAll(selectAll)  {
	  const checkboxes = document.querySelectorAll('.agree');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
</script>
</head>
<body>

	<div id="wrap">
		<form method="post" action="joincorpPro" name="joincorp" id="joincorp">
			<input type="hidden" name="CustomerType" id="CustomerType" value="1">
			<input type="hidden" name="Action" id="Action" value="0"> <input
				type="hidden" name="CustIdErrCheck" id="CustIdErrCheck" value="1">
			<input type="hidden" name="EmailErrCheck" id="EmailErrCheck"
				value="0"> <input type="hidden" name="PwdErrCheck"
				id="PwdErrCheck" value="0"> <input type="hidden" name="USA"
				id="USA" value="False"> <input type="hidden" name="RetInfo"
				id="RetInfo" value=""> <input type="hidden" name="AuthType"
				id="AuthType" value="0"> <input type="hidden"
				name="RetInfo14" id="RetInfo14" value=""> <input
				type="hidden" name="AuthType14" id="AuthType14" value="0"> <input
				type="hidden" name="IsRejecter_Nps" id="IsRejecter_Nps" value="1">
			<input type="hidden" name="IsRejecterSMS_Nps" id="IsRejecterSMS_Nps"
				value="1"> <input type="hidden" name="RecommendNewsletter"
				id="RecommendNewsletter" value="2">


			<!--회원타입-->
			<div id="counselBody">
				<div id="counselWrap">
					<div class="conWrap">
						<div class="counsel_box">
							<p class="counsel_title">회원가입</p>
							<p class="counsel_mtitle">불편 사항이나 문의 사항 남겨주시면 신속하고 친절하게 안내해
								드리겠습니다.</p>
						</div>
					</div>
				</div>
			</div>
 

					
			<div class="jointype_tab_wrap">
				<ul>
					<li><a href='#' 
						onclick="location.href='${pageContext.request.contextPath}/member/join'">일반 개인 회원</a></li>
					<li class="on"><a href='#' 
						onclick="location.href='${pageContext.request.contextPath}/member/joincorp'">법인/단체(학교,기업,기관)</a></li>
				</ul>
			
			</div>

			<script type="text/javascript">
				function fn_navi_click(customertype) {
					var f = $j("#join");
					f.find("input[name='CustomerType']").val(customertype);
					f.submit();
				}
			</script>			


			<!--필수 정보 입력-->

			<table width="905" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td
							style="width: 193px; font: 20px malgun gothic; vertical-align: top; letter-spacing: -1px; padding: 25px 0 0 10px">기본
							정보 입력
							<p style="font-size: 14px; line-height: 2;">
								<span class="star">*</span>필수입력항목
							</p>

						</td>
						<td style="padding: 25px 0 0 0">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">

								

								<tbody>
<tr>
										<td width="115" style="color: #333333; font-size: 12px">단체명<span
											class="star">*</span></td>
										<td style="padding: 7px 0 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												
												<!-- 단체명 -->
												<tbody>
													<tr>
														<td width="210"><input type="text" class="textjoin2"
															name="name" id="name"
															style="width: 200px; vertical-align: middle; border-width: 1px; border-color: rgb(153, 153, 153) rgb(223, 223, 223) rgb(223, 223, 223) rgb(153, 153, 153); background-color: rgb(235, 235, 235); color: rgb(51, 51, 51); height: 30px; padding: 0px 7px;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															 value="">

														</td>
														<td width="*">

															<div id="CustomerName_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span
																				id="CustomerName_result"
																				style="padding: 6px 0 0 6px; margin: 0;">단체명을
																					입력해주세요.</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div> <span
															style="color: #787878; font-size: 12px; padding: 0 0 0 14px;">&nbsp;</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									
									
									<!--공통 : 아이디 -->
									<tr>
										<td style="color: #333333; font-size: 12px">아이디<span
											class="star">*</span></td>
										<td style="padding: 7px 0px 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="210"><input type="text" class="textjoin2"
															name="userid" id="userid"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');" value="">
														</td>
														<td width="*">

															<div id="CustId_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span id="CustId_result"
																				style="padding: 6px 0 0 6px; margin: 0;">아이디를
																					입력해 주세요</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div> <span
															style="color: #787878; font-size: 12px; padding: 0 0 0 14px;">(4자~12자리의
																영문자, 숫자 / @,#$등 특수문자는 제외)</span>
														</td>
													</tr>
												</tbody>
											</table>

										</td>
									</tr>
								
									
								
									<!--공통 : 비밀번호 -->
									<tr>
										<td style="color: #333333; font-size: 12px">비밀번호<span
											class="star">*</span></td>
										<td style="padding: 7px 0 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="210"><input type="password"
															name="pass" id="pass" maxlength="20"
															class="textjoin2"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');" value="">
														</td>
														<td width="*">

															<div id="password_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span id="password_result"
																				style="padding: 6px 0 0 6px; margin: 0;">비밀번호는
																					영문, 숫자, 특수문자 중 2가지 조합하여 10자~20자로 설정해주세요.</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div> <span
															style="color: #787878; font-size: 11px; padding: 0 0 0 14px; line-height: 11px;">영문,
																숫자, 특수문자 중 2가지 이상 조합하여 10자~20자</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									<!--공통 : 비밀번호(재확인) -->
									<tr>
										<td style="color: #333333; font-size: 12px">비밀번호 재입력<span
											class="star">*</span></td>
										<td style="padding: 7px 0 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="210"><input type="password"
															name="passchk" id="passchk" maxlength="20"
															class="textjoin2"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');" value="">
														</td>
														<td width="*">

															<div id="PasswordVerify_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span
																				id="PasswordVerify_result"
																				style="padding: 6px 0 0 6px; margin: 0;">비밀번호를
																					다시 한번 입력해주세요.</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div> <span
															style="color: #787878; font-size: 12px; padding: 0 0 0 14px;">비밀번호를
																다시 한번 입력해주세요.</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									
									<!--공통 : 주소-->
									<tr>
										<td style="color: #333333; font-size: 12px">주소<span
											class="star">*</span></td>
										<td style="padding: 7px 0px 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="210"><input type="text" class="textjoin2"
															name="addr" id="addr"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');" value="">
														</td>
														<td width="*">

															<div id="Indiaddr_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span id="CustId_result"
																				style="padding: 6px 0 0 6px; margin: 0;">주소를
																					입력해 주세요</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</td>
													</tr>
												</tbody>
											</table>

										</td>
									</tr>


									<!--공통 : 연락처-->
									<tr>
										<td style="color: #333333; font-size: 12px">휴대전화<span
											class="star">*</span></td>
										<td style="padding: 7px 0 7px 0;">
											<!--휴대전화-->
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="217"><!-- <input type="text" name="hp1"
															value="" id="hp1" class="textjoin2" maxlength="3"
															style="width: 44px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');"> -
															<input type="text" name="hp2" value="" id="hp2"
															class="textjoin2" maxlength="4"
															style="width: 47px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');"> -
															<input type="text" name="hp3" value="" id="hp3"
															class="textjoin2" maxlength="4"
															style="width: 47px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');"> -->
															<input type="text" name="tel"
															value="" id="tel" class="textjoin2" maxlength="20"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');">
														</td>
														<td width="*">

															<div id="hp_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span id="hp_result"
																				style="padding: 6px 0 0 6px; margin: 0;">주문배송문자,
																					ARS 상담/중고매장 이용시 본인확인용으로 사용</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div> <span
															style="color: #787878; font-size: 12px; padding: 0 0 0 14px; text-transform: uppercase">주문배송문자,
																ARS 상담/중고매장 이용시 본인확인용으로 사용</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									
									<!--법인 : 사업자등록번호-->
									  
									<tr>
										<td style="color: #333333; font-size: 12px">사업자등록번호<span
											class="star">*</span></td>
										<td style="padding: 7px 0px 7px 0;">
											<table width="100%" cellpadding="0" cellspacing="0"
												border="0">
												<tbody>
													<tr>
														<td width="210"><input type="text" class="textjoin2"
															name="regisnum" id="regisnum"
															style="width: 200px; vertical-align: middle;"
															onfocus="javascript:InputFocusOn(this)"
															onblur="javascript:InputFocusOut(this)"
															onkeyup="javascript:InputDataCheck(this,'0');" value="">
														</td>
														<td width="*">

															<div id="Indiaddr_helplayer"
																style="position: absolute; display: none; margin-top: -1px; z-index: 1;">
																<table width="100" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_top.gif"></td>
																		</tr>
																		<tr>
																			<td
																				background="/ucl_editor/img_secur/account/makeAccount/join2007_layer02_bg.gif"
																				style="padding-left: 30px; padding-right: 10px;">
																				<img
																				src="/ucl_editor/img_secur/account/makeAccount/20070910_bullet_03.jpg"
																				align="absmiddle"> <span id="CustId_result"
																				style="padding: 6px 0 0 6px; margin: 0;">사업자등록번호를
																					입력해 주세요</span>
																			</td>
																		</tr>
																		<tr>
																			<td><img
																				src="/ucl_editor/img_secur/account/makeAccount/join2007_layer01_foot.gif"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

									<!-- 개인 정보 유효기간 -->
									<input type="hidden" name="SleepExtendYears" value="99">
									<!-- //개인 정보 유효기간 -->
								</tbody>
							</table>


						</td>
					</tr>
				</tbody>
			</table>

			<script type="text/javascript">
				var selectedKey = false;
				$j(document).ready(function($) {
					//이메일 도메인 이벤트
					$("#EmailDomain").change(function() {
						changeDomain(this);
					});
					//    .bind('keyup', (function () {
					//   changeDomain(this);
					//}));

					initEmail();
				});

				function changeDomain(obj) {
					var $email = $j("#Email");
					var $emailDomainText = $j("#EmailDomainText");
					var $emailTd = $j("#emailTd");
					var $emailDomain = $j("#EmailDomain");
					var $accountEmail = $j("#accountemail");

					$accountEmail.val("");

					if ($j(obj).val() == "1") {

						//$emailDomainText.show();
						//$emailTd.css("width", "345px");

						if (!selectedKey) {
							$emailDomainText.focus();
							//$email.focus();
						}

						selectedKey = true;

					} else {
						$emailDomainText.val($emailDomain.val());
						//$emailDomainText.hide();

						//if ($j(obj).val() == "0") {
						//    $emailDomainText.val("");
						//}

						//$emailTd.css("width", "226px");

						selectedKey = false;

					}

					InputDataCheck(obj, '0');

				}

				//이메일 도메인 숨기기
				function hideEmailDomain(isFocusEmail) {
					var email = $j("#Email");
					if (email.val().indexOf("@") <= -1)
						email.val(email.val() + "@");

					if (isFocusEmail)
						email.width(200).focus();
					else
						email.width(200);

					$j("#EmailDomain").hide();
					$j("#EamilSign").hide();
				}

				//이메일 초기화
				function initEmail() {
					var customerJoinInfoAccountEmail = "";
					var $email = $j("#Email");
					var $emailDomainText = $j("#EmailDomainText");
					var $emailTd = $j("#emailTd");
					var $emailDomain = $j("#EmailDomain");
					var $accountEmail = $j("#accountemail");

					if (customerJoinInfoAccountEmail.indexOf("@") > -1) {

						var arrEmail = customerJoinInfoAccountEmail.split("@");
						$emailDomain.val(arrEmail[1]);

						$email.val(arrEmail[0]);

						if (arrEmail[1] != "") {
							$emailDomainText.val(arrEmail[1]);
						}

						//if ($emailDomain.val() == "0") {
						//    $email.val(arrEmail[0]);

						//    if (arrEmail[1] != "") {
						//        $emailDomain.val("1");
						//        $emailDomainText.val(arrEmail[1]);
						//        $emailDomainText.show();
						//        //$emailTd.css("width", "345px");
						//    }

						//}
						//else {
						//    $email.val(arrEmail[0]);
						//    //$emailTd.css("width", "226px");
						//}

						//if ( $j( "#EmailDomain" ).val() == "0" ) {
						//    hideEmailDomain( false );
						//}
						//else {
						//    $j( "#Email" ).val( arrEmail[0] );
						//}
					}
				}
			</script>



			<!--부가정보-->



			<!--약관동의-->



<style type="text/css">

.liststyle_1 li {
	margin-left: 15px;
	*margin-left: 0px;
	padding-bottom: 5px;
	list-style-type: decimal;
}

.liststyle_2 li {
	margin-left: 15px;
	*margin-left: 0px;
	padding-bottom: 2px;
	list-style-type: upper-roman;
}
	
</style>

			<div
				style="margin: 0 auto; padding: 30px 0 0 0; border-bottom: 1px solid #dedede; width: 930px"></div>


			<table width="905" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tbody>
					<tr>
						<td
							style="width: 193px; font: 20px malgun gothic; vertical-align: top; letter-spacing: -1px; padding: 25px 0 0 10px">약관
							동의</td>
						<td style="padding: 25px 0 0 0">
							<div class="join_agrCheckAll">
								<input type="checkbox" name="agrStipulationAll"
									id="agrStipulationAll" value="1" class="agree"
									onclick="selectAll(this)"> <label
									for="agrStipulationAll">모든 약관에 동의합니다.</label>
							</div>
							<p class="join_agrCheck_txt">아래 모든 약관 및 마케팅 안내 수신(선택) 내용을 확인
								및 동의합니다.</p>
							<ul class="join_agrCheck_new">
								<li><input type="checkbox" id="agrAladin1" name="agrAladin"
									class="agree" value="1"> <label for="agrAladin1">[필수]
										알라딘 이용약관</label> <span><a
										href="/account/waccount_provision.aspx?pType=1"
										target="_blank"><img
											src="//image.aladin.co.kr/img/svg/arrow_go_b.svg" alt="새창열기"></a></span>
								</li>
								<li><input type="checkbox" id="agrCommunity1"
									name="agrCommunity" class="agree" value="1"> <label
									for="agrCommunity1">[필수] 커뮤니티 이용약관</label> <span><a
										href="/account/waccount_provision.aspx?pType=2"
										target="_blank"><img
											src="//image.aladin.co.kr/img/svg/arrow_go_b.svg" alt="새창열기"></a></span>
								</li>
								<li><input type="checkbox" id="agrInfo1" name="agrInfo"
									class="agree" value="1"> <label for="agrInfo1">[필수]
										개인정보 수집 및 이용동의</label> <span><a href="javascript:void(0);"
										onclick="AgrProvision(0)"><img
											src="//image.aladin.co.kr/img/svg/arrow_go_b.svg" alt="내용보기"></a></span>
								</li>
								<li><input type="checkbox" id="agrInfoChoice"
									name="agrInfoChoice" class="agree" value="1"> <label
									for="agrInfoChoice">[선택] 홍보 마케팅 목적 개인정보 수집 이용 동의</label> <span><a
										href="javascript:void(0);" onclick="AgrProvision(1)"><img
											src="//image.aladin.co.kr/img/svg/arrow_go_b.svg" alt="내용보기"></a></span>
								</li>
							</ul>
							<ul class="join_agrCheck2">
								<li><input type="checkbox" id="AppPushOnEvent"
									name="AppPushOnEvent" class="agree" value="1"> <label
									for="AppPushOnEvent">앱 푸시</label></li>
								<li><input type="checkbox" id="NewsSMS" name="NewsSMS"
									class="agree" value="1"> <label for="NewsSMS">문자/카카오톡</label></li>
								<li><input type="checkbox" id="Event" name="Event"
									class="agree" value="1"> <label for="Event">이메일</label></li>
								<!--<li><input type="checkbox" id="NewsLetterOption" name="NewsLetterOption" class="agree" value="1" /> <label for="NewsLetterOption">관심 분야별 맞춤 뉴스레터 수신</label></li>-->
								<p style="padding: 5px 0 0 21px">
									ㆍ홍보 마케팅 목적 개인정보 수집 및 이용에 동의하신 경우, 해당 정보를 수신 받을 채널을 선택해 주세요. <br>
									ㆍ선택 항목에 동의하지 않더라도 회원가입 및 일반 서비스를 이용하실 수 있습니다.
								</p>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>





			<script type="text/javascript">
				function fn_stipulation_checkall() {
					if ($j("input[name='agrStipulationAll'][type='checkbox']")
							.is(':checked')) {
						$j(".agree").attr("checked", true);
						//$j("#RecommendNewsletter").val(1);
						if ($j("#CustomerType").val() == 1) {
							$j("#IsRejecter_Nps").val(0);
							$j("#IsRejecterSMS_Nps").val(0);
						}
					} else {
						$j(".agree").attr("checked", false);
						//$j("#RecommendNewsletter").val(2);
						if ($j("#CustomerType").val() == 1) {
							$j("#IsRejecter_Nps").val(1);
							$j("#IsRejecterSMS_Nps").val(1);
						}
					}
				}

				function AgrProvision(index) {
					$j(".provision").show();
					$j('html, body').animate({
						scrollTop : $j(".agr_text").eq(index).offset().top
					}, '100', 'swing');
				}

				$j(document)
						.ready(
								function() {
									$j("#agrInfoChoice")
											.change(
													function() {
														if ($j(this).is(
																':checked')) {
															/*
															$j("#NewsLetterOption").attr("checked", true);
															$j("#Event").attr("checked", true);
															$j("#NewsSMS").attr("checked", true);
															$j("#AppPushOnEvent").attr("checked", true);
															$j("#RecommendNewsletter").val(1);
															 */

															if ($j(
																	"#CustomerType")
																	.val() == 1
																	|| $j(
																			"#CustomerType")
																			.val() == 3) {
																$j(
																		"#IsRejecter_Nps")
																		.val(0);
																$j(
																		"#IsRejecterSMS_Nps")
																		.val(0);
															}
														} else {
															//$j("#NewsLetterOption").attr("checked", false);
															$j("#Event").attr(
																	"checked",
																	false);
															$j("#NewsSMS")
																	.attr(
																			"checked",
																			false);
															$j(
																	"#AppPushOnEvent")
																	.attr(
																			"checked",
																			false);
															//$j("#RecommendNewsletter").val(2);

															if ($j(
																	"#CustomerType")
																	.val() == 1
																	|| $j(
																			"#CustomerType")
																			.val() == 3) {
																$j(
																		"#IsRejecter_Nps")
																		.val(1);
																$j(
																		"#IsRejecterSMS_Nps")
																		.val(1);
															}
														}
													});

									$j("#NewsSMS")
											.change(
													function() {
														if ($j(this).is(
																':checked')) {
															$j("#agrInfoChoice")
																	.attr(
																			"checked",
																			true);
														}

														if ($j("#CustomerType")
																.val() == 1) {
															if ($j(this).is(
																	':checked')) {
																$j(
																		"#IsRejecterSMS_Nps")
																		.val(0);
															} else {
																$j(
																		"#IsRejecterSMS_Nps")
																		.val(1);
															}
														}
													});

									$j("#Event")
											.change(
													function() {
														if ($j(this).is(
																':checked')) {
															$j("#agrInfoChoice")
																	.attr(
																			"checked",
																			true);
														}

														if ($j("#CustomerType")
																.val() == 1) {
															if ($j(this).is(
																	':checked')) {
																$j(
																		"#IsRejecter_Nps")
																		.val(0);
															} else {
																$j(
																		"#IsRejecter_Nps")
																		.val(1);
															}
														}
													});

									$j("#AppPushOnEvent").change(
											function() {
												if ($j(this).is(':checked')) {
													$j("#agrInfoChoice").attr(
															"checked", true);
												}
											});

									$j("#NewsLetterOption").change(
											function() {
												if (!$j("#agrInfoChoice").is(
														':checked')) {
													$j("#agrInfoChoice").attr(
															"checked", true);
												}

												if ($j(this).is(':checked')) {
													$j("#RecommendNewsletter")
															.val(1);
												} else {
													$j("#RecommendNewsletter")
															.val(2);
												}
											});

									$j(".agree").change(
											function() {
												if (!$j(this).is('checked')) {
													$j("#agrStipulationAll")
															.attr("checked",
																	false);
												}
											});
								});
			</script>


			<div
				style="margin: 0 auto; padding: 30px 0 0 0; border-bottom: 4px solid #505050; width: 930px"></div>



			<div style="margin: 0 auto; padding: 20px 0; text-align: center; width: 930px">
				<img id="process-img"
					style="display: none; width: 54px; height: 55px; border: none;"
					src="https://image.aladin.co.kr/img/loader.gif" alt="처리중...">
				<div id="btn-submit" class="button_buyitnow_join">
				<!-- 	<a href="javascript:void(0);" onclick="frmsubmit(); return false;">회원
						가입하기</a> -->
					<button type="submit" style="color: #fff;padding: 12px 29px;">가입하기</button>
				</div>
			</div>
			<input type="hidden" name="_agrParent" id="_agrParent" value="0"><input
				type="hidden" name="_SleepExtendYears" id="_SleepExtendYears"
				value="99">
			<!--법인 도서관사서-->
			<input type="hidden" name="Librarian" id="Librarian" value="0">

			<div class="join_space2"></div>
			<div class="provision" style="display: none;">


				<div class="agr_content_warp app">
					<h3 class="agr_text">개인정보의 수집항목, 처리목적, 보유 및 이용기간</h3>
					<p style="font-size: 13px; padding: 10px 0 0 0;">알라딘이 처리하는
						개인정보의 항목, 목적, 보유 및 이용기간은 다음과 같습니다. 선택항목은 입력하지 않더라도 회원가입이나 서비스 이용에
						제한은 없습니다.</p>
					<table class="p_table1" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="40%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr>
								<th>수집방법</th>
								<th>대상</th>
								<th>수집항목</th>
								<th>처리목적</th>
								<th>보유 및 이용기간</th>
							</tr>
							<tr>
								<td rowspan="6" align="center">통합<br>회원가입
								</td>
								<td align="center">개인<br>(만 14세 이상)
								</td>
								<td>[필수]<br>이름, 아이디, 이메일, 비밀번호, 휴대폰번호
								</td>
								<td rowspan="4"><strong>본인확인, 회원관리, 서비스 이용에 따른 정보
										제공 및 상담<strong></strong>
								</strong></td>
								<td rowspan="6" align="center"><strong>회원 탈퇴 시까지<br>(단,
										관계 법령에 따름)<strong></strong></strong></td>
							</tr>
							<!-- 
							<tr>
								<td align="center">개인<br>(만 14세 미만)
								</td>
								<td>[필수]<br>이름, 아이디, 이메일, 비밀번호, 휴대폰번호, 생년월일, 법정대리인
									정보(통신사, 이름, 생년월일, 성별, 휴대폰번호), 가입자와의 관계
								</td>
							</tr>
							 -->
							<tr>
								<td align="center">법인/단체<br>(학교, 기업, 기관)
								</td>
								<td>[필수]<br>법인/단체명, 법인/단체 유형(기업, 학교, 기타), 담당자명, 아이디,
									이메일, 비밀번호, 휴대폰번호<br> [선택]<br>도서관 사서, 사업자 등록번호
								</td>
							</tr>
							<!-- 
							<tr>
								<td align="center">해외 거주자</td>
								<td>[필수]<br>이름, 아이디, 이메일, 비밀번호, 휴대폰번호
								</td>
							</tr>
							<tr>
								<td align="center">SNS 회원가입<br>(구글, 애플, 카카오, 트위터)
								</td>
								<td>[필수]<br>이름, 이메일, 암호화된 동일인 식별정보(CI)
								</td>
								<td rowspan="2"><strong>SNS 회원가입을 위한 본인확인<strong></strong></strong></td>
							</tr>
							<tr>
								<td align="center">SNS 회원가입<br>(네이버, 삼성 패스)
								</td>
								<td>[필수]<br>성명, 이메일, 휴대폰번호, 생년월일, 성별, 암호화된 동일인 식별
									정보(CI)
								</td>
							</tr>
							 -->
							<tr>
								<td align="center" rowspan="2">자동수집</td>
								<td align="center" rowspan="2">회원, 비회원</td>
								<td>[필수]<br>IP주소
								</td>
								<td><strong>전자책 부정 이용 방지<strong></strong></strong></td>
								<td align="center"><strong>회원 탈퇴 시까지<br>(단,
										관계 법령에 따름)<strong></strong></strong></td>
							</tr>
							<tr>
								<td>[필수]<br>IP주소, 쿠키, 방문 일시, OS 종류, 브라우저 종류, 단말기 모델,
									단말기 OS 종류, PC 및 모바일 여부, 검색키워드
								</td>
								<td><strong>이용자의 관심, 성향에 기반한 개인 맞춤형 추천서비스를 제공<strong></strong></strong></td>
								<td align="center"><strong>동의 철회 시, 회원 탈퇴 시까지<br>(단,
										관계 법령에 따름)<strong></strong></strong></td>
							</tr>
						</tbody>
					</table>
					<div class="join_space25"></div>


					<br> <a id="argChoice" name="argChoice"></a>
					<h3 class="agr_text">개인정보의 수집항목, 처리목적, 보유 및 이용기간(선택)</h3>
					<p style="font-size: 13px; padding: 10px 0 0 0;">알라딘이 처리하는
						개인정보의 항목, 목적, 보유 및 이용기간은 다음과 같습니다. 선택항목은 입력하지 않더라도 회원가입이나 서비스 이용에
						제한은 없습니다.</p>
					<table class="p_table1" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="40%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr>
								<th>수집방법</th>
								<th>대상</th>
								<th>수집항목</th>
								<th>처리목적</th>
								<th>보유 및 이용기간</th>
							</tr>
							<tr>
								<td rowspan="1" align="center">뉴스레터 구독,마케팅</td>
								<td align="center">회원,비회원</td>
								<td>[선택]<br>이메일,휴대전화번호
								</td>
								<td rowspan="4"><strong>신간, 이벤트 안내, 맞춤 서비스 제공<strong></strong></strong></td>
								<td rowspan="6" align="center"><strong>구독 취소시까지<strong></strong></strong></td>
							</tr>
						</tbody>
					</table>

				</div>


			</div>
		</form>

		<br>
	</div>

<script>
function openmemberinput(membertype) {
  var i;
  var x = document.getElementsByClassName("member");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  document.getElementById(membertype).style.display = "block";  
}
</script>


</body>
</html>