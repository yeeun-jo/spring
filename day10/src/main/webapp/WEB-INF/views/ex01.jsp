<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2>ex01 - 계정 이름으로 검색</h2>

<div>
	<input id="userid" type="text" name="userid" placeholder="ID로 검색하세요">
</div>

<div>
	<button id="searchBtn">검색</button>
</div>

<div id="result"></div>

<table id="resultTable" border="1" cellpadding="10" cellspacing="0"
	style="display: none;">
	<thead>
		<tr>
			<th>idx</th><th>userid</th><th>userpw</th>
			<th>username</th><th>gender</th><th>email</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
	</tbody>
	
</table>


<script type="text/javascript">
	// 1) 이벤트처리에 필요한 요소를 불러오기
	const userid = document.getElementById('userid');
	const searchBtn = document.getElementById('searchBtn');
	//const result = document.getElementById('result');
	const thList = document.querySelectorAll('tbody th');
	
	
	// 2) 이벤트 함수를 정의하기
	const searchHandler = function(event){
		$.ajax({
			url : '${pageContext.request.contextPath}/member/' + userid.value,
			method : 'GET',
			dataType : 'text',
			success : function(data){	// data = jsonString
				console.log(data);
				if(data != ''){
					const ob = JSON.parse(data);	// string을 다시 객체(자바스크립트의 객체로)로 변환
					console.log(ob);				
					console.log(ob.userid);

					thList[0].innerText = ob.idx;
					thList[1].innerText = ob.userid;
					thList[2].innerText = ob.userpw;
					thList[3].innerText = ob.username;
					thList[4].innerText = ob.gender;
					thList[5].innerText = ob.email;
					$('#resultTable').css('display', 'table');
					$('#result').text('');
				}
				else{
					$('#result').text('검색 결과가 없습니다');
					$('#resultTable').css('display', 'none');
					$('#result').css('color', 'red');
				}
			},
			error : function(){
				$('#result').text('서버 통신 실패');
				$('#resultTable').css('display','none');
				$('#result').css('color','red');
			}
		});
	};
	
	// 3) 지정한 요소의 리스너에 핸들러를 전달하기
	searchBtn.onclick = searchHandler;
	
</script>

</body>
</html>