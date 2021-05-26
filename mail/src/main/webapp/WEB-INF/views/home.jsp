<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 메일 예제</title>
<style type="text/css">
	fieldset{
		width: 500px;
		display: flex;
		flex-flow: column;
		justify-content: center;
	}
	legend{
		font-size: 16pt;
		font-weight: bold;
	}
	.hidden{
		display: none;
	}
</style>
</head>
<body>

<h1>인증 메일 예제</h1>
<hr>
<%-- <h3>인증 번호 : ${authNumber }</h3> --%>

<form id="sendMailForm">
	<fieldset>
		<legend>이메일 주소 입력</legend>
		<p>
			<input type="email" name="email" placeholder="이메일을 입력하세요">
			<input type="submit" value="인증번호 전송">
		</p>
		<div id="sendMailMsg"></div>
	</fieldset>
</form>

<p></p>

<form id="authMailForm" class="hidden">
	<fieldset>
		<legend>인증번호 입력</legend>
		<p>
			<input type="text" id="auth" name="auth" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증">
		</p>
		<div id="authMailMsg"></div>
	</fieldset>
</form>

<script type="text/javascript">
	const cpath = '${cpath}';

	// 인증번호 메일로 발송
	const sendMailForm = document.getElementById('sendMailForm');
	const sendMailMsg = document.getElementById('sendMailMsg');
	
	const sendMailHandler = function(event){
		event.preventDefault();
		const email = event.target.querySelector('input[type="email"]');
		
		const url = cpath + '/mailto/' + email.value +'/';
		const opt = {
				mehtod : 'GET',
		}
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			console.log(text.length == 128);
			if(text.length == 128){
				authMailForm.classList.remove('hidden');
				sendMailMsg.innerText = '입력한 이메일로 인증 번호를 전송하였습니다';
				sendMailMsg.style.color = 'blue';
				sendMailMsg.style.fontWeight = 'bold';
			}
			else{
				sendMailMsg.innerText = '이메일을 확인하지 못했습니다';
				sendMailMsg.style.color = 'red';
				sendMailMsg.style.fontWeight = 'bold';
			}
		});
	}
	sendMailForm.onsubmit = sendMailHandler;
	
	// 인증번호 검증
	const authMailForm = document.getElementById('authMailForm');
	const authMailMsg = document.getElementById('authMailMsg');
	let authResult;	// 인증 이후 다른 작업을 하기 위한 준비 ~~!
	
	const authHandler = function(event){
		// form이 submit되면 ajax로 서버가 보낸 인증번호와 사용자가 입력한 인증번호가 일치하는지 체크하는 함수를 만들자
		event.preventDefault();
		const userNumber = document.getElementById('auth').value;
		
		const url = cpath + '/getAuthResult/' + userNumber;
		const opt = {
				method : 'GET',
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			console.log(text);
			authMailMsg.innerText = '';
			if(text == 'true'){
				authMailMsg.innerText = '인증 성공';
				authMailMsg.style.color = 'blue';
				authMailMsg.style.fontWeight = 'bold';
				authResult = true;
			}
			else{
				authMailMsg.innerText = '인증 실패';
				authMailMsg.style.color = 'red';
				authMailMsg.style.fontWeight = 'bold';
				authResult = false;
			}
		});
	}
	authMailForm.onsubmit = authHandler;
	


</script>




</body>
</html>