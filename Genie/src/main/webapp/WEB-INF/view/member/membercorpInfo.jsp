<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h4 class="">회원정보</h4>
  <table class="table">      
       
       <tr><td>name</td><td>${mem.name}</td><tr>
       <tr><td>id</td><td>${mem.userid}</td><tr>
       <tr><td>regisnum</td><td>${mem.regisnum}</td><tr> 
       <tr><td>email</td><td>${mem.email}</td><tr>
       <tr><td>tel</td><td>${mem.tel}</td><tr>
       <tr><td>addr</td><td>${mem.addr}</td><tr>
       
          
<tr>
	<td colspan="2" class="btn-memberinfo">
		<a class="w3-button" 
			href='${pageContext.request.contextPath}/member/memberUpdateForm'>회원정보 수정</a>
		<a class="w3-button"
			href='${pageContext.request.contextPath}/member/memberDeleteForm'>회원 탈퇴</a>
		<a class="w3-button"
			href='${pageContext.request.contextPath}/member/memberPassForm'>비밀번호 변경</a>		
	</td>
</tr>
          </table>
       </div>

</body>
</html>