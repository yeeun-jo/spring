let cpath;

const setCpath = function(param) {
	cpath = param;
}

// 전체 목록 불러와서 테이블로 반환하는 함수
const convertJsonToTable = function(json) {
		const table = document.createElement('table');
		const thead = document.createElement('thead');
		const tbody = document.createElement('tbody');
		const theadTr = document.createElement('tr');
		const theadTh1 = document.createElement('th');
		const theadTh2 = document.createElement('th');
		
		theadTh1.innerText = '이름';
		theadTh2.innerText = '전화번호';
		
		theadTr.appendChild(theadTh1);
		theadTr.appendChild(theadTh2);
		
		thead.appendChild(theadTr);
		
		table.appendChild(thead);		
		
		// 여기서부터는 json을 규칙에 맞게 tr로 만들어서, 만들어진 tr을 tbody에 추가하고
		// tbody를 table에 추가하면 됨
		console.log('josn :' , json);

		for(let i = 0; i < json.length; i++) {
			const td1 = document.createElement('td');
			td1.innerText = json[i].name;
			
			const td2 = document.createElement('td');
			td2.innerText = json[i].pnum;
			
			const td3 = document.createElement('td');
			const img = document.createElement('img');
			img.src = cpath + '/resources/img/more.svg';
			img.classList.add('hover-pointer');
			
			// 수정, 삭제 버튼 클릭할 때를 위해 idx추가해두기
			img.id = 'context-'+ json[i].idx;
			
			td3.appendChild(img);
			
			const tr = document.createElement('tr')
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tbody.appendChild(tr);
		}

		table.appendChild(tbody);
		return table;
	}

// 수정 이벤트 (수정 버튼을 누르면 모달창 띄우기)
const updateHandler = function(event){
	event.preventDefault();
	const idx = event.target.parentNode.parentNode.previousElementSibling.value;
	const selectedImg = document.getElementById('context-'+idx);
	const seletedTds = selectedImg.parentNode.parentNode.querySelectorAll('td');
	const data1 = seletedTds[0].innerText;	// td의 0번째 이름을 가져옴
	const data2 = seletedTds[1].innerText;	// td의 1번째 전화번호를 가져옴

	const updateModal = document.getElementById('update');
	updateModal.classList.remove('hidden');
}

// 수정 submit
const modifySubmit = function(event){
	event.preventDefault();
}
// 삭제 이벤트
const deleteHandler = function(event){
	event.preventDefault();

	const idx = event.target.parentNode.parentNode.previousElementSibling.value;
	const selectedImg = document.getElementById('context-'+idx);
	console.log(selectedImg);
	const seletedTds = selectedImg.parentNode.parentNode.querySelectorAll('td');
	const data1 = seletedTds[0].innerText;	// td의 0번째 이름을 가져옴
	const data2 = seletedTds[1].innerText;	// td의 1번째 전화번호를 가져옴
	
	const answer = confirm(data1 +'('+data2 +') 님을 정말 삭제하시겠습니까?');
	if(answer) {
		const url = cpath + '/phonebook/' + idx;
		const opt = {
				method : 'DELETE',
		};
		fetch(url,opt)
		.then(resp => resp.text())
		.then(row =>{
			if(row == 1){
				// pbList불러와서 테이블 삭제하고 새로 불러오기
				const pbList = document.getElementById('pb-list');
				pbList.removeChild(pbList.childNodes[0]);
				ajaxSelectList();
			}
		})
	}
}
// 이미지 좌클릭시 contextMenu가 나타나는 이벤트 ~~ !! 
const imgClick = function(event)  {
	event.preventDefault();
	
	const idx = event.target.id.split('-')[1];
	const contextMenu = document.getElementById('contextMenu');
	
	contextMenu.querySelector('input').value = idx;
	
	// a태그 중 0 번째클릭하면 수정 이벤트 , 1번째 클릭하면 삭제이벤트 실행하기 
	contextMenu.querySelectorAll('a')[0].onclick = updateHandler;
	contextMenu.querySelectorAll('a')[1].onclick = deleteHandler;
	
	contextMenu.style.position = 'absolute';
	contextMenu.style.top = event.layerY +'px';
	contextMenu.style.left = event.layerX +'px';
	contextMenu.classList.remove('hidden');
}


// 전체 목록을 ajax로 요청하는 함수
const ajaxSelectList = function() {
	const url = cpath + '/phonebook';
	const opt = {
		method: 'GET',
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const pbList = document.getElementById('pb-list');
		pbList.appendChild(convertJsonToTable(json, cpath));
		
		// 테이블을 다 불러온 후에 이미지 좌클릭시 contextMenu가 나타나는 이벤트를 실행한다
		document.querySelectorAll('.hover-pointer').forEach(img => img.onclick = imgClick);
	});
}

// 객체 하나를 추가하는 함수
const ajaxInsert = function(event) {
	event.preventDefault();	// 이벤트(submit)의 기본작동을 막는다
	
	const insertForm = document.getElementById('insertForm');	// form 을 불러와서
	
	const formData = new FormData(insertForm);	// formData 생성하고
	const ob = {};
	for (const [key, value] of formData.entries()) {	// 객체에 추가하고
		ob[key] = value;	
	}	
	
	const url = cpath + '/phonebook';	// GET과 같은 주소
	const opt = {
		method: 'POST',				// POST
		body: JSON.stringify(ob),	// 객체를 json으로 변환해서 전송
		headers: {
			'Content-Type' : 'application/json'		// 보내는 내용이 json이니까 contentType을 명시하기
		}
	}
	
	fetch(url, opt)
	.then(response => response.text())
	.then(row => {
		if(row == 1) {
			//document.getElementById('pb-list').removeChild(document.getElementById('pb-list').childNodes[0]);
			document.getElementById('pb-list').innerHTML = '';
			ajaxSelectList();
			document.getElementById('insert').classList.add('hidden');
			document.getElementById('insertForm').reset();
		}
		else {
			alert('추가 실패 !!');
		}
	})
	
	
}


