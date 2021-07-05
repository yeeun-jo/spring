<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호부</title>
<link rel="stylesheet" href="${cpath }/resources/css/style.css">
<script src="${cpath }/resources/js/phonebook.js"></script>
</head>
<body>


<div id="main">
	<div id="header">
		<div id="insert" class="hidden">
			<form id="insertForm" method="POST">
				<p><input type="text" name="name" placeholder="이름"></p>
				<p><input type="text" name="pnum" placeholder="전화번호"></p>
				<p>
					<input id="cancleInsert" type="button" value="취소">
					<input type="submit" value="저장">
				</p>
			</form>
		</div>
		
		<div id="top">
			<div id="group">그룹</div>
			<div id="plus">+</div>
		</div>
		<h1><a id="phonebook" href="${cpath }">연락처</a></h1>
		<div>
			<input onkeyup="filter()" id="searchInput" type="text" name="name" placeholder="검색">
		</div>
		<hr>
	</div>
	
	<div id="pbList"></div>
	
	
	
</div>
<script>
	setCpath('${cpath}');
	ajaxSelectList();
	
	// insert값을 서버에 전송
	const insertForm = document.getElementById('insertForm');
	insertForm.onsubmit = ajaxInsert;
	
</script>

</body>
</html>