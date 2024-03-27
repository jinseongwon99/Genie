<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 파일 연결 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/chatbot.css">

<%-- <%
	int recentNoticeId = 0;
	String recentNotice = "최근 공지가 없습니다.";
	if((String) session.getAttribute("ntTitle") == null){
		recentNoticeId = 0;
		recentNotice = "최근 공지가 없습니다.";
	}
	else {
		recentNoticeId = (Integer) session.getAttribute("ntId"); 
		recentNotice = (String) session.getAttribute("ntTitle");
	}
%> --%>

</head>
<body>
	<div id=wrap>
		<div class="footer">
			<div class="notice">
				<div class="container float-grid">
					<div class="title">
						<h1>공지사항</h1>
					</div>

					<span style="text-align: center; margin-top: 5px; font-size: 15px;">
						<a href="${pageContext.request.contextPath}/board/notice/info?noticeid=${sessionScope.ntId }">[${sessionScope.ntId }번 공지] : ${sessionScope.ntTitle }</a></span>

				</div>
			</div>
			<div class="corp">
				<div class="container">
					<ul class="footer-menu">
						<div>
							<li>회사소개</li>
							<li>이용약관</li>
							<li>개인정보처리방침</li>
							<li>청소년 보호정책</li>
							<li>중고매장</li>
							<li>제휴/마케팅 안내</li>
							<li>판매자 매니저</li>
							<li>출판사/공급사 안내</li>
							<li>광고 안내</li>
							<li>학교/기업 대량구매</li>
						</div>
					</ul>
					<div class="biz">
						<div class="img-box">
							<img
								src="${pageContext.request.contextPath}/image/logo/genieLogo.png"
								alt="">
						</div>
						<ul>
							<li>(주)Genie</li>
							<li><span>대표이사 : 아무개</span><span>고객정보보호 책임자 : 아무개</span></li>
							<li><span>사업자등록 : 111-11-11111</span><span class="text-deco">E-mail
									: privacy@kic.co.kr</span></li>
							<li><span>통신판매업신고 : 중구01234호</span><span>호스팅 제공자 :
									Genie</span></li>
							<li><span>(본사) 서울시 강남구 테헤란로1길 10</span><span
								class="text-deco">(중고매장) 자세히보기</span></li>
							<li>(고객센터) 서울시 강남구 테헤란로 1길 10 세경빌딩 3층, Fax 02-123-4567</li>
							<li>ⓒ Genie books. All Rights Reserved.</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 챗봇 -->
			
			<script>
			/* $(function() {
			    var INDEX = 0;

			    $("#chat-submit").click(function(e) {
			        e.preventDefault();
			        var msg = $("#chat-input").val();
			        if (msg.trim() == '') {
			            return false;
			        }
			        generate_message(msg, 'self');
			        
			        // AJAX를 사용하여 서버에 메시지를 보냅니다.
			        $.ajax({
			            type: 'GET',
			            url: 'http://127.0.0.1:5000/?msg=' + msg, // 메시지 인코딩
			            dataType: 'json',
			            success: function(data) {
			                var ans = data.msg;
			                console.log(data);
			                var msgArray = ans.split('.');
			                for (var i = 0; i < msgArray.length; i++) {
			                    generate_message(msgArray[i], 'user');
			                }
			                
			            },
			            error: function(xhr, status, error) {
			                console.error('데이터 가져오기 실패:', error);
			            }
			        });

			        // 사용자가 메시지를 보내면 입력 필드를 비웁니다.
			        $("#chat-input").val('');			
			    });

			    // 채팅 메시지 생성 함수		
			    function generate_message(msg, type) {
			        INDEX++;
			        var str = "<div id='cm-msg-" + INDEX + "' class=\"chat-msg " + type + "\">";
			        if (type === 'user') {
			            str += "<span class=\"msg-avatar\">";
			            str += "<img src=\"${pageContext.request.contextPath}\/image\/chatbot\/chaticon.png\">";
			            str += "<span style=\"float: left; margin-top: -32px; margin-left: 35px; font-size: 15px;\">Genie<\/span>";
			            str += "<\/span>";
			        }
			        str += "<div class=\"cm-msg-text\">" + msg + "<\/div>";
			        str += "<\/div>";
			        $(".chat-logs").append(str);
			        $("#cm-msg-" + INDEX).hide().fadeIn(300);
			        $(".chat-logs").stop().animate({
			            scrollTop: $(".chat-logs")[0].scrollHeight
			        }, 1000);
			    }

			    // 채팅 아이콘 클릭 시 채팅창 토글
			    $("#chat-circle").click(function() {
			        $("#chat-circle").toggle('scale');
			        $(".chat-box").toggle('scale');
			    });

			    // 채팅 박스 토글
			    $(".chat-box-toggle").click(function() {
			        $("#chat-circle").toggle('scale');
			        $(".chat-box").toggle('scale');
			    });
			});
 */$(function() {
	    var INDEX = 0;

	    $("#chat-submit").click(function(e) {
	        e.preventDefault();
	        var msg = $("#chat-input").val();
	        if (msg.trim() == '') {
	            return false;
	        }
	        generate_message(msg, 'self');
	        
	        // AJAX를 사용하여 서버에 메시지를 보냅니다.
	        $.ajax({
	            type: 'GET',
	            url: 'http://127.0.0.1:5000/?msg=' + msg, // 메시지 인코딩
	            dataType: 'json',
	            success: function(data) {
	                var ans = data.msg;
	                console.log(data);
	                if (msg === '상품') {
	                    // 상품 관련 링크 생성
	                    var productLinks = [
	                        { id: 'product-A', text: '상품 옵션', msg: '상품 옵션' },
	                        { id: 'product-B', text: '상품 등록', msg: '상품등록' },
	                        { id: 'product-C', text: '상품 문의', msg: '상품 문의' }
	                    ];

	                    productLinks.forEach(function(linkInfo) {
	                        var productLink = $('<a>', {
	                            id: linkInfo.id,
	                            href: '#',
	                            text: linkInfo.text,
	                        });
	                        productLink.click(function(e) {
	                            handleProductClick(e, linkInfo.msg); // 클릭 시 handleProductClick 함수 호출
	                        });
	                        generate_message(productLink.prop('outerHTML'), 'user');
	                    });
	                } else {
	                    var msgArray = ans.split('.');
	                    for (var i = 0; i < msgArray.length; i++) {
	                        generate_message(msgArray[i], 'user');
	                    }
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('데이터 가져오기 실패:', error);
	            }
	        });

	        // 사용자가 메시지를 보내면 입력 필드를 비웁니다.
	        $("#chat-input").val('');            
	    });

	    // 채팅 메시지 생성 함수      
	    function generate_message(msg, type) {
	        INDEX++;
	        var str = "<div id='cm-msg-" + INDEX + "' class=\"chat-msg " + type + "\">";
	        if (type === 'user') {
	            str += "<span class=\"msg-avatar\">";
	            str += "<img src=\"${pageContext.request.contextPath}/image/chatbot/chaticon.png\">";
	            str += "<span style=\"float: left; margin-top: -32px; margin-left: 35px; font-size: 15px;\">Genie<\/span>";
	            str += "<\/span>";
	        }
	        str += "<div class=\"cm-msg-text\">" + msg + "<\/div>";
	        str += "<\/div>";
	        $(".chat-logs").append(str);
	        $("#cm-msg-" + INDEX).hide().fadeIn(300);
	        $(".chat-logs").stop().animate({
	            scrollTop: $(".chat-logs")[0].scrollHeight
	        }, 1000);
	    }

	    // 채팅 아이콘 클릭 시 채팅창 토글
	    $("#chat-circle").click(function() {
	        $("#chat-circle").toggle('scale');
	        $(".chat-box").toggle('scale');
	    });

	    // 채팅 박스 토글
	    $(".chat-box-toggle").click(function() {
	        $("#chat-circle").toggle('scale');
	        $(".chat-box").toggle('scale');
	    });
	    
	    // 공통된 동작을 함수로 정의
	    function handleProductClick(e, msg) {
	        e.preventDefault(); // 기본 동작 방지

	        // 메시지를 사용자 채팅창에 표시
	        generate_message(msg, 'self');
	        
	        // 메시지를 서버로 전송
	        sendAjaxMessage(msg);
	    }

	    // 클릭 이벤트 핸들러 등록
	    $(document).on("click", "#product-A", function(e) {
	        handleProductClick(e, '상품 옵션');
	    });

	    $(document).on("click", "#product-B", function(e) {
	        handleProductClick(e, '상품등록');
	    });

	    $(document).on("click", "#product-C", function(e) {
	        handleProductClick(e, '상품 문의');
	    });


	    // AJAX를 통해 서버로 메시지 전송하는 함수
	    function sendAjaxMessage(msg) {
	        $.ajax({
	            type: 'GET',
	            url: 'http://127.0.0.1:5000/?msg=' + msg, // 메시지 인코딩
	            dataType: 'json',
	            success: function(data) {
	                var ans = data.msg;
	                console.log(data);
	                generate_message(ans, 'user'); // 받은 데이터를 채팅창에 표시
	            },
	            error: function(xhr, status, error) {
	                console.error('데이터 가져오기 실패:', error);
	            }
	        });
	    }
	});

			</script>

			<div id="body_id">

				<div id="chat-circle" class="btn btn-raised">
					<div id="chat-overlay"></div>

					<img
						src="${pageContext.request.contextPath}/image/chatbot/chaticon.png"
						alt="챗봇"
						style="height: 96px; margin-top: -25px; margin-left: -24px;">
				</div>

				<div class="chat-box">
					<div class="chat-box-header">
						<img
							src="${pageContext.request.contextPath}/image/chatbot/chaticon.png"
							alt="챗봇"
							style="height: 61px; margin-left:-172px; margin-top: -11px;">
						<span style="font-size: 17px; font-weight: 500;">Genie</span> <span
							class="chat-box-toggle"><img
									src="${pageContext.request.contextPath}/image/chatbot/close.png"
									alt="close"
									style="height: 20px;"></span>
					</div>
					<div class="chat-box-body">
						<div class="chat-box-overlay"></div>
						<div class="chat-logs"></div>
						<!--chat-log -->
					</div>
					<div class="chat-input">
						<form>
							<input type="text" id="chat-input" placeholder="메시지를 입력해주세요" />
							<button type="submit" class="chat-submit" id="chat-submit">
								<img
									src="${pageContext.request.contextPath}/image/chatbot/send.png"
									alt="send"
									style="height: 20px;">
							</button>
						</form>
					</div>
				</div>

			</div>
			<!-- // 챗봇 -->
			
			<div class="btn-to-top">
				<button>▲</button>
			</div>
		</div>
	</div>
</body>
</html>