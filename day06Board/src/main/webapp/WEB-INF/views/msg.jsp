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
		location.replace('${cpath}' + url);
	}
</script>


</main>
</body>
</html>