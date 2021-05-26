<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2>ex02 - 회원가입</h2>

<div>
	<form id="join" method="POST">
		<p><input type="text" name="userid" placeholder="ID" required></p>
		<p><input type="password" name="userpw" placeholder="PW" required></p>
		<p><input type="text" name="username" placeholder="name" required></p>
		<p><input type="text" name="email" placeholder="email" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성">남성</label>
			<label><input type="radio" name="gender" value="여성">여성</label>
		</p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</div>

<div id="result"></div>

<script type="text/javascript">

	const form = document.getElementById('join');
	const result = document.getElementById('result');
	// const form0 = document.forms[0];

	//	const form1 = document.forms[1];
	//	console.log(form1);

	console.log(form);
	// console.log(form0);
	
		const handler = function(event){		// submit도 하나의 이벤트이다
		event.preventDefault();					// 기본 submit 작동을 막아준다
		
		
		// 1. 사용자가 입력한 formData를 ajax를 전달할 수 있도록 javascript object로 변환
		const formData = new FormData(event.target);
		console.log("폼데이타 ~~ : ",formData);
		
		const ob = {};	// 객체를 만든다
		
		for (const [key, value] of formData.entries()) {
			console.log(key,value);
			ob[key] = value;
		}
		console.log("ob : " ,ob);
		
		// 2. formData에서 추출한 객체를 JSON 형식의 문자열로 반환하기
		const json = JSON.stringify(ob);
		console.log(json);
		
		// 3. fetch를 이용하여 ajax요청을 스프링에 전달하기
		const url = '${cpath }/member';		// get, post, put, delete 
		const opt = {
				method : 'POST',
				body : json,
				headers : {
					'Content-Type' : 'application/json'
				}
				
		};
		
		fetch(url, opt)
		.then(response => response.text())	// 인자로 callback함수를 전달받는다 
//		.then(text => console.log(text))
		.then(text => result.innerText = text)
		
		
		// const answer = confirm('submit ?? ');	// 사용자에게 submit할지 물어본다
		/* if(answer){								// submit 하면
			event.target.submit();				// 이벤트의 대상(버튼을 클릭하면서, form을 submit하는 이벤트가 발생)
		} */										// form이 event.target, submit은 event listener
	
	};
	
	form.onsubmit = handler;
	
</script>


</body>
</html>