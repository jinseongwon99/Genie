<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<form id="myForm"
		action="${pageContext.request.contextPath}/board/oneOnOne/list"
		method="post">
		<input type="hidden" name="fromDate" value="${fromDate}"> <input
			type="hidden" name="toDate" value="${toDate}"> <input
			type="submit">
	</form>

	<script>
    // 문서가 로드되면 폼을 자동으로 제출
    document.addEventListener('DOMContentLoaded', function () {
        // 폼 요소 가져오기
        var form = document.getElementById('myForm');
        // 폼 제출
        form.submit();
    });
</script>
</body>
</html>