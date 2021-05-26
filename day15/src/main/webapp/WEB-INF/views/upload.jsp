<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header style="display: flex; justify-content: space-between; align-items: center;">
	<h1>파일 업로드 테스트</h1>
	<div><a href="${pageContext.request.contextPath }">PhoneBook으로 돌아가기</a></div>
</header>
<hr>

<div id="upload"></div>
	<form id="uploadForm">
		<p><input type="text" name="name" placeholder="사진 설명을 입력하세요"></p>
		<p><input type="file" name="file"></p>
		<p><input type="submit" value="전송"></p>
	</form>
<div id="list"></div>

<script>
	// fetch API로 파일을 업로드 할때에는 headers를 선언하지 말자(자동으로 붙어진다)
	const cpath = '${pageContext.request.contextPath}';
	const uploadForm = document.getElementById('uploadForm');
	const file = document.querySelector('input[type="file"]');
	const list = document.getElementById('list');
	
	const getFileList = function(){
		const url = cpath + '/imgList';
		const opt = {
				method : 'GET'
		}
		
	// 이미지파일업로드할때 fetch로 쓴다면 헤더 안써도됨
		fetch(url,opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json);
			json.forEach(ele => {
				const img = document.createElement('img');
				img.src = cpath + '/upload/' + ele;
				img.style.height = '200px';
				list.appendChild(img)
			})
		});
	}
	
	// 바로 ~~ 호출!
	getFileList();
	
	const uploadHandler = function(event) {
		event.preventDefault();
		const formData = new FormData(uploadForm);
		
		const url = cpath + '/upload';
		const opt = {
				method: 'POST',
				body: formData
		};

		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			console.log(text);
			const img = document.createElement('img');
			img.src = cpath + text;
			img.style.height = '200px';
			list.appendChild(img)
		});
	}

	uploadForm.onsubmit = uploadHandler;

</script>
</body>
</html>