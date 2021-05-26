<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<h1>
	<a href="${cpath }">day08</a>
</h1>
<hr>

<div>
	${login.username }
</div>

<h2>게시판</h2>
<img src="${imgName }" width="100%">



</body>
</html>