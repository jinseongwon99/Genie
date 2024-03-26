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
				<h3>회원 정보 수정하기</h3><br>
			</div>
			<br>

			<form method="post" action="memberUpdatePro" id="login-form">
            아이디: 
              <input type="text" name="userid" value='${mem.userid}' id="read-onlymem" readonly><br>
            이름: 
              <input type="text" name="name" value='${mem.name}'><br>
              이메일: 
              <input type="text" name="email" value='${mem.email}'><br>
           	비밀번호: 
              <input type="password" name="pass" value='' required><br>
            연락처: 
              <input type="text" name="tel" value='${mem.tel}'><br>
            주소: 
              <input type="text" name="addr" value='${mem.addr}'><br>
            <%-- <label for="bdate">생년월일: </label>
              <input type="text" name="bdate" value='${mem.birthday}' readonly><br> --%>
            생년월일:
              <input type="text" name="birthday" value='${mem.birthday }' id="read-onlymem" readonly><br>
            포인트:
              <input type="text" name="point" value='${mem.point }' id="read-onlymem" readonly><br>
            <input type="submit" value="저장하기">
   </form>
			
			
		</div>
	</div>


</body>
</html>

