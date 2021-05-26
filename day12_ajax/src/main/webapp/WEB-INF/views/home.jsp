<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호부</title>
<link rel="stylesheet" href="${cpath }/resources/css/style.css">
<script src="${cpath }/resources/js/phonebook.js"></script>

<!-- 본문을 불러오기 전에 미리 필요한 자바스크립트 함수를 불러오고 시작함 -->
</head>
<body>
<h1><a href="${cpath }">ITBANK PhoneBook</a></h1>
<hr>

<!-- 추가하기 -->
<div id="insert" class="hidden">
	<form id="insertForm">
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="text" name="pnum" placeholder="전화번호"></p>
		<p>
			<input id="cancelInsert" type="button" value="취소">
			<input type="submit" value="저장">
		</p>
	</form>
</div>

<!-- img누르면 나타나는 메뉴 -->
<div id="contextMenu" class="hidden">
	<input type="hidden" name="idx">
	<ul>
		<li><a href="">수정</a>
		<li><a href="">삭제</a>
	</ul>
</div>

<!-- 수정 폼을 모달로 처리하기 -->
<div id="update" class="modal hidden">
	<div class="modal_overlay"></div>
	<div class="modal_content">
		<div class="modal_content">
			<h2>수정</h2>
			<form id="updateForm">
				<p><input type="text" name="name" placeholder="이름"></p>
				<p><input type="text" name="pnum" placeholder="전화번호"></p>
				<p>
					<input id="cancleUpdate" type="button" value="취소">
					<input type="submit" value="저장">
				</p>
			</form>
		</div>
	</div>

</div>

<div id="root">
	<div id="nav">
		<div></div>
		<div>
			<ul>
				<li><a id="insertBtn" class="btn">추가</a></li>
				<li><a href="">검색</a></li>
			</ul>
		</div>
	</div>
	<hr>
	<div id="pb-list"></div>
</div>



<script>
	// body에서 hide함수호출 
	// contextMenu 숨기기
	/* function hide(){
		document.getElementById('contextMenu').style.display = 'none';
	} */

	setCpath('${cpath}');
	
	// 여기서부터 ajax(목록 불러오기)
	ajaxSelectList();
	
	// insertBtn 기능 추가
	const insertBtn = document.getElementById('insertBtn');
	insertBtn.onclick = function(event) {
		document.getElementById('insert').classList.remove('hidden');
		document.querySelector('#insert > form input').focus();
	};
	
	// cancelInsert 기능 추가
	const cancelInsert = document.getElementById('cancelInsert');
	cancelInsert.onclick = function(event) {
		document.getElementById('insert').classList.add('hidden');
	}
	
	// 입력한 값을 서버에 전송
	const insertForm = document.getElementById('insertForm');
	insertForm.onsubmit = ajaxInsert;
	
	// contextMenu를 보조버튼이 아닌 곳을 클릭하면 사라지도록
	document.querySelector('body').onclick = function(event){
		if(event.target.className != 'hover-pointer'){
			document.querySelector('#contextMenu').classList.add('hidden');
		}
	}
	
	// 업데이트 취소 버튼 누르면 모달 닫기
	const cancelUpdate = document.getElementById('cancleUpdate');
	console.log(cancelUpdate);
	cancelUpdate.onclick = function(){
		document.getElementById('update').add('hidden');
	}
	
	// 오버레이를 클릭하면 모달 닫기
	document.querySelectorAll('.modal_overlay').forEach(function(element){
		element.onclick = function(){
			document.getElementById('update').add('hidden');
		}
	});
	
	// 모달의 updateForm을 submit하면 modifySubmit함수를실행하기
	document.getElementById('updateForm').onsubmit = modifySubmit;
	
</script>
</body>
</html>






