<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<main>
	<div class="vbox w1200 h500">
		<h2>회원가입</h2>
		<form method="POST">
			<p>
				<input id="userid" type="text" name="userid" placeholder="ID" autofocus>
				<span id="msg"></span>
			</p>
			<p><input type="password" name="userpw" placeholder="Password" required></p>
			<p><input type="password" name="confirmPassword" placeholder="Password" required></p>
			<p><input type="text" name="username" placeholder="사용자 이름" required></p>
			<p><input type="text" name="email" placeholder="E-Mail" required></p>
			<div class="hbox">
				<label><input type="radio" name="gender" value="남성" required>남성</label>
				<label><input type="radio" name="gender" value="여성" required>여성</label>
			</div>
			<br>
			<div class="vbox">
				<input class="btn" type="submit" value="회원가입">
			</div>
		</form>
	</div>
	
	<!-- 이미 사용중인 id인지 확인 (ajax) -->
	<script>
		$('#userid').blur(function(){
			if($('#userid').val() == ''){
				$('#msg').text('아이디를 입력하세요');
				$('#msg').css('color', 'red');
				$('#userid').focus();
				return;
			}
			else{
				$('#msg').text('');
				$.ajax({
					url : '${pageContext.request.contextPath}/checkId',
					method : 'POST',
					data : {userid : $('#userid').val()},
					dataType : 'text',
					success : function(returnValue){
						$('#msg').text(returnValue);
						if(returnValue === '사용가능한 ID입니다'){
							$('#msg').css('color','blue');
						}
						else{
							$('#msg').css('color','red');
							$('#userid').select();
						}
					},
					error : function(){
						$('#msg').text('서버통신실패');
					}
				});
			}
		});
	</script>
	
	
	<!-- 스크립트로 비번 일치하는지 확인 -->
	<script>
		const joinForm = document.forms[0];
		const submitHandler = function(event){
			event.preventDefault();
			const pw1 = document.querySelector('input[name="userpw"]').value;
			const pw2 = document.querySelector('input[name="confirmPassword"]').value;
			
			if(pw1 != pw2){
				alert('비밀번호가 일치하지 않습니다');
				document.querySelector('input[name="userpw"]').value = '';
				document.querySelector('input[name="confirmPassword"]').value='';
				document.querySelector('input[name="userpw"]').focus();
				return;
			}
			joinForm.submit();
		};
		joinForm.onsubmit = submitHandler;
		
	</script>
</main>
<%@ include file="footer.jsp" %>












