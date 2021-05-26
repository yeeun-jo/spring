<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.DATE, 5);
	String today = sf.format(cal.getTime()); 
%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>호텔JAVA</title>
</head>
<link rel="stylesheet" href="${cpath }/resources/css/rooms.css">
<body>
	<div class="root">
        <div class="inner-section">
            <div style="position: relative;">
                  <img class="room-img" style="height: 600px; margin-top: 10px;" src="http://182.212.181.172:9000/${map.roomList.ro_uploadfile }">
            </div>
        </div>
        <div class="inner-section">
            <div class="blank"></div>
        </div>
        <div class="inner-section">
            <div style="text-align: center; align-items: center; justify-content: center; flex-direction: column;">
                <div style="font-weight: bold; font-size: 15pt; color: #4b4b4b; margin-bottom: 15px;">${map.roomList.ro_roomtype }</div>
                <div class="price-wrapper">
                    <span style="font-size: 13pt; font-weight: bold; color: #2e2e2e; padding: 0;"><fmt:formatNumber value="${map.roomList.calendar_price }" pattern="#,###" /></span> 원 <span style="font-size: 12px; padding: 0;">(1박 기준)</span>
                </div>
                <div style="text-align: center; ">
                    <div class="cancel-reservation" style="width: 270px; margin: 0">(<%= today %>  16:59까지 무료취소 가능)</div>
                </div>
            </div>
        </div>
        <div class="inner-section bottom">
            <div class="blank"></div>
        </div>
        <div class="inner-section margin-top block">
            <div class="info-wrapper">
                <div>객실 혜택</div>
            </div>
            <div>
                <div style="font-size: 11pt; line-height: 2; color: #cf9e5e;">✓ 객실 내 자쿠지 이용 불가</div>
            </div>
        </div>
        <div class="inner-section bottom">
            <div class="blank"></div>
        </div>
        <div class="inner-section margin-top block">
            <div class="info-wrapper">
                <div>객실 체크인/체크아웃 시간</div>
            </div>
            <div style="display: flex;">
                <div class="check-inout" style="border-right: 1px solid #dadada;">
                    <div class="park-font">체크인</div>
                    <div>${map.roomList.ho_check_in }</div>
                </div>
                <div class="check-inout">
                    <div class="park-font">체크아웃</div>
                    <div>${map.roomList.ho_check_out }</div>
                </div>
            </div>
        </div>
        <div class="inner-section bottom">
            <div class="blank"></div>
        </div>
        <div class="inner-section margin-top block">
            <div class="info-wrapper">
                <div>객실 설명</div>
            </div>
            <div style="line-height: 2;">
                <div class="park-font">• ${map.roomList.ro_description }</div>
                <div class="park-font">• 객실 내 자쿠지 이용 불가</div>
            </div>
        </div>
        <div class="inner-section bottom">
            <div class="blank"></div>
        </div>
        <div class="inner-section margin-top block">
            <div class="info-wrapper">
                <div>객실 내 시설</div>
            </div>
            <div style="line-height: 3; display: flex; flex-wrap: wrap;">
                <div class="park-font item-width">• 어메니티</div>
                <div class="park-font item-width">• 목욕가운</div>
                <div class="park-font item-width">• TV</div>
            </div>
        </div>
        <div class="inner-section" style="margin-bottom: 10px;">
            <div class="blank"></div>
        </div>
        <div class="inner-section">
            <div>
                <img class="ad-img" src="https://cdn.dailyhotel.com/ux/img-detail-banner-chai@3x.png">
            </div>
        </div>
        <div class="inner-section" style="margin-bottom: 40px;">
            <div class="blank"></div>
        </div>
    </div>
    <div style="width: 1000px; margin: 0 auto;">
        <div class="footer-fixed">
            <div class="footer-item">
                <div class="footer-item-inner">
                    <div class="reservation-btn" style="margin: 0 auto; text-align: center;">
                      	<a href="${cpath }/payment/${map.indata }/${map.roomList.ro_ho_name }/${map.roomList.ro_roomtype}/" style="text-decoration: none; color: black; font-weight: bold; color: white;">총 결제금액 : <fmt:formatNumber value="${map.result }" pattern="#,###" />원 결제</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="inner-section">
    	<div class="blank"></div>
    </div>
</body>
</html>
