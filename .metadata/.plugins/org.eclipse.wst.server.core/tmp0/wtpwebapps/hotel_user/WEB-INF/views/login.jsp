<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" >${pageContext.request.contextPath }</c:set>    
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelJAVA | 로그인</title>
<style>
        a{
            text-decoration: none;
            color: #f8585b;
        }
        
        .login{
            width: 500px;
            height: 40px;
            border: none;
            outline: none;
            border-bottom: 1px solid grey;
        	margin-top: 30px;
        }
        .login::placeholder {
        	text-align: center;
        	font-weight: bold;
        } 
        .loginBtn {
        	width: 500px;
            	height: 40px;
        	margin-top: 30px;
        	border-radius: 30px;
        	border: 1px solid grey;
        	background-color: #f8585b;
        	font-weight: bold;
		outline: none;
        }

        .find_info{
            font-size: 14px;
            line-height: 14px;
            padding-top: 18px;
            text-align: center;
            color: #8e8e8e;
        }
        .find_info > a{
           text-decoration: none;
            color: inherit;
        }
	input {
	text-align: center;
	}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div id="loginBackground" style="width: 768px; margin: auto; justify-content: center; align-items: center; text-align: center; margin-top: 100px;">
    <form id="loginForm" method="POST">
        <p><input class="login" id="userId" type="text" name="cu_id" value="${cookie.userid.value }" placeholder="아이디"></p>
        <p><input class="login" id="userPw" type="password" name="cu_pw" placeholder="비밀번호"></p>
        <div id="result"></div>
        <p><input class="loginBtn" type="submit" value="로그인"></p>
        <p><input type="checkbox" id="idSaveCheck" name="storeid" ${not empty cookie.userid ? 'checked' : '' } >Remember me </p>
    </form>
    

    <div class="find_info">
        <a href="${cpath }/findID">아이디 찾기</a>
        <span>|</span>
        <a href="${cpath }/findPW">비밀번호 찾기</a>
        <span>|</span>
        <a href="${cpath }/join">회원가입</a>
    </div>
</div>
	


</body>
</html>
