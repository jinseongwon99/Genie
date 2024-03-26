<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	alert("${msg}")
	<!-- url : 전달받은 값 (MemberProHandler에서) -->
	//location.href = "${pageContext.request.contextPath}${url}"
	location.href = "${url}";	
</script>
${msg}
${url}
</body>
</html>