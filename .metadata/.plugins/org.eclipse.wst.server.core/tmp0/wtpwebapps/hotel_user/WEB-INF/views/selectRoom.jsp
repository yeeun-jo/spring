<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/selectRoom.css">
<style>
.room_img {
	width: 107.59px;
	min-height: 168px;
	background-size: cover;
	background-position: center;
}
.selectRoom_title_context {
	font-size: 12px; color: #929292; margin-left: 4px;
}
.selectRoom_date_context {
	font-size: 14p; font-weight: 500; color: rgb(219, 7, 74);
}
.selectRoom_dateBox {
	width: 100%; padding: 8px 20px; background-color: white; z-index: 50; position: sticky; top: 44px;
}
.selectRoom_date_context{
	font-size: 14px; font-weight: 500; color: rgb(219, 7, 74);
}
.r_price {
	font-size: 16px; font-weight: 700; line-height: 1.06; color: #323232;
}
.not_roomList {
	margin: auto; display:flex; justify-content: center; align-items: center; height: 1000px;
}
</style>

<body>	
<c:if test="${not empty map.roomList }">	
	<div class="selectRoom">
		<div class="selectRoom_title">
			<h3>객실선택 <span class="selectRoom_title_context">(세금/봉사료 포함)</span></h3>
		</div>
		
		<div class="selectRoom_hotelName">
			<div class="selectRoom_date">
				<span class="selectRoom_date_context">${map.hotelName }</span>
			</div>
		</div>
		
		<div class="selectRoom_dateBox" >
			<div class="selectRoom_date">
				<span  class="selectRoom_date_context">${map.indata }</span>
			</div>
		</div>
		<div class="selectRoom_Type">
		<c:forEach var="room" items="${map.roomList }">
			<div class="selectRoom_type_item" >
			<a ${room.CALENDAR_COUNT == 0 ? 'href=#' : '' } href='${cpath}/rooms/${map.indata }/${room.RO_HO_NAME }/${room.RO_ROOMTYPE}/'>
				<img class="room_img" style="background-image:url(http://182.212.181.172:9000/${room.RO_UPLOADFILE });">
			</a>
				<div class="room_info">
					<div class="room_type">${room.RO_ROOMTYPE }</div>
					<div class="room_badType">
						<img src="https://cdn.dailyhotel.com/ux/icon-detail-bed.svg">
						<span>${room.RO_BADTYPE }</span>
					</div>
					<div class="room_limitPerson">
						<img src="https://cdn.dailyhotel.com/ux/icon-detail-people.svg">
						<span>${room.RO_LIMITPERSON }인 기준</span>
					</div>
					<div class="room_limitPerson">
						<span class="r">방 : ${room.CALENDAR_COUNT }개</span>
					</div>
					<div class="room_price">
						<span class="r">숙박</span>
						<span class="r_price">${room.CALENDAR_PRICE }원</span>
					</div>
				</div>
			</div>
		</c:forEach>	
		</div>
	</div>
</c:if>	

<c:if test="${empty map.roomList }">
	<div class="not_roomList"><h1>아직 준비중입니다.</h1></div>
</c:if>

</body>
</html>
