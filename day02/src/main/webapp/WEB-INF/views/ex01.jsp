<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>ex01.jsp(GET)</h1>
<hr>

<%-- action이 없으면 현재 주소에서 요청을 처리한다 --%>
<form method="post">
	<p><input name="name" placeholder="이름"></p>
	<p><input name="age" placeholder="나이"></p>
	<p><input type="submit" value="제출"></p>
</form>



</body>
</html>