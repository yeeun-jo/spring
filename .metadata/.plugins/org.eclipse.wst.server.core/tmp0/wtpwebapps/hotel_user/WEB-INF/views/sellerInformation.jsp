<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        div {
            width: 768px;
            height: 500px;
            margin: auto;
        }
        .back {
            display: flex;
            border-bottom: 1px solid black;
            height: 43px;
        }
        .back > a > img {
            width: 20px;
            height: 20px;
            padding-top: 11px;
            padding-bottom: 11px;
           
        }
       
        .back > h1 {
            font-size: 16px;
            color: #4D4D4D;
            width: 576px;
            text-align: center;
            padding-top: 11px;
            padding-bottom: 11px;
            padding-right: 96px;
            padding-left: 96px;
        }
        #hotel-owner {
            margin: 20px;
            font-size: 14px;
        }
        #hotel-owner > strong,p {
            margin: 20px;
        }
        
    </style>
</head>
<body>
<div>
    <div class="back">
        <a href="${cpath }/hotelView/${dto.ho_name}/"><img src="${cpath }/resources/img/arrow.jpg"></a>
        <h1>판매자 정보</h1>
    </div>

    <div id="hotel-owner">
    <strong>호텔명</strong>
    <p>${dto.ho_name }</p>

    <strong>관리자</strong>
    <p>${dto.ad_name }</p>

    <strong>호텔 주소</strong>
    <p>${dto.ho_address }</p>

    <strong>전화번호</strong>
    <p>${dto.ho_pnum }</p>

    <strong>이메일</strong>
    <p>${dto.ad_email }</p>
    </div>

</div>

</body>
</html>
