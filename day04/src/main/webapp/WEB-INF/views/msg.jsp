<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const msg = '${msg}';
	const url = '${page}';
	
	alert(msg);
	
	if(url == ''){
		history.go(-1);
	}
	else{
		location.replace('${cpath}' + url);	// get으로 새로 요청하면 스프링 컨트롤러가 처리한다
	}
</script>


</main>
</body>
</html>