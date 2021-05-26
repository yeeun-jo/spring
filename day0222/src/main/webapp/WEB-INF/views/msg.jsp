<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	const msg = '${msg}';
	const page = '${page}';

	alert(msg);
	if(page == ''){
		history.go(-1);
	}
	else{
	location.replace('${cpath}' + page );
	}
</script>

</body>
</html>