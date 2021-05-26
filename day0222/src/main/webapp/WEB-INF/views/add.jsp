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
	<p><input type="text" name="product" placeholder="상품이름"></p>
	<p><input type="number" name="price" placeholder="상품가격"></p>
	<p><input type="number" name="count" placeholder="상품수량"></p>
	<p><input type="submit" value="상품입고"></p>
</form>


</body>
</html>