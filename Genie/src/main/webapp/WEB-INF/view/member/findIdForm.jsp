<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" />

<script>

	function savePro() {
	    let name = document.querySelector("#name").value
		 let email = document.querySelector("#email").value
		 alert(name+":"+email)
		
	    location.href='${pageContext.request.contextPath}/member/findIdPro?name='+name+"&email="+email 
	}
	
</script>


</head>
<body>
	<div
		style="margin: auto; display: flex; align-items: center; justify-content: center; margin-bottom: 100px;">
		<div class="login-wrapper">
			<div style="text-align: center;">
				<a href="<%=request.getContextPath()%>/main.jsp"> <img
					src="${pageContext.request.contextPath}/image/logo/findId.png"
					alt="아이콘" style="margin-left: -9px; height: 60px;" />
				</a>
			</div>
			<br>

			<form method="post" action="findIdPro" id="login-form">

				이름<input type="text" name="name" id="name"> 이메일<input
					type="email" name="email" id="email"> <input type="submit"
					id="findId" value="아이디 찾기">

				<div>
					<a href="${pageContext.request.contextPath}/member/join" class="">회원가입
						하기</a> <span>&nbsp;|&nbsp;</span> <a
						href="${pageContext.request.contextPath}/member/findPassForm"
						class="">비밀번호 찾기</a>
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
		
		
		</script>

</body>
</html>

