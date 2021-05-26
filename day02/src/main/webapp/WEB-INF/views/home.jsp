<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<p>${name } : ${age }</p>

<h2>예제</h2>
<ul>
	<li><a href="<c:url value="ex01" />">ex01</a>
	<li><a href="<c:url value="ex02" />">ex02</a>
	<li><a href="<c:url value="ex03" />">ex03</a>
	<li><a href="<c:url value="ex04" />">ex04</a>
	<li><a href="<c:url value="ex05" />">ex05</a>
</ul>

</body>
</html>