<%@page import="model.IndiMember"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<h3>회원정보 수정</h3>
		<form class="" action="membercorpUpdatePro" method="post">
			<label for="name">이름</label>
				<input type="text" class="" id="name" name="name" value='${mem.name}'>
			<label for="userid">아이디</label>
				<input type="text" class="" id="userid" name="userid" value='${mem.userid}' readonly>
			<label for="email">이메일</label>
				<input type="text" class="" id="email" name="email" value='${mem.email}'>
			<label for="pass">비밀번호</label>
				<input type="password" class="" id="pass" name="pass" value='${mem.pass}' required>
			<label for="tel">연락처</label>
				<input type="text" class="" id="tel" name="tel" value='${mem.tel}'>
			<button type="submit" class="">저장</button>
			
			<div></div>
		</form>
		
		<script> window.addEventListener('load', () => { 
			const forms = document.getElementsByClassName('validation-form'); 
			Array.prototype.filter.call(forms, (form) => { 
				form.addEventListener('submit', function (event) { 
					if (form.checkValidity() === false) { 
						event.preventDefault(); event.stopPropagation(); } 
				form.classList.add('was-validated'); }, false); }); }, false); 
		</script>
		
</body>
</html>