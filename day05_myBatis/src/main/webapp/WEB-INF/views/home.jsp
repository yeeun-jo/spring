<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>

<h1>DB Test (myBatis)</h1>
<hr>
<ul>
	<c:forEach var="str" items="${list }">
		<li>${str }</li>
	</c:forEach>
</ul>

${login.username }
${login.userid }

<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<ul>
	<li><a href="${cpath }/ex01">ex01 - memberList</a></li>
	<li><a href="${cpath }/ex02">ex02 - id로 계정 검색하기</a></li>
	<li><a href="${cpath }/${not empty login ? 'logout/' : 'login/' }">
		${not empty login ? '로그아웃' : '로그인' }
	</a></li>
	<li><a href="${cpath }/join/">회원가입</a></li>
</ul>
</body>
</html>