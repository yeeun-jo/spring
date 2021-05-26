<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<main>
<table id="boardList">
	<thead>
		<tr>
			<th class="idx">번호</th>
			<th class="title">제목</th>
			<th class="writer">작성자</th>
			<th class="viewCount">조회수</th>
			<th class="creationDate">작성날짜</th>
			<th class="ipaddr">IP Address</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${map.list }">
		<tr class="${param.idx == dto.idx ? 'current' : ''} ">
			<td class="idx">${dto.idx }</td>
			<td class="title">
				<a href="${cpath }/view/${dto.idx}">
				${dto.title }
				</a>
			</td>
			<td class="writer">${dto.username }</td>
			<td class="viewCount">${dto.viewCount }</td>
			<td class="creationDate">
				<fmt:formatDate value="${dto.creationDate }" pattern="yyyy-MM-dd" />
			</td>
			<td class="ipaddr">${dto.ipaddr }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="hbox paging">

	<c:if test="${map.paging.prev }">
		<a href="${cpath }/board/${map.paging.begin - 1}?type=${param.type}&word=${param.word}">◀</a>
	</c:if>
	
	<c:forEach begin="${map.paging.begin }" end="${map.paging.end }" var="i">
		<a href="${cpath }/board/${i}?type=${param.type}&word=${param.word}">
		${i == map.paging.page ? '<strong>' : '' }
			[${i }]
		${i == map.paging.page ? '</strong>' : '' }
		</a>
	</c:forEach>
	
	<c:if test="${map.paging.next }">
		<a href="${cpath }/board/${map.paging.end + 1}?type=${param.type}&word=${param.word}">▶</a>
	</c:if>
</div>

<div class="hbox sb w1200">
	<div>
		<form action="${cpath }/board/1">
			<select name="type">
				<option value="title" ${param.type == 'title' or empty param.type ? 'selected' : '' }>제목으로 검색</option>
				<option value="username" ${param.type == 'username' ? 'selected' : '' }>이름으로 검색</option>
				<option value="context" ${param.type == 'context' ? 'selected' : '' }>내용으로 검색</option>
			</select>
			<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off">
			<input class="btn" type="submit" value="검색">
		</form>
	</div>
	<div>
		<a href="${cpath }/write"><button class="btn">새 글 작성</button></a>
	</div>
</div>
</main>
