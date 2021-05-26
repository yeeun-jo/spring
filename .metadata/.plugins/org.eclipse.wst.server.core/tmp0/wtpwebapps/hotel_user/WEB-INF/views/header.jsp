<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔JAVA</title>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<link rel="stylesheet" href="${cpath }/resources/css/header.css" >
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Train+One&display=swap" rel="stylesheet">
<!-- 구글 폰트 한글 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<style>
@font-face{
	font-family: 'Ubuntu', sans-serif, 'Noto Sans KR', sans-serif;
	unicode-range:U+0041-005A, U+0061-007A,
}
</style>
</head>
<body>
<!-- 헤더 파일 -->
<div class="nav">
	<div class="nav-inner">
		<div class="nav-content-wrapper" id="headerWidth">
			<div class="content-left">
				<div class="hotel-logo"><a href="${cpath }">JAVA</a></div>
			</div>
			<div class="content-right">
				<div>
					<img id="open_submenu" height="40px" src="${cpath }/resources/img/main-subMenu.png">
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal-login hidden">
	<div class="modal_content">
		<!--표시하고 싶은 내용-->
		<!-- 로그인 안 했을 때 -->
		<c:if test="${empty login }">
			<div class="login-modal-section">
				<div class="modal-box">
					<div class="text-login">Login</div>
					<div>
						<img id="close_submenu" height="24px"
							src="https://cdn.dailyhotel.com/ux/common-close-ic-gray@2x.png">
					</div>
				</div>
				<div class="text-modal">호텔자바에 회원가입하시고 다양한 혜택을 누리세요.</div>
				<div class="btn-wrapper">
					<div>
						<a href="${cpath }/login"><button class="modal-in-btn">로그인</button></a>
					</div>
					<div>
						<a href="${cpath }/join"><button class="modal-in-btn">회원가입</button></a>
					</div>
				</div>
			</div>
		</c:if>

	<!-- 로그인 했을 때 -->
		<c:if test="${not empty login }">
			<div class="login-modal-section">
				<div class="modal-box">
					<div class="text-login"><a href="${cpath }/myPage" style="color: black;">${login.cu_name } 님</a></div>
					<div>
						<img id="close_submenu" height="24px"
							src="https://cdn.dailyhotel.com/ux/common-close-ic-gray@2x.png">
					</div>
				</div>
				<div class="text-modal">자바호텔에 오신걸 환영합니다.</div>
				<div class="btn-wrapper">
					<div>
						<a href="${cpath }/modify"><button class="modal-in-btn">정보수정</button></a>
					</div>
					<div>
						<a href="${cpath }/logout"><button class="modal-in-btn">로그아웃</button></a>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	const open_submenu = document.getElementById('open_submenu');
	const close_submenu = document.getElementById('close_submenu');
	const modal = document.querySelector('.modal-login');
	
	open_submenu.onclick = function() {
		modal.classList.remove('hidden');
		$("html, body").addClass("not_scroll");
	}
	
	close_submenu.onclick = function() {
		modal.classList.add('hidden');
		$("html, body").removeClass("not_scroll");
	}
</script>

<!-- 주소에따라 헤더 넓이 조절 -->
<script type="text/javascript">
	var link = document.location.pathname;
	var mainAddress = '${cpath}/';
	var nav = document.getElementById('headerWidth');
	var modalLogin = document.querySelector('.modal-login');
	
	if(link != mainAddress){
		nav.style.width = "1000px";
		modalLogin.style.margin = "0 0 0 53%";
	} else {
		nav.style.width = "1590px";
		modalLogin.style.margin = "0 0 0 69%";
	}
	
	console.log('현재 주소 : ' + link);
	console.log('현재 주소 : ' + mainAddress);
</script>
