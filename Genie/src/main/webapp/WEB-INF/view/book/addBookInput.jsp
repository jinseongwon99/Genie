<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("${pageContext.request.contextPath}/book/pictureImgForm","",op);
}


</script>
<h4>등록하기</h4>
<form class="addbook-form" action="addBookPro" method="post" name="abi">
<input type="hidden" name="bookimg">

	<!-- <input type="text" name="booknum" placeholder="상품번호"> -->
	<div>
	<input type="text" name="title" placeholder="제목">
	<input type="text" name="author" placeholder="저자">
	<input type="text" name="category" placeholder="카테고리">
	<input type="text" name="price" placeholder="가격">
	<input type="text" name="pubdate" placeholder="발간일">
	<img src=""  width="100px"  height="120px" id="pic">
	<a href="javascript:win_upload()">사진업로드</a>
	</div>
	<div>
	<input type="hidden" name="summary" value="요약이요" placeholder="요약">
	<input type="text" name="publisher" placeholder="출판사">
	<input type="hidden" name="userid" value="알라딘" placeholder="판매자">
	<!-- <input type="text" name="expdate" placeholder="유효기간"> -->
	<input type="hidden" name="bookstate" value="새상품" placeholder="책상태">
	<input type="hidden" name="grade" value="1" placeholder="접근권한">
	<input type="hidden" name="inventory" value="100" placeholder="재고">
	
	<input type="submit" value="등록">
	</div>
	
</form>

<script> 
window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('addbook-form'); 
	Array.prototype.filter.call(forms, (form) => { 
	form.addEventListener('submit', function (event) { 
		if (form.checkValidity() === false) { 
			event.preventDefault(); 
			event.stopPropagation(); 
			} 
		form.classList.add('was-validated'); 
		}, 
		false); 
	}); 
	}, false); 
</script>