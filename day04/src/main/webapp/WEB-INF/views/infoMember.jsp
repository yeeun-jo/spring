<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	
<h3>회원 정보 확인</h3>
<hr>

<div class="hbox">
	<div style="margin:0 20px 0 20px;">
		<ul style="list-style: none;">
			<li><a>ID</a></li>
			<li><a>PW</a></li>
			<li><a>NAME</a></li>
			<li><a>EMAIL</a></li>
			<li><a>GENDER</a></li>
		</ul>
	</div>
	<div>
		<ul style="list-style: none;">
			<li><a>${login.userid }</a></li>
			<li><a>**********</a></li>
			<li><a>${login.username }</a></li>
			<li><a>${login.email }</a></li>
			<li><a>${login.gender }</a></li>
		</ul>
	</div>
</div>
	
	<div class="hbox">
		<p><a href="${cpath }/modifyMember/">
			<button class="btn">정보 수정</button>
		</a></p>
	</div>






</main>
</body>
</html>