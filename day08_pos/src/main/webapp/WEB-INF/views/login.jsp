<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>로그인</h1>
<hr>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" autofocus></p>
	<p><input type="password" name="userpw" placeholder="PW"></p>
	<p><input type="submit" value="로그인"></p>
</form>

</body>
</html>