<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body, section {
		width: 75%;
		margin: auto;
		padding: 20px;
	}
	
	h1 {
		display: inline-block;
		float: left;
	}
	
	ul {
		display: inline-block;
		float: right;
	}
	
	hr {
		clear: both;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	li {
		display: inline-block;
		width: 140px;
		cursor: pointer;
		border: 1px solid blue;
		padding: 10px;
		font-size: 12pt;
		font-weight: bolder;
	}
	
	input[type="text"], input[type="password"] {
		font-size: 12pt;
		padding: 10px;
		width: 200px;
	}
	
	input[type="button"] {
		font-size: 12pt;
		padding: 10px;
		width: 224px;
		font-weight: bolder;
		background-color: white;
		border: 1px solid blue;
		cursor: pointer;
	}
	
	input[type="button"]:hover {
		background-color: burlywood;
	}
	
	input[type="button"]:active {
		background-color: chocolate;
		color: white;
	}
	
	fieldset {
		text-align: center;
	}
	
	table {
		border-collapse: collapse;
		border: 1px solid black;
	}
	
	th {
		border: 1px solid black;
		padding: 20px;
	}
	
	td {
		border: 1px solid black;
		padding: 10px;
	}
	
	li:hover {
		background-color: chocolate;
		color: white;
	}
	
	article.hidden {
		display: none;
	}
</style>

</head>
<body>

	<h1>
		<a href="">ITBANK PhoneBook</a>
	</h1>
	<ul id="menuList">
		<li id="insert">신규등록 <br>(POST, insert)
		</li>
		<li id="search">검색하기 <br>(GET, select)
		</li>
		<li id="update">수정하기 <br>(PUT, update)
		</li>
		<li id="delete">삭제하기 <br>(DELETE, delete)
		</li>
	</ul>
	<hr>
	<section id="section">

		<article id="insertArticle" class="hidden">
			<form id="insertForm" name="POST" method="POST">
				<h2>신규등록</h2>
				<fieldset>
					<input class="inputField" type="text" name="name" placeholder="이름을 입력하세요" autofocus> 
					<input class="inputField" type="text" name="userid" placeholder="ID를 입력하세요" > 
					<input class="inputField" type="password" name="userpw" placeholder="비밀번호를 입력하세요" > 
					<input class="inputField" type="text" name="pnum" placeholder="전화번호를 입력하세요"> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="남성">남성
					</label> 
					<label> 
						<input class="inputField" type="radio" name="gender" value="여성">여성
					</label> 
					<input type="button" id="member-post" value="가입 신청">
				</fieldset>
			</form>
		</article>

		<article id="searchArticle" class="hidden">
			<form id="searchForm" name="GET">
				<h2>검색하기</h2>
				<fieldset>
					<p>
						<input class="inputField" type="text" name="userid"
							placeholder="계정을 입력하세요" autofocus>
					</p>
					<p>
						<input class="inputField" type="password" name="userpw"
							placeholder="비밀번호를 입력하세요">
					</p>
					<p>
						<input type="button" id="member-get" value="로그인">
					</p>
				</fieldset>
			</form>
		</article>

		<article id="updateArticle" class="hidden">
			<form id="updateForm" name="PUT">
				<h2>수정하기</h2>
				<fieldset>
					<p>
						<input class="inputField" type="text" name="userid"
							placeholder="계정을 입력하세요">
					</p>
					<p>
						<input class="inputField" type="password" name="userpw"
							placeholder="현재 비밀번호를 입력하세요">
					</p>
					<p>
						<input class="inputField" type="password" name="newpw"
							placeholder="새로운 비밀번호를 입력하세요">
					</p>
					<p>
						<input class="inputField" type="password" name="newpw2"
							placeholder="새로운 비밀번호를 확인해주세요">
					</p>
					<p>
						<input class="inputField" type="text" name="username"
							placeholder="변경할 이름을 입력하세요">
					</p>
					<p>
						<input type="button" id="member-put" value="정보 수정">
					</p>
				</fieldset>
			</form>
		</article>

		<article id="deleteArticle" class="hidden">
			<form id="deleteForm" name="DELETE">
				<h2>삭제하기</h2>
				<fieldset>
					<p>
						<input class="inputField" type="text" name="userid"
							placeholder="ID" autofocus>
					</p>
					<p>
						<input class="inputField" type="password" name="userpw"
							placeholder="Password">
					</p>
					<p>
						<input type="button" id="member-delete" value="탈퇴">
					</p>
				</fieldset>
			</form>
		</article>

	</section>
	<script type="text/javascript">
    const lis = document.querySelectorAll('#menuList > li');
    const ars = document.querySelectorAll('section article');

    console.log(ars);

    const handler = (event) => {
        console.log('당신이 클릭한 메뉴는 ' , event.target.id);
        const ar = document.getElementById(event.target.id + 'Article');
        ars.forEach(ar => ar.classList.add('hidden'));
        ar.classList.remove('hidden');
    }
    lis.forEach(li => li.onclick = handler);
    
    console.log(lis);

    // 회원가입
    const member_postBtn = document.getElementById('member-post');
    const insertForm = document.getElementById('insertForm');

	const insertHandler = function(event){
		event.preventDefault();
		const answer = confirm('회원가입 하시겠습니까?');	// 사용자에게 submit할지 물어본다
		if(answer){								// submit 하면
			event.target;				// 이벤트의 대상(버튼을 클릭하면서, form을 submit하는 이벤트가 발생)
		
		
		console.log("내가 누른 버튼 : ", event.target.id);
		
		// 1. 사용자가 입력한 데이터를 ajax에 객체로 전달하기
		const insertFormData = new FormData(insertForm);
		const ob = {};
		
		for(const [key,value] of insertFormData.entries()){
			console.log(key,value);
			ob[key] = value;
		}

		// 2. formData에서 추출한 객체를 json형식의 문자열로 반환하기
		const json = JSON.stringify(ob);

		// 3. fetch를 이용하여 ajax요청을 스프링에 전달하기
		const url = '${cpath }/pnum';
		const opt = {
				method : 'POST',
				body : json,
				headers : {
					'Content-Type' : 'application/json'
				}
		};
		
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => alert(text))
	}
	} 
	member_postBtn.onclick = insertHandler;
	
	// 회원 조회
	const searchForm = document.getElementById('searchForm');
	const inputField = document.querySelectorAll('inputField');
	const member_get = document.getElementById('member-get');
	
	console.log("form : " , searchForm);
	console.log("inputfield : " ,inputField);
	console.log("버튼 : ", member_get);
	
	
	
	
	
</script>
</body>
</html>
