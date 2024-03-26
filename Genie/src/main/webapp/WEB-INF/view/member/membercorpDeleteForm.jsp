<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower:400"
	rel="stylesheet" />

 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<script>

</script>







</head>
<body>
<div class="container">
	<div class="login-wrapper"> 
		<div style="text-align: center;">
		<a href="<%=request.getContextPath()%>/main.jsp"> <img
			src="https://image.aladin.co.kr/img/header/2011/aladin_logo_new.gif"
			alt="아이콘" />
		</a>
		</div>
		<br>
		
 
        <form method="post" action="membercorpDeletePro" id="login-form">
            <label for="userid">아이디</label><input type="text" name="userid" value='${userid}' readonly>
            <label for="pass">비밀번호</label><input type="password" name="pass" required>
            <input type="submit" value="탈퇴하기">
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
		</script>

</body>
</html>

