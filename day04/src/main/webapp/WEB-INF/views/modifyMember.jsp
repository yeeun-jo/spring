<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h2>정보수정</h2>
<%--
	파라미터를 받아서, userpw와 userpw2가 다르다면, 굳이 DAO를 호출할 필요가 있는가?
	DTO와 다른 형식으로 입력을 받는데, 이거 때문에 굳이 클래스를 하나 더 만들어야 하나? => HashMap
 --%>


<form method="POST">
	<input type="hidden" name="userid" value="${login.userid }">
	<input type="hidden" name="idx"	 value="${login.idx }">
	
	<div class="hbox">
		<div style="margin: 0 20px 0 20px;">
			<ul style="list-style: none">
				<li style="height: 31px"><p>ID</p></li>
				<li style="height: 31px"><p>Current-Password</p></li>
				<li style="height: 31px"><p>New-Password</p></li>
				<li style="height: 31px"><p>New-Password Check</p></li>
				<li style="height: 31px"><p>Name</p></li>
				<li style="height: 31px"><p>Email</p></li>
				<li style="height: 31px"><p>Gender</p></li>
			</ul>
		</div>
		<div>
			<ul style="list-style: none">
				<li><p>${login.userid }</p></li>
				<li><p><input type="password" name="userpw"></p></li>
				<li><p><input type="password" name="userpw2"></p></li>
				<li><p><input type="password" name="userpw3"></p></li>
				<li><p><input type="text" name="username" value="${login.username }"></p></li>
				<li><p><input type="text" name="email" value=${login.email }></p></li>
				<li><p>${login.gender }</p></li>
			</ul>
		</div>
	</div>
	<div class="hbox">
			<p>
				<a href="${cpath }/modifyMember/">
					<button class="btn">수정완료</button>
				</a>	
			</p>
		</div>
</form>



</main>
</body>
</html>