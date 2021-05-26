<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

<div class="vbox w1200">
	<div class="w1200 fs"><p><b>${dto.title }</b></p></div>
	<div class="w1200 hbox sb">
			<div>${dto.username } (${dto.ipaddr }) | ${dto.creationDate }</div>
			<div>조회 ${dto.viewCount }</div>
	</div>
	
	<div class="w1200 h500 boda">
		<img src="${cpath }/uploadFolder/${dto.uploadFile}" height="300px">
		<pre>${dto.context }</pre>
	</div>
</div>

<div class="hbox sb w1200">
	<div>
		<a href="${cpath }/board/"><button class="btn">목록</button></a>
	</div>
	<div>
		<c:if test="${login.idx == dto.writer }">
		<a href="${cpath }/update.jsp?idx=${dto.idx}"><button class="btn">수정</button></a>
		<button class="btn" id="deleteBtn">삭제</button>
		</c:if>
	</div>
</div>

</main>
	
</main>
<%@ include file="footer.jsp" %>