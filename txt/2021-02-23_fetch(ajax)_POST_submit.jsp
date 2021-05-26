<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>보람아 그냥 request로 하지 그랬어</h1>
<hr>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>

<form id="testForm" method="POST">
	<p>
		<input type="text" name="name" value="딸기라떼">
		<input type="number" name="price" value="10000">
		<input type="number" name="quantity" value="2">
	</p>
	<p>
		<input type="text" name="name" value="헛개수컨디션">
		<input type="number" name="price" value="3000">
		<input type="number" name="quantity" value="3">
	</p>
	<p>
		<input type="text" name="name" value="코카콜라">
		<input type="number" name="price" value="2000">
		<input type="number" name="quantity" value="1">
	</p>
	<input type="submit" id="btn" value="전송">
</form>

<script>
	const form = document.getElementById('testForm');
	
	const handler = function(event) {
		event.preventDefault();

		const formData = new FormData(form);
	    const arr = [];
	    let i = 0;
       	let ob = {};
       	
	    for ([key, value] of formData.entries()) {
	        if(i % 3 == 0)	ob = new Object();
	        ob[key] = value;
	        if(i % 3 == 0)	arr.push(ob);
	        i++;
	    }
	    console.log(arr);
	    
	    const url = '${cpath}/test2';
	    const opt = {							// 옵션
			method: 'POST',							// 메서드 POST
			body: JSON.stringify(arr),				// ob를 json형식으로 변환하여 전달
			headers: {								// 요청 헤더에
				'Content-Type': 'application/json'	// 내가 보내는것은 json이다 라고 명시
			}
		};
	 	fetch(url, opt)
	 	.then(resp => resp.text())
	 	.then(text => console.log(text));
	}
	
	form.onsubmit = handler;
	
</script>

</body>
</html>