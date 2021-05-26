<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="replyMsg">${empty login ? '댓글은 로그인을 하셔야 이용할 수 있습니다' : '바른 말을 사용합시다' }</c:set>
<main>

<div class="vbox w1200">
	<div class="w1200 fs"><p><b>${dto.title }</b></p></div>
	<div class="w1200 hbox sb">
			<div>${dto.username } (${dto.ipaddr }) | <fmt:formatDate value="${dto.creationDate }" pattern="yyyy-MM-dd" /></div>
			<div>조회 ${dto.viewCount }</div>
	</div>
	
	<div class="w1200 h500 boda">
		<img src="${cpath }/uploadFolder/${dto.uploadFile}" height="300px">
		<pre>${dto.context }</pre>
	</div>
</div>

<div class="hbox sb w1200">
	<div>
		<a href="${cpath }/board.jsp?page=${param.page}"><button class="btn">목록</button></a>
	</div>
	<div>
		<c:if test="${login.idx == dto.writer }">
		<a href="${cpath }/update.jsp?idx=${dto.idx}"><button class="btn">수정</button></a>
		<button class="btn" id="deleteBtn">삭제</button>
		</c:if>
	</div>
</div>

<div class="w1200 vbox reply" id="replyBox">
	<div>
		<c:forEach var="reply" items="${replyList }">
		<div class="vbox replyBox">
			<div class="hbox sb">
				<div>
					<span class="username">${reply.username }</span>님 [${reply.credate }]
				</div>
				<div>
					<c:if test="${(reply.writer == login.idx or login.userid == 'admin') and reply.deleted == 0 }">
					<a href="${cpath }/deleteReply.jsp?idx=${reply.idx }&user=${login.userid}">삭제</a>
					</c:if>
				</div>
			</div>
			<div>
				<c:if test="${reply.deleted != 0 }">
					<pre><b style="color: grey">${reply.deleted == 2 ? '관리자' : '작성자' }에 의해 삭제된 게시물입니다</b></pre>
				</c:if>
				<c:if test="${reply.deleted == 0 }">
					<pre><b>${reply.context }</b></pre>
				</c:if>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<%-- insert 쿼리를 수행할 때 필요한 값이 어떤 것이 있는가 확인 --%>
	<form method="POST">
		<input type="hidden" name="boardNum" value="${dto.idx }">
		<input type="hidden" name="writer" value="${login.idx }">
		<div class="hbox fe">
			<div><textarea name="context" 
						   placeholder="${replyMsg }"
						   ${empty login ? 'readonly' : '' }></textarea></div>
			<div><input type="${empty login ? 'button' : 'submit' }" class="btn" value="댓글 작성"></div>
		</div>
	</form>
</div>
</main>
<c:if test="${pageContext.request.method == 'POST' }">
	
	<%--댓글 등록 요청을 받으면 --%>
	<c:set var="row" value="${replyDAO.insertReply(user) }" />
	<c:redirect url="?${pageContext.request.queryString }" />
</c:if>

<jsp:include page="boardList.jsp?page=${param.page }&idx=${dto.idx }" />

<script>
	const deleteBtn = document.getElementById('deleteBtn');
	deleteBtn.onclick = () => {
		const select = confirm('정말 게시글을 삭제하시겠습니까?');
		if(select) {
			location.replace('delete.jsp?idx=${dto.idx}');
		}
	};
</script>

</main>
<%@ include file="footer.jsp" %>