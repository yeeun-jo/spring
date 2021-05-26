<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.top{
		border: 1px solid black;
		height: 500px;
		display: flex;
		width: 100%;
	}
	#btn{
		padding: 50px;
		margin: 20px;
		font-size: 15pt;
	}
	.top_right{
		/* border: 1px solid red; */
		width: 300px;
		height: 450px;
		margin-right: 10px;
	}
	.bottom{
		display: flex;
		margin-top: 40px;
	}
	.bottom_left{
		width: 500px;
		height: 500px;
		margin-right: 20px;
	}
	.bottom_right{
		border: 1px solid black;
		width: 400px;
		height: 500px;
	}
	table, th, td {
    	border: 1px solid #bcbcbc;
  	}
  	table {
   		width: 100%;
  	}

</style>
</head>
<body>


<div class="top">
	<div class="top_left">
	<c:forEach var="menu" items="${list }">
		<a href="${cpath }/select/${menu.idx} ">
			<button id="btn" type="button">
				${menu.product }
				<br>${menu.price }원
		<p><a href="${cpath }/update/${menu.idx}">상품입고</a></p>
			</button>
		</a>
	</c:forEach>
	</div>
	
		<div class="top_right">
		<form method="POST">
			<table>
				<tr>
					<th>상품명</th><th>가격</th><th>수량</th>
				</tr>
				
				<c:forEach var="goods" items="${basket }">
					<tr>
						<td><input type="hidden" name="idx" value="${goods.idx }"></td>
						<td><input type="text" name="product" value="${goods.product }"></td>
						<td><input type="number" name="total" value="${goods.price }"></td>
						<td><input type="number" name="sellCount" value="${goods.count }"></td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" value="판매">
			<p><a href="${cpath }/init"><button type="button">초기화</button></a></p>
		</form>
		</div>
</div>

<div class="bottom">
	<div class="bottom_left">
		<p>판매정보</p>
		<table>
			<tr>
				<th>결제시간</th><th>상품명</th><th>단가</th><th>판매수량</th>
			</tr>
			<c:forEach var="list" items="${sellList }">
				<tr>
					<td>${list.selldate }</td>
					<td>${list.product }</td>
					<td>${list.total }</td>
					<td>${list.sellCount }</td>
				</tr>	
			</c:forEach>
		
		</table>
	</div>
	<div class="bottom_right">
		<p>상품정보</p>
		<table>
			<tr>
				<th>상품명</th><th>단가</th><th>재고</th>
			</tr>
			
			<c:forEach var="menu" items="${list }">
			<tr>
				<td>${menu.product }</td>
				<td>${menu.price }</td>
				<td>${menu.count }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>



</body>
</html>