let cpath;

const setCpath = function(param){
	cpath = param;
}


// 전화번호부 전체 목록을 테이블로 반환
const appendTable = function(json,cpath){
	//console.log('josn :' , json);
	
	const table = document.createElement('table');
	const thead = document.createElement('thead');
	const tbody = document.createElement('tbody');
	const tr = document.createElement('tr');
	const th1 = document.createElement('th');
	const th2 = document.createElement('th');
	
	th1.innerText = '이름';
	th2.innerText = '전화번호';
	
	tr.appendChild(th1);
	tr.appendChild(th2);
	
	thead.appendChild(tr);
	table.appendChild(thead);

	for(let i = 0; i < json.length; i++){
		// console.log(json[i].name);
		const td1 = document.createElement('td');
		td1.className = "nameList";
		td1.innerText = json[i].name;

		const td2 = document.createElement('td');
		td2.className = "pnumList";
		td2.innerText = json[i].pnum;

		const td3 = document.createElement('td');
		const img = document.createElement('img');
		img.src = cpath + '/resources/img/more.svg';
		img.classList.add('hover-pointer');
		td3.appendChild(img);
		
		const tbodyTr = document.createElement('tr');
		tbodyTr.className = "ListTr";
		
		tbodyTr.appendChild(td1);
		tbodyTr.appendChild(td2);
		tbody.appendChild(tbodyTr);
	}

	table.appendChild(tbody);
	return table;
}

// 전체목록을 ajax로 요청
const ajaxSelectList = function(){
	const url = cpath + '/phonebook';
	const opt = {
			method : 'GET',
	}
	fetch (url,opt)
	.then(resp => resp.json())
	.then(json => {
		// console.log(json);
		const pbList = document.getElementById('pbList'); 
		pbList.appendChild(appendTable(json, cpath));
	})
}

// 검색창에 입력시 포함되는 단어만 출력
function filter(){
	let searchInput = document.getElementById('searchInput').value.toUpperCase();
	let ListTr = document.getElementsByClassName('ListTr');
	for(let i = 0; i<ListTr.length; i ++){
		let nameList = ListTr[i].getElementsByClassName('nameList');
		let pnumList = ListTr[i].getElementsByClassName('pnumList');
		
		if(nameList[0].innerHTML.toUpperCase().includes(searchInput) ||
			pnumList[0].innerHTML.toUpperCase().includes(searchInput)){
			ListTr[i].style.display = "flex";
		}
		else{
			ListTr[i].style.display = "none";
		}
	}
}


// insert

const ajaxInsert = function(event){
	event.preventDefault();
	
	const insertForm = document.getElementById('insertForm');
	const formData = new FormData(insertForm);
	const ob = {};
	for ( const [key, value] of formData.entries()){
		ob[key] = value;
	}
	
	const url = cpath + '/phonebook';
	const opt = {
			method : 'POST',
			body : JSON.stringify(ob),
			headers : {
				'Content-Type' : 'application/json'
			}
	}
	

	fetch(url,opt)
	.then(resp => resp.text())
	.then(row => {
		if(row == 1){
			documemt.getElement('pbList').innerHTML = '';
			ajaxSelectList();
			document.getElementById('insertForm').reset();
		}
		else{
			alert('추가 실패');
		}
	})
	
}