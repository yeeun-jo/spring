<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        header {
            text-align: center;
        }
        .back {
            width: 1000px;
            height: 500px;
            margin: 0 auto;
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
        .address {
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            display: flex;
            height: 43px;
        }
        .address > h1 {
            font-size: 16px;
            color: #4D4D4D;
            width: 576px;
            text-align: left;
            padding-top: 11px;
            padding-bottom: 11px;
            padding-left: 372px;
        }
        .address > input {
            width: 70.61px;
            white-space: nowrap;
            padding: 8px 10px;
            border: 1px solid #dcdcdd;
            border-radius: 1px;
            color: #4d4d4d;
            font-size: 13px;
            line-height: .92;
            margin-right: 10px;
        }
    </style>

<header>
    <div class="back">
        <a href="${cpath }/hotelView/${dto.ho_name}/"><img src="https://cdn.dailyhotel.com/ux/icon-close-x.svg" alt></a>
        <h1>지도</h1>
    </div>
</header>
<body>

	<div id="map" style="width: 1000px;height:600px; margin: auto;"></div>
	
	<div style="margin-top: 30px; margin-bottom:20px; text-align: center;">
	    <div class="link">
	        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
	            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
	        </a>
	    </div>
	</div>
	
    <div class="address">
        <h1 id="hotelAddress">${dto.ho_address }</h1>
        <button onclick="clipBoard()">주소복사</button>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5f744e54d8dc7792dc155acb74f0d18&libraries=services"></script>

<script>
	//클립보드로 복사하는 기능을 생성
	function clipBoard() {
	
		// 글을 쓸 수 있는 란을 만든다.
		var aux = document.createElement("input");
	
		// 지정된 요소의 값을 할당 한다.
		aux.setAttribute("value", document.getElementById("hotelAddress").innerHTML);
	
		// body에 추가.
		document.body.appendChild(aux);
	
		// 지정된 내용을 강조한다.
		aux.select();
	
		// 텍스트를 카피 하는 변수를 생성
		document.execCommand("copy");
	
		// body 로 부터 다시 반환 한다.
		document.body.removeChild(aux);
	
		//alert(aux.value);
		alert("주소 복사 성공 !");
	}
</script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${dto.ho_address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;border-radius:50%;text-weight: bold;">'+'${dto.ho_name}'+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	     else{
	    	 var back = '${cpath}/hotelView/${dto.ho_name}/';
	    	 alert('주소 확인 바람 !!');
	    	 location.href = back;
	     }
	});    
</script>

</body>
</html>
