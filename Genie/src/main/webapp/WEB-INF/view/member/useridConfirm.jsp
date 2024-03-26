<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="isID"><%= %></div>
<div id="canID"></div>
<input type="button" id="close" value="닫기">




<script type="text/javascript">
window.onload = function(){
	var result = document.getElementById("isID").innerHTML;
	if(result == 3){
		document.getElementById("canID").innerHTML = "아이디 사용가능합니다.";
	}
	else{
		document.getElementById("canID").innerHTML = "아이디 중복가입되어 있습니다.";
	}
	
	document.getElementById("close").onclick = function(){
		window.opener.document.getElementById("here").innerHTML 
			= document.getElementById("canID").innerHTML;
		close();
	}
}
</script>


</body>





</html>