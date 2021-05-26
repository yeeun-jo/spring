<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:include page="boardList.jsp?page=${param.page }&type=${param.type }&word=${param.word }" />
<%@ include file="footer.jsp" %>