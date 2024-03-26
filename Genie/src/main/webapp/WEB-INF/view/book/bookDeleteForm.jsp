<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div>
			<div>
				<h4>책 삭제</h4>
				<form class="validation-form" novalidate action="bookDeletePro" method="post">
				
				<input type="hidden" name="booknum" value="${booknum}">${booknum }
					
					
					
					<div class="mb-4"></div>
					<button type="submit">삭제</button>
				</form>
			</div>
		</div>
		
	</div>
	
</body>
</html>