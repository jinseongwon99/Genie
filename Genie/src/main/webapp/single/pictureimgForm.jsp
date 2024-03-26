<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
  
  <form class="form-inline" action="${pageContext.request.contextPath}/book/pictureimgPro"   
  enctype="multipart/form-data"   method="post">
  	
	  <input type="file" class="form-control col-md-3 mb-3"  name="bookimg" id="bookimg">
     <button type="submit" class="btn btn-primary col-md-3 mb-3">사진등록</button>
   
  </form>
</div>

</body>
</html>
