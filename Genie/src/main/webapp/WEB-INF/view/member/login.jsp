<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />  --%> 

<script>

</script>


</head>
<body>
<div style="margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 100px;">
	<div class="login-wrapper"> 
		<div style="text-align: center;">
		<a href="<%=request.getContextPath()%>/main.jsp"> <img
			src="${pageContext.request.contextPath}/image/logo/genieLogin.png"
			alt="아이콘" style="margin-left: -14px;"/>
		</a>
		</div>
		<br>
<%--
			<!--회원타입-->	
			
			<div class="logintype_tab_wrap">
				<ul>
					<li class="on"><a href='${pageContext.request.contextPath}/member/login' 
						onclick="">개인 회원</a></li>
					<li><a href='${pageContext.request.contextPath}/member/logincorp' 
						onclick="">법인/단체 회원</a></li>
				</ul>
			</div>	
  --%>
        <form method="post" action="loginPro" id="login-form">
            <!-- <label for="userid">아이디</label> -->아이디<input type="text" name="userid">
            <!-- <label for="pass">비밀번호</label> -->비밀번호<input type="password" name="pass">
            <input type="submit" value="로그인">
            
            <div>
				<a href="${pageContext.request.contextPath}/member/join" class="">회원가입 하기</a>
				<span>&nbsp;|&nbsp;</span>
				<a href="${pageContext.request.contextPath}/member/findIdForm" class="">아이디 찾기</a>
				<span>&nbsp;|&nbsp;</span>
				<a href="${pageContext.request.contextPath}/member/findPassForm" class="">비밀번호 찾기</a>
			</div>
        </form>
    </div>
</div>

		<script> window.addEventListener('load', () => { 
			const forms = document.getElementsByClassName('validation-form'); 
			Array.prototype.filter.call(forms, (form) => { 
				form.addEventListener('submit', function (event) { 
					if (form.checkValidity() === false) { event.preventDefault(); 
					event.stopPropagation(); } form.classList.add('was-validated'); }, false); });
			}, false); 
		
		
		
		//아이디찾기
		$(function(){
			${"#find-form"}.click(function(){
				location.href = 'findIdPro';	
			})
		});

		</script>

</body>
</html>

