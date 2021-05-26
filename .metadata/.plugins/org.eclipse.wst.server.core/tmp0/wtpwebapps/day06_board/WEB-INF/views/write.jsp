<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<div class="vbox w1200 write">
	<form method="POST">
		<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
		<input type="hidden" name="writer" placeholder="작성자를 입력하세요" value="${login.idx }">
		<div class="w1200 fs">
			<p><input type="text" name="title" placeholder="제목을 입력하세요" autofocus required></p>
			<p>${login.username } (${login.userid })</p>
			<div class="w1200 h500 boda">
				<textarea name="context" placeholder="내용을 작성하세요" required></textarea>
			</div>
			<p><input type="file" name="uploadFile"></p>
		</div>
		<div class="w1200 sb hbox">
			<div>
				<input type="button" value="돌아가기" class="btn" onclick="history.go(-1)">
			</div>
			<div>
				<input type="submit" value="작성" class="btn">
			</div>
		</div>
	</form>
	</div>
</main>

<%@ include file="footer.jsp" %>








