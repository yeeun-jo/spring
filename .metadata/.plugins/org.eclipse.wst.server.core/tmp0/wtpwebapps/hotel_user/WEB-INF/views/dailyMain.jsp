<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Train+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<style>

@-webkit-keyframes fadein {
	    from {
	        opacity:0.1;
	    }
	    to {
	        opacity:1;
	    }
	}
	
@-webkit-keyframes fadein {
	    from {
	        opacity:0.1;
	    }
	    to {
	        opacity:1;
	    }
	}
	
	
.gallery_table {
	width: 1590px;
	table-layout: fixed;
	height: 100%;
	max-width: 100%;
}

.item_gallery {
	position: relative;
	padding: 8px;
	border-radius: 0px;
	display: table-cell;
	vertical-align: top;
}

.item_container {
	display: block;
}

.hotel_img {
	width: 384px;
	min-height: 375px;
	background-size: cover;
	background-position: center;
	border-radius: 10px;
}

.hotel_text {
	padding: 10px 0 10px 0;
	display: table;
	width: 100%;
	height: 100%;
	text-align: left;
	vertical-align: middle;
	border-radius: 10px;
	color: black;
	font-size: 15pt;
	font-weight: bold;
}

.hotel_title {
	font-size: 24px;
	color: #212121;
	line-height: 1.6;
}

.hotelName {
	font-size: 20px;
	color: #212121;
	line-height: 1.6;
}

.hotelAddress {
	font-size: 16px;
	color: #eb4d4b;
}

.hotel_des {
	color: #636e72;
}

.hotel_body {
	font-size: 12px;
	color: #999;
}

.main_input_search {
	/* background-image:url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png); */
	background-position: 13px center;
	background-size: contain;
	background-repeat: no-repeat;
	background-color: transparent;
	margin-top: -30px;
	margin-bottom: 5%;
	
	border: none;
	border-bottom: 3px solid #f8585b;
	width: 390px;
	height: 40px;
	outline: none;
	font-weight: bold;
	color: #28cae8;
	/* text-indent: 60px; */
}

.main_input_search:focus {

	/* background-position: 0px center;
	text-indent: 0; */
}

input::placeholder {
	color: #ffffff;
}


.img-wrap {
	position: absolute;
}

.main-text {
	position: relative;
}

.blank {
	height: 50vh;
}

.img-wrap {
	width: 100%;
	height: 95vh;
	overflow: hidden;
}

.section {
	min-width: 100%;
}

.king-section {
	width: inherit;
}

.top {
	margin-bottom: 28%;
	position: absolute;
}

.main-input {
	position: relative;
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

.main-text {
	width: 100%;
}

.main-text-inner {
	display: flex;
	/* width: 1000px; */
	margin: 0 auto;
	align-items: center;
	justify-content: center;
}

.section-blank {
	height: 200px;
}

.section-blank2 {
	height: 100px;
}

.section-blank3 {
	height: 1000px;
	max-height: 40%;
}

.section-blank4 {
	height: 50px;
}

hidden {
	display: none;
}

/*------------------------*/

ul,li{ list-style: none; }

.wrap{
    width: 100%;
    position: relative;
}

.wrap1{
    width: 100%;
    position: relative;
}
.wrap-in{ 
    width: 1200px;
    margin: 0 auto;
}

.agree_daddy4 {
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    display: flex;
    /* display: none; */
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    z-index: 99;
    background-color: rgba(0, 0, 0, 0.15);
}
.agree_daddy1 {
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    display: flex;
    /* display: none; */
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    z-index: 99;
    background-color: rgba(0, 0, 0, 0.15);
}
.agree_mom1 {
    margin: 120px auto;
    border-radius: 2px;
    width: 700px;
    background-color: rgb(255, 255, 255);
    z-index: 8;
    box-sizing: border-box;
    opacity: 1;
}
.agree_mom4 {
    margin: 120px auto;
    border-radius: 2px;
    width: 700px;
    background-color: rgb(255, 255, 255);
    z-index: 8;
    box-sizing: border-box;
    opacity: 1;
}

.agree_div {
    position: relative;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.agree_div_top {
    border-radius: 2px 2px 0px 0px;
    padding: 42px 42px 36px;
    position: relative;
    opacity: 1;
}

.agree_div_body {
    padding-top: 30px;
    padding-bottom: 42px;
    margin: 0px 42px;
    position: relative;
    height: auto;
    display: block;
    -webkit-box-align: center;
    align-items: center;
    border-top: 1px solid rgb(238, 238, 238);
    overflow-y: auto;
}

.agree_title {
    font-size: 26px;
    line-height: 38px;
    padding-right: 48px;
    display: inline-block;
    width: 100%;
    font-weight: 700;
}

.agree_x_button {
    line-height: 38px;
    top: 38px;
    right: 42px;
    position: absolute;
}

.agree_x4 {
    position: relative;
    cursor: pointer;
    background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjMjIyIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMy40NjYgMTJsNi4yMy02LjIzYTEuMDM2IDEuMDM2IDAgMTAtMS40NjYtMS40NjZMMTIgMTAuNTM0bC02LjIzLTYuMjNBMS4wMzYgMS4wMzYgMCAxMDQuMzA0IDUuNzdsNi4yMyA2LjIzLTYuMjMgNi4yM2ExLjAzNiAxLjAzNiAwIDEwMS40NjYgMS40NjZsNi4yMy02LjIzIDYuMjMgNi4yM2ExLjAzNSAxLjAzNSAwIDEwMS40NjYtMS40NjVMMTMuNDY2IDEyeiIvPjwvc3ZnPg==") center center / cover no-repeat;
    overflow: hidden;
    padding: 15px 15px;
}
.agree_x1 {
    position: relative;
    cursor: pointer;
    background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjMjIyIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMy40NjYgMTJsNi4yMy02LjIzYTEuMDM2IDEuMDM2IDAgMTAtMS40NjYtMS40NjZMMTIgMTAuNTM0bC02LjIzLTYuMjNBMS4wMzYgMS4wMzYgMCAxMDQuMzA0IDUuNzdsNi4yMyA2LjIzLTYuMjMgNi4yM2ExLjAzNiAxLjAzNiAwIDEwMS40NjYgMS40NjZsNi4yMy02LjIzIDYuMjMgNi4yM2ExLjAzNSAxLjAzNSAwIDEwMS40NjYtMS40NjVMMTMuNDY2IDEyeiIvPjwvc3ZnPg==") center center / cover no-repeat;
    overflow: hidden;
    padding: 15px 15px;
}

button {
    border: 0px;
    padding: 0px;
    display: inline-block;
    box-sizing: border-box;
}

table {
    display: table;
}

.agree_tbody {
    border: 1px solid rgb(238, 238, 238);
}

.agree_tr {
    border-bottom: 1px solid rgb(238, 238, 238);
    text-align: left;
}

.agree_th {
    font-size: 14px;
    font-weight: 700;
    background-color: rgb(238, 238, 238);
    padding: 12px;
    width: 150px;
    color: rgba(68, 68, 68);
}

.agree_td {
    font-size: 12px;
    line-height: 18px;
    padding: 12px;
}

.section a {
	color: black;
}
</style>

<body style="margin: 0;">
	<div class="king-section">
		<div class="section top">
			<div class="img-wrap">
				<img src="${cpath}/resources/img/main_img.jpg"
					style="animation: fadein 3s; -webkit-animation: fadein 3s; width: 100%;">
			</div>
			<div class="section-blank"></div>
			<div class="main-text">
				<div class="main-text-inner">
					<div data-aos="flip-left" data-aos-duration="1000" style="font-family: 'Train One', cursive; color: #f8585b; font-weight: bold; font-size: 50pt; text-align: center;">stay,</div>
					<div data-aos="flip-up" data-aos-duration="1000" style="font-family: 'Train One', cursive; color: #f8585b; font-weight: bold; font-size: 50pt; text-align: center; margin-left: 15px;">what you want</div>
				</div>
			</div>
			<div class="section-blank2"></div>
			<div class="main-input" data-aos="zoom-in" data-aos-duration="500">
				<div>
					<div>
						<input class="main_input_search" id="search" onkeyup="filter()" type="text"
						placeholder="Where are you going?" style="font-family: 'Black Han Sans', sans-serif; font-size: 21pt;">
					</div>
					<div style="background-color: #f8585b; width: 50px; height: 50px; border-radius: 100px; position: relative; margin-left: 450px;
					top: -85px; align-content: center; justify-content: center;"><img style="width: 28px; margin: 12px 10px 0px 9px;" src="${cpath }/resources/img/main-search-btn.png"></div>
				</div>
				<div class="search_result">
					<div class="hotel-list hotel-list-scroll">
						<c:forEach var="dto" items="${map.list}">
							<div class="hotel-section hidden"><!-- hidden -->
								<div class="hotel-section-info" style="width: 420px; background-color: rgba( 255, 255, 255, 0.5 ); margin: 0 auto;">
									<a href="${cpath }/hotelView/${dto.HO_NAME}/">
									<div>
										<strong class="hotelName" style="font-weight: 600;">"${dto.HO_NAME }"</strong>
									</div>
									<div class="hotelAddress">'${dto.HO_ADDRESS }'</div>
									<span class="hotel_body">
										<div class="hotel_des" style="margin-top:5px; height: 55px; width: 350px; margin: 0 auto;">
											<span style="word-break: break-all;">${dto.HO_DESCRIPTION }</span>
										</div>
									</span>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div class="section-blank3"></div>

		<div class="section" style="position: relative;">
		
			<div style="height: 210px; width: 1590px; margin: 0 auto;">
			
					<div style="font-family: 'Noto Sans KR', sans-serif; font-size: 27pt; font-weight: bold;">지역별 관광지</div>
					
					<div>
						<div style="display: flex; margin-top: 20px;">
							<div>
							<a href="https://www.airbnb.co.kr/s/%EC%84%9C%EC%9A%B8/homes?place_id=ChIJzWXFYYuifDUR64Pq5LTtioU&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/seoul.jpg">
									<div style="margin: 15px 228px 0px 15px;">
										<span><b>서울</b></span>
										<br>
										<span>차로 5시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							
							<div>	
							<a href="https://www.airbnb.co.kr/s/%EB%8C%80%EA%B5%AC/homes?place_id=ChIJ1a3vsrjjZTURMC44oCngkro&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/daegu.jpg">
									<div  style="margin: 15px 208px 0px 15px;">
										<span><b>대구</b></span>
										<br>
										<span>차로 1.5시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							<div>
							<a href="https://www.airbnb.co.kr/s/%EC%9A%B8%EC%82%B0/homes?place_id=ChIJgd6y4osuZjURATHZM3P6g3A&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">	
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/ulsan.jpg">
									<div  style="margin: 15px 226px 0px 15px;">
										<span><b>울산</b></span>
										<br>
										<span>차로 1시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							
							<div>
							<a herf="https://www.airbnb.co.kr/s/%EB%8C%80%EC%A0%84/homes?place_id=ChIJAWZKutdIZTURtdOKmJ3WltE&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/daejeon.jpg">
									<div  style="margin: 15px 0px 0px 15px;">
										<span><b>대전</b></span>
										<br>
										<span>차로 3.5시간 거리</span>
									</div>
								</div>
							</a>
							</div>
						</div>
						
						<div style="display: flex; margin-top: 10px;">
							<div>
							<a href="https://www.airbnb.co.kr/s/%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&flexible_trip_dates%5B%5D=april&flexible_trip_dates%5B%5D=may&flexible_trip_lengths%5B%5D=weekend_trip&date_picker_type=calendar&query=%EB%B6%80%EC%82%B0%EA%B4%91%EC%97%AD%EC%8B%9C&place_id=ChIJNc0j6G3raDURpwhxJHTL2DU&source=structured_search_input_header&search_type=autocomplete_click">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/busan.jpg">
									<div style="margin: 15px 225px 0px 15px;">
										<span><b>부산</b></span>
										<br>
										<span>차로 0시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							
							<div>
							<a href="https://www.airbnb.co.kr/s/%EC%9D%B8%EC%B2%9C/homes?place_id=ChIJR4ITliVveTURQmG3LJD9N30&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">	
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/incheon.jpg">
									<div  style="margin: 15px 206px 0px 15px;">
										<span><b>인천</b></span>
										<br>
										<span>차로 5.5시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							
							<div>
							<a href="https://www.airbnb.co.kr/s/%EA%B4%91%EC%A3%BC/homes?place_id=ChIJr6f1ASOJcTURSPUlAe3S9AU&refinement_paths%5B%5D=%2Fhomes&search_type=section_navigation">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/gwangju.jpg">
									<div  style="margin: 15px 212px 0px 15px;">
										<span><b>광주</b></span>
										<br>
										<span>차로 3.5시간 거리</span>
									</div>
								</div>
							</a>
							</div>	
							
							<div>	
							<a href="https://www.airbnb.co.kr/s/%EC%A0%9C%EC%A3%BC/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&flexible_trip_dates%5B%5D=april&flexible_trip_dates%5B%5D=may&flexible_trip_lengths%5B%5D=weekend_trip&date_picker_type=calendar&source=structured_search_input_header&search_type=search_query">
								<div style="display: flex;"><img style="width: 65px; border-radius: 10px;" src="${cpath }/resources/img/jeju.jpg">
									<div  style="margin: 15px 0px 0px 15px;">
										<span><b>제주</b></span>
										<br>
										<span>비행기로 1시간 거리</span>
									</div>
								</div>
							</a>
							</div>
						</div>
					</div>
					
				</div>
		</div>
		
		<div class="section show-hotel" style="position: relative;">
			<div class="gallery_table" style="margin: 0 auto; align-content: center;">
				<p style="font-size: 30pt; font-weight: bold; font-family: 'Noto Sans KR', sans-serif; text-align: left;">
					<strong>Stays</strong>
				</p>
				<div class="gallery_container" style="text-align: left; width: 1600px;">
					<c:forEach var="map" items="${map.list}">
						<div class="item_gallery" style="padding: 0; margin-right: 25px; margin-bottom: 16px; width: 370px; display: inline-block;">
							<a href="${cpath }/hotelView/${map.HO_NAME}/" class="item_container">
								<div class="hotel_img" class="content" style="background-image: url(http://182.212.181.172:9000/${map.HO_UPLOADFILE});"></div>
								<div class="hotel_text" style="width: 286px;">${map.HO_NAME }
									
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div class="section-blank4"></div>
	
	<!-- 하단 '광고성 정보수신동의' -->
	<div class="wrap hidden">
        <div class="wrap-in">
            <div class="agree_daddy4">
                <div class="agree_mom4">
                    <div>
                        <div class="agree_div">
                            <div class="agree_div_top">
                                <div class="agree_title">광고성정보수신동의</div>
                                <div class="agree_x_button">
                                    <button class="agree_x4"></button>
                                </div>
                            </div>
                            <div class="agree_div_body">
                                <table class="agree_table">
                                    <tbody class="agree_tbody">
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">개인정보 수집 및 이용목적</th>
                                            <td colspan="1" class="agree_td">JAVA의 서비스, 이벤트, 업데이트에 대한 광고성 정보 전송</td>
                                        </tr>
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">수집 항목</th>
                                            <td colspan="1" class="agree_td">휴대 전화 번호, 이메일 주소</td>
                                        </tr>
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">개인 정보 보유 및 이용기간</th>
                                            <td colspan="1" class="agree_td">회원정보 편집에서 동의를 해제할 수 있으며 해제시 폐기
                                                (단, 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 관련 법령에 따라 보관)
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 하단 '위치정보수신동의' -->
    <div class="wrap1 hidden">
        <!-- 전체 화면 -->
        <div class="wrap-in">
            <!-- 모달부분 -->
            <div class="agree_daddy1">
                <div class="agree_mom1">
                    <div class="agree_div">
                        <div class="agree_div_top">
                            <div class="agree_title">위치정보수신동의</div>
                            <div class="agree_x_button">
                                <button class="agree_x1"></button>
                            </div>
                        </div>
                        <div class="agree_div_body">
                            <table class="agree_table">
                                <tbody class="agree_tbody">
                                    <tr rowspan="1" class="agree_tr">
                                        <th colspan="1" class="agree_th">국내 숙소 이용규칙 동의</th>
                                        <td colspan="1" class="agree_td">
                                            * 각 숙박시설의 규정(규칙 및 약관 등)을 준수해야 합니다. 숙박시설 규정을 위반 시 입실 불가,
                                            퇴실 조치, 추가요금 등이 발생할 수 있으며, 이에 대한 모든 책임은 예약 및 이용 고객님에게 있으므로
                                            숙박시설의 이용규칙과 시설 현황을 반드시 확인하시기 바랍니다.<br><br>
                                            * 규정 내 이용 가능 인원을 초과할 경우, 이용 불가 통보 또는 초과 인원에 대한 추가 요금이 발생할 수
                                            있으며, 이에 대한 모든 책임은 예약자 및 이용 고객님에게 있습니다.<br><br>
                                            * 미성년자 투숙 시 청소년보호법 등 관계 법령에 따라 미성년자(만 19세 미만 청소년)의 경우 혼숙이 금지
                                            되며, 법정대리인 동행 없이 혼숙이 불가한 점 반드시 유의하여 주시길 바랍니다. 또한 해당 사유로 인하여
                                            현장에서 입실이 불가할 경우 취소 및 환불이 불가합니다.<br><br>
                                            * 각 숙박시설 정보는 예약을 위한 참고 자료입니다. 숙박시설 내 자체 변동이나 기타 사유로 인해 실제와
                                            차이가 있을 수 있으며, 이에 대해 (주)떠나볼까 는 책임을 지지 않습니다.<br><br>
                                            * 객실배정에 따른 요청사항(금연룸, 고층 등)은 숙박시설에 전달되나, 최종 반영 여부는 예약하신 숙박시설의
                                            결정사항이므로 (주)떠나볼까 에서 보장할 수 없는 사항임을 유의하여 주시기 바랍니다.
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot class="agree_tfoot">
                                    <td colspan="2">
                                        <em>위 서비스이용약관은 거부할 수 있으며, 거부할 경우 서비스 이용이 제한됩니다.</em>
                                    </td>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
	
	<footer style="height: 100%; color: #919191; background-color: #f7f7f7;">
		<div style="width: 100%; margin-bottom: 40px;">
			<div style="border-top: 1px solid #dadada; width: 100%; margin: 0 auto;"></div>
		</div>
		<div class="footer" style="width: 1590px; margin: 0 auto;">
			<div class="footer_section" style="display: flex; margin-bottom: 20px;">
				
				<div style="margin-right: 500px; margin-left: 5px;">
						<div style="font-size: 11pt;"><b>소개</b></div><br>
						<div style="font-size: 10pt;">JAVA 이용 방법</div><br>
						<div style="font-size: 10pt;">뉴스룸</div><br>
						<div style="font-size: 10pt;">투자자 정보</div><br>
						<div style="font-size: 10pt;">JAVA 플러스</div><br>
						<div style="font-size: 10pt;">JAVA 비즈니스 프로그램</div><br>
						<div style="font-size: 10pt;">채용정보</div><br>
						<div style="font-size: 10pt;">창립자 편지</div><br>
					</div>
					
					<div style="margin-right: 500px;">
						<div style="font-size: 11pt;"><b>커뮤니티</b></div><br>
						<div style="font-size: 10pt;">다양성 및 소속감</div><br>
						<div style="font-size: 10pt;">접근성</div><br>
						<div style="font-size: 10pt;">구호 인력을 위한 숙소</div><br>
						<div style="font-size: 10pt;">게스트 추천</div><br>
						<div style="font-size: 10pt;">JAVA.org</div><br>
					</div>
					
					<div>
						<div style="font-size: 11pt;"><b>JAVA 지원</b></div><br>
						<div style="font-size: 10pt;">JAVA 코로나 19 대응 방안</div><br>
						<div style="font-size: 10pt;">도움말 센터</div><br>
						<div style="font-size: 10pt;">예약 취소 옵션</div><br>
						<div style="font-size: 10pt;">JAVA 이웃 민원 지원</div><br>
						<div style="font-size: 10pt;">신뢰와 안전</div><br>
						<div class="agreeAd" style="cursor: pointer; font-size: 10pt;">광고성정보수신동의</div><br>
						<div class="agreeGps" style="cursor: pointer; font-size: 10pt;">위치정보수신동의</div>
					</div>
			</div>
		</div>
			<div style="border-top: 1px solid #dadada; width: 100%; text-align: center;">
				<div style="height: 40px;"></div>
				<div style="width: 1590px; margin: 0 auto;">(주) JAVA는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</div>
				<div style="height: 20px;"></div>
				<div>Copyright ⓒ JAVA All rights reserved.</div>
			</div>
		<div style="height: 20px;"></div>
	</footer>
	
	<script>
		// 광고성정보수신동의 모달관리
		agreeAd = document.querySelector('.agreeAd');
		wrap = document.querySelector('.wrap');
		close = document.querySelector('.agree_x4');
		
		agreeAd.onclick = function(){
			wrap.classList.remove('hidden');
		}
		
		close.onclick = function(){
			wrap.classList.add('hidden');
		}
		
		// 위치정보수신동의 모달관리
		agreeGps = document.querySelector('.agreeGps');
		wrap1 = document.querySelector('.wrap1');
		close1 = document.querySelector('.agree_x1');
		
		agreeGps.onclick = function(){
			wrap1.classList.remove('hidden');
		}
		
		close1.onclick = function(){
			wrap1.classList.add('hidden');
		}
		
	</script>
	
	
	
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<script>
		AOS.init();
	</script>

	<script>
		function filter() {
			let search = document.getElementById("search").value.toLowerCase();
			let hotelSection = document.getElementsByClassName("hotel-section");

			for (let i = 0; i < hotelSection.length; i++) {
				hotelName = hotelSection[i].getElementsByClassName("hotelName");
				hotelAddress = hotelSection[i].getElementsByClassName("hotelAddress");
				hotel_section = document.querySelector('.hotel-section');
				console.log(hotelName);

				if (hotelName[0].innerHTML.toLowerCase().indexOf(search) != -1 || hotelAddress[0].innerHTML.toLowerCase().indexOf(search) != -1) {
					hotel_section.classList.remove('hidden');
					hotelSection[i].style.display = "block";
				} else {
					hotel_section.classList.add('hidden');
					hotelSection[i].style.display = "none";
				}

				if (hotelName[0].innerHTML.toLowerCase().indexOf(search) != 0 || hotelAddress[0].innerHTML.toLowerCase().indexOf(search) != 0) {

				} else {
					hotelSection[i].style.display = "none";
				}
			}
		}
	</script>

</body>
</html>
