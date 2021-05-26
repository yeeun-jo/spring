<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2>ex03 - 회원 전체목록</h2>

<table id="result" border ="1">
	<tr>
		<th>userid</th>
		<th>username</th>
	</tr>
</table>

<!-- <div id="result"></div> -->

<script type="text/javascript">

	const result = document.getElementById('result');
	
	const handler = function(event){
		const url = '${cpath}/member';
		const opt = {
				method: 'GET',
		}
		
		fetch(url,opt)
		.then(resp => resp.json())
		.then(json => {
			for(i in json){
				console.log(json[i]);
				const tr = document.createElement('tr');
				const td1 = document.createElement('td');
				const td2 = document.createElement('td');
				
				td1.innerText = json[i]['USERID'];
				td2.innerHTML = json[i]['USERNAME'];
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				
				result.appendChild(tr);
				
			}			
		});
	}
	
	handler();
	
</script>


</body>
</html>