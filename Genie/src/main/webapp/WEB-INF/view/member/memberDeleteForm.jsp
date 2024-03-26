<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" />



</head>
<body>
	<div
		style="margin: auto; display: flex; align-items: center; justify-content: center; margin-bottom: 100px;">
		<div class="login-wrapper">
			<div style="text-align: center;">
				<span>회원 탈퇴</span>
			</div>
			<br>

			<form method="post" action="memberDeletePro" id="login-form">

				아이디<input type="text" name="userid" value='${userid}' readonly>
				비밀번호<input type="password" name="pass" required> 
				
				<input
					type="submit" value="탈퇴하기">

				
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

