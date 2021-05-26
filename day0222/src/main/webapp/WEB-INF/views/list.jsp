<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>판매정보</h3>

<div>
	<table border="1">
		<tr>
			<th>결제시간</th><th>상품명</th><th>금액</th><th>판매수량</th><th>정상</th>
		</tr>
		<c:forEach var="list" items="${sellList }">
		<tr>
			<td>${list.selldate }</td>
			<td>${list.product }</td>
			<td>${list.total }</td>
			<td>${list.sellCount }</td>
			<td>${list.deleted }</td>
		</tr>	
		</c:forEach>
	</table>
</div>
	
	
	
</body>
</html>