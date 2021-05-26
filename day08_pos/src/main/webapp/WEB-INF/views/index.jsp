<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08 POS</title>
<style type="text/css">
	button{
		padding: 100px;
		margin: 20px;
		font-size: 20pt;
	}
	.left{
		float:left; width:60%;
	}
	.right{
		display:inline-block; width:30%; margin-left:10px;
	}
	ul{
		list-style: none;
	}
</style>
</head>
<body>
<h1>
	<a href="${cpath }">POS</a>     
	${login.username}
</h1>

<nav>
	<ul style="list-style: none;">
		<li><a href="${cpath }/add">상품입고</a></li>
		<li><a href="">판매</a></li>
		<li><a href="">매출집계</a></li>
	</ul>
</nav>
<hr>

<div>
	<div class="left">
	<c:forEach var="menu" items="${list }">
			<button id="btn" type="button" onclick="plus(this.value);" value="${menu.product }">
				${menu.product } (${menu.count }개)
				<br>${menu.price }원
			</button>
	</c:forEach>
	</div>
	
	<div class="right">
		<ul id="inner">
			<li>메뉴</li>
		</ul>
	</div>

</div>
<script type="text/javascript">

	function plus(clicked_menu) {
		var plusLI = document.createElement("li");
		let text = document.createTextNode(clicked_menu);
		plusLI.appendChild(text);
		document.getElementById("inner").appendChild(plusLI); 
	}
		
</script>



</body>
</html>