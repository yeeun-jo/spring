<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<h1>
	<a href="${cpath }">day08</a>
</h1>
<hr>
<h2>로그인</h2>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" autofocus></p>
	<p><input type="password" name="userpw" placeholder="PW"></p>
	<p><input type="submit" value="로그인"></p>
</form>



</body>
</html>