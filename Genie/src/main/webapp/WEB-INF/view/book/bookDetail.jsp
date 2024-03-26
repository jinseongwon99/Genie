<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>${book.bookimg }</h4>
<h4>제목:${book.title }</h4>
<h4>저자:${book.author}</h4>
<h4>내용:${book.summary}</h4>
<h4>발간일:${book.pubdate}</h4>
<h4>가격:${book.price}</h4>



<a href="${pageContext.request.contextPath}/book/bookUpdateForm?booknum=${book.booknum}">책정보수정</a>

<a href="${pageContext.request.contextPath}/book/bookDeleteForm?booknum=${book.booknum}">책 삭제</a>

</body>
</html>