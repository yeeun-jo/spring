<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2021-02-20 board</title>
</head>
<body>

<header>
	<h1><a href="${cpath }/">POS</a></h1>
	<div class="loginInfo">
		<strong>
			${login.username }
			${not empty login ? '(' : '' }
			${login.userid }
			${not empty login ? ')' : '' }
		</strong>
	</div>
<nav>
	<ul>
		<li>
			<a href="${cpath }/${not empty login ? 'logout' :'login' }">
			${not empty login ? '로그아웃' : '로그인' }</a>
		</li>
		<li>
			<a href="${cpath }/add">상품등록</a>
			<a href="${cpath }/list">매출관리</a>
		</li>
	</ul>
</nav>
	<hr>
</header>



