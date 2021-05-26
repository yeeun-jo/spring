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
	<form method="POST">
		<table>
			<tr>
				<th>상품명</th><th>가격</th><th>재고</th>
			</tr>
			<c:forEach var="goods" items="${basket }">
				<tr>
					<td><input type="text" name="product" value="${goods.product }"></td>
					<td><input type="number" name="total" value="${goods.price }"></td>
					<td><input type="number" name="sellCount" value="${goods.count }"></td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan="2">합계</td>
				<td>${total }원</td>
			</tr>
		</table>
		<input type="submit" value="결제"> 
	</form>	
		<a href="${cpath }/"><button>초기화</button></a>
		
	</div>
	
	
	
	
</body>
</html>