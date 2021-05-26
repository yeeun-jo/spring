<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h2>회원가입</h2>
<%--
	파라미터를 받아서, userpw와 userpw2가 다르다면, 굳이 DAO를 호출할 필요가 있는가?
	DTO와 다른 형식으로 입력을 받는데, 이거 때문에 굳이 클래스를 하나 더 만들어야 하나? => HashMap
 --%>


<form method="POST">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="PW"></p>
	<p><input type="password" name="userpw2" placeholder="PW"></p>
	<p><input type="text" name="username" placeholder="Your Name"></p>
	<p><input type="text" name="email" placeholder="name@company.com"></p>
	<p>
	<label><input type="radio" name="gender" value="남성">남성</label>	
	<label><input type="radio" name="gender" value="여성">여성</label>	
	</p>
	<p>
		<button class="btn">회원 가입</button>
</form>



</main>
</body>
</html>