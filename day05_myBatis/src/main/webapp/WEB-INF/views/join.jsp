<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<hr>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="password"></p>
	<p><input type="password" name="userpw2" placeholder="password"></p>
	<p><input type="text" name="username" placeholder="NAME"></p>
	<p><input type="text" name="email" placeholder="EMAIL"></p>
	<p>
		<label><input type="radio" name="gender" value="남성">남성</label>
		<label><input type="radio" name="gender" value="여성">여성</label>
	</p>
	<p><input type="submit" value="회원가입"></p>
</form>

</body>
</html>