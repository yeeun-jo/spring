<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<c:if test="${pageContext.request.method == 'GET' }" >
		<div class="vbox w1200 h500">
			<h2>로그인</h2>
			<form method="POST">
				<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
				<p><input type="password" name="userpw" placeholder="Password" required></p>
				<div class="vbox">
					<p><input class="btn" type="submit" value="로그인"></p>
				</div>
			</form>
			<br>
			<a href="${cpath }/join.jsp">아직 회원이 아니십니까?</a>
		</div>
	</c:if>
	
<%-- 	<c:if test="${pageContext.request.method == 'POST' }" > --%>
<%-- 		<jsp:useBean id="login" class="member2.MemberDTO" /> --%>
<%-- 		<jsp:setProperty property="*" name="login" /> --%>
<%-- 		<c:set var="login" value="${memberDAO.selectOne(login) }" scope="session" /> --%>
		
		<script>
// 			const flag = '${sessionScope.login}';
// 			if(flag === '') {
// 				alert('로그인 실패 !!');
// 				history.go(-1);
// 			}
// 			else {
// 				location.replace('${cpath}/');
// 			}
		</script>
<%-- 	</c:if> --%>
	
</main>
<%@ include file="footer.jsp" %>
