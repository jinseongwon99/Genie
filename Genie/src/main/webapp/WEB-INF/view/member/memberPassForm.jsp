<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" />

<script>
function passChk(form){
	
	if(form.chgpass.value != form.chkpass.value){
		alert("신규 비밀번호와 확인 비밀번호가 다릅니다.")
		form.chkpass.value=""; //false일 경우 재입력란 비우기
		form.chkpass.focus() //false일 경우 커서 재입력 란에 위치
		return false
	}
	return true;	
}
</script>


</head>
<body>
	<div
		style="margin: auto; display: flex; align-items: center; justify-content: center; margin-bottom: 100px;">
		<div class="login-wrapper">
			<div style="text-align: center;">
				<span>비밀번호 변경하기</span>
			</div>
			<br>

			<form method="post" action="memberPassPro" id="login-form" novalidate onsubmit="return passChk(this)">
				아이디<input type="text" name="userid" value='${userid}' readonly>
				현재 비밀번호<input type="password" name="pass" value='' required>
				신규 비밀번호<input type="password" name="chgpass" value='' required>
				비밀번호 확인<input type="password" name="chkpass" value='' required>

				<input type="submit" value="저장하기">

				
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

