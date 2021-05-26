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
<header>
	<h1><a href="${cpath }">ITBANK PhoneBook</a></h1>
	<div><a href="${cpath }/upload">FileUpload Test</a></div>
</header>
<hr>

<div id="submenu" class="hidden">
	<input type="hidden" name="idx">
	<ul>
		<li><a href="">수정</a></li>
		<li><a href="">삭제</a></li>
	</ul>
</div>

<div id="update" class="model hidden">
	<div class="modal_overlay">
		<div class="modal_content">
			<form id="updateForm">
				<input type="hidden" name="idx">
				<p><input type="text" name="name" placeholder="이름"></p>
				<p><input type="text" name="pnum" placeholder="전화번호"></p>
				<p>
					<input id="cancelUpdate" type="button" value="취소">
					<input type="submit" value="저장">
				</p>	
			</form>
		</div>
	</div>
</div>

<div id="insert" class="hidden">
	<form id="insertForm" method="POST">
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="text" name="pnum" placeholder="전화번호"></p>
		<p>
			<input id="cancelInsert" type="button" value="취소">
			<input type="submit" value="저장">
		</p>
	</form>
</div>

<div id="search" class="hidden">
	<form id="searchForm">
		<input type="text" name="word" placeholder="이름 혹은 전화번호를 입력하세요">
		<input type="submit" value="검색">
		<input id="cancelSearch" type="button" value="취소">
	</form>
</div>

<div id="root">
	<div id="nav">
		<div></div>
		<div>
			<ul>
				<li><a id="insertBtn" class="btn">추가</a></li>
				<li><a id="searchBtn" class="btn">검색</a></li>
			</ul>
		</div>
	</div>
	<hr>
	<div id="pb-list"></div>
</div>



<script>

	setCpath('${cpath}');
	
	// 여기서부터 ajax
	ajaxSelectList();
	
	const insertBtn = document.getElementById('insertBtn');
	insertBtn.onclick = function(event) {
		document.getElementById('insert').classList.remove('hidden');
		document.querySelector('#insert > form input').focus();
	};
	
	const cancelInsert = document.getElementById('cancelInsert');
	cancelInsert.onclick = function(event) {
		document.getElementById('insert').classList.add('hidden');
	}
	
	// 검색 버튼 눌렀을 때 폼 보이게 하기
	const searchBtn = document.getElementById('searchBtn');
	searchBtn.onclick = function(event){
		document.getElementById('search').classList.remove('hidden');
	}
	
	// 검색 버튼 누르고 검색 폼에서 취소 눌렀을 때 
	const cancelSearch = document.getElementById('cancelSearch');
	cancelSearch.onclick = function(event) {
		document.getElementById('search').classList.add('hidden');
	}
	
	// insert
	const insertForm = document.getElementById('insertForm');
	insertForm.onsubmit = ajaxInsert;

	// search
	const searchForm = document.getElementById('searchForm');
	searchForm.onsubmit = ajaxSearch;
	
	
	// 보조메뉴 버튼이 아닌 다른 곳을 클릭하면 보조메뉴가 사라지도록
 	document.querySelector('body').onclick = function(event){
		if(event.target.className != 'hover-pointer'){
			document.querySelector('#submenu').classList.add('hidden');
		}
	}
	
	const cancleUpdate = document.getElementById('cancelUpdate');
	cancleUpdate.onclick = function(){
		document.getElementById('update').classList.add('hidden');
	}
	
	// 오버레이를 클릭하면 모달 닫기(숨기기)
/* 	document.querySelectorAll('.modal_overlay').forEach(function(ele){
		ele.onclick = function(){
			document.getElementById('update').classList.add('hidden');
		}
		
	}) */
	
	// update
	document.getElementById('updateForm').onsubmit = modifySubmit;
	
	
</script>
</body>
</html>






