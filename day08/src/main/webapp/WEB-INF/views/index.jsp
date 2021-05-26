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

<ul>
	<li><a href="${cpath }/login">로그인</a></li>
	<li><a href="${cpath }/logout">로그아웃</a></li>
	<li><a href="${cpath }/board">게시판</a></li>
	<li><a href="${cpath }/gallery">이미지 갤러리</a></li>
	<li><a href="${cpath }/qna">질문과 답변</a></li>
</ul>




</body>
</html>