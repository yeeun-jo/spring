<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08</title>
<style type="text/css">
	a {text-decoration: none; color: black;}
	a:hover {text-decoration: underline;}

</style>
</head>
<body>

<h2>상품입고</h2>

<form method="POST">
	<p><input type="text" name="product" value="${dto.product }" readonly ></p>
	<p><input type="number" name="price" value="${dto.price }" readonly ></p>
	<p><input type="number" name="count" value="${dto.count }" autofocus></p>
	<p><input type="submit" value="상품입고"></p>
</form>


</body>
</html>