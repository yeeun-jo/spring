<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MM월 dd일");
%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<link rel="stylesheet" href="${cpath }/resources/css/calendar.css"></link>
<link rel="stylesheet" href="${cpath }/resources/css/userHotel.css"></link>
<link rel="stylesheet" href="${cpath }/resources/css/style.css"></link>
<link rel="stylesheet" href="${cpath }/resources/css/modal_review.css"></link>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style>
	/* 바디에 스크롤 막는 방법 */
	.not_scroll{
	    position: fixed;
	    overflow: hidden;
	    width: 100%;
	    height: 100%;
	}
	
	.scroll{
		overflow: scroll;
		width: auto;
		height: 500px;
	}
	
	#hidden,.hidden{
		display: none;
	}
	
	.review-list {
		 border-bottom: 1px solid #dadada;
		 margin-bottom: 15px;
	}
	
	#load {
		 color: #fd79a8;
		 cursor: pointer;
	}
	
	/*  리뷰부분  */
	.review-score {
		font-size: 18px;
		font-weight: bold;
		color: #fd79a8;
		text-shadow: 0 1px 0 rgba(255, 255, 255, .75);
	}
	.cuID {
		font-size: 12px;
		color: #888;
	}
	.review-content {
		margin-left: 20px;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.replyContent {
		font-size: 15px;
		margin-left: 40px;
		margin-bottom: 10px;
	}
	.flatpickr-day.flatpickr-disabled, .flatpickr-day.flatpickr-disabled:hover {
		color: grey;
	}
</style>

<div style="width: 1000px; margin: auto; height:45px; display: flex; justify-content: space-between; margin-bottom: 10px;">
        <!-- 날짜 선택하고 객실 보기 -->
        <div class="Floating__StyledFloatingBtnRedBot-ej6lt-0 cIjWgG">
       		<button id="reservation-modal-Btn">날짜 선택하고 객실 보기</button>   
        </div>
 </div> 
		<!--  예약창 띄우기 -->
         <div class="reservation_modal hidden">
        <div class="reservation_modal_overlay"></div>   <!--나머지 배경 어둡게 만드는 영역-->
        <div class="reservation_modal_content">         <!--표시하고 싶은 내용-->
        
	           	<button class="reservation-btn" >
        		    <form id="reservationForm" method="POST">
        		    	<div class="reservation">
						<input name="indata" type="date" class="dataSelector" placeholder="ex)2021-12-24 ~ 2021-12-31" />
						</div>
						<button class="reservationBtn" type="submit">검색</button>
		            </form> <!--  end of reservationForm -->
				</button>	 <!--  end of reservation -->
        </div>	<!-- end of reservation_modal_overlay -->
    </div> 	<!-- end of reservation_modal hidden -->

 
 
 

    <div style="width: 1000px; margin: auto;">
      	<div>
            <img src="http://182.212.181.172:9000/${map.dto.ho_uploadfile }" width="100%">
      	</div>

        <div class="detail-header">
            <div class="detail-bg">
                <div class="detail-title">${map.dto.ho_name}</div>
                <div class="detail-price-wrapper">
                    <div class="hotel-price-info">
                        <div class="price-by-type">
                            <div class="price-txt-group">
                                <span class="price"><fmt:formatNumber value="${map.roomPrice }" pattern="#,###" /></span>
                                <span class="price-suffix">원</span>
                            </div>
                        </div>
                    </div>
                    <div class="ref-date">(<%= sf.format(nowTime) %> 투숙 기준)</div>
                </div>
            </div>
        </div>

        <div class="detail-bg detail-true-review">
        	<div class="diGnvT">
			<h1 class="detail-title">리뷰</h1>
			<div class="satisfaction">
			    <span class="evaluation">(${map.count } 명 평가)</span>
			</div>
        	</div>
		<div class="review-container"></div>
            	<div id="load">더보기</div>
        </div>
	<script type="text/javascript">
        	var totalCnt = ${map.count};
        	var cnt = 4;
        	var i, id, score, content, rcontent, reviewList, reviewInfo, reviewScore, cuID, reviewContent, replyContent;
        	const moreBtn = document.getElementById('load');
        	const reviewContainer = document.querySelector('.review-container');
        	var plus = 0;
        	<c:forEach var="list" items="${map.showReview}">
        	
        	if(plus <= 5){
              score = parseInt("${list.review_score}");
              id = "${list.review_cu_id}";
              content = "${list.review_opinion}";
              rcontent = "${list.reply_opinion}";
              ho_name = "${map.dto.ho_name}";
              
              reviewList = document.createElement('div');
              reviewList.className = 'review-list';
              reviewInfo = document.createElement('div');
              reviewInfo.className = 'review-info';
              reviewList.appendChild(reviewInfo);
              reviewContainer.appendChild(reviewList);
              
              reviewScore = document.createElement('span');
              reviewScore.className = 'review-score';
              reviewScore.innerHTML = score + ' 점 ';
  
              cuID = document.createElement('span');
              cuID.className = 'cuID';
              cuID.innerHTML = id;
              reviewInfo.appendChild(reviewScore);
              reviewInfo.appendChild(cuID);
              
              reviewContent = document.createElement('div');
              reviewContent.className = 'review-content';
              reviewContent.innerHTML = content;
              reviewList.appendChild(reviewContent);
              
              if(rcontent != ''){
            	  replyContent = document.createElement('div');
                  replyContent.className = 'replyContent';
                  replyContent.innerHTML = '❣ ️' + ho_name + ' : ' + rcontent;
                  replyContent.style.color = '#a29bfe';
                  reviewList.appendChild(replyContent);
              }
              
          } else if(plus => totalCnt){
             reviewList.classList.add('hidden');
             reviewInfo.classList.add('hidden');
             reviewScore.classList.add('hidden');
             cuID.classList.add('hidden');
             reviewContent.classList.add('hidden');
              
          }
           console.log('++되기전 플러스 : ' + plus);
           plus++;
           console.log('++후 플러스 : ' + plus);
              
           </c:forEach>
           
           moreBtn.onclick = function(e) {
                  
               reviewContainer.innerHTML = '';
               moreBtn.classList.add('hidden');
                  
              <c:forEach var="list" items="${map.showReview}">
               
              score = parseInt("${list.review_score}");
              id = "${list.review_cu_id}";
              content = "${list.review_opinion}";
              rcontent = "${list.reply_opinion}";
                  
              	  reviewList = document.createElement('div');
                  reviewList.className = 'review-list';
                  reviewInfo = document.createElement('div');
                  reviewInfo.className = 'review-info';
                  reviewList.appendChild(reviewInfo);
                  reviewContainer.appendChild(reviewList);
                  
                  reviewScore = document.createElement('span');
                  reviewScore.className = 'review-score';
                  reviewScore.innerHTML = score + ' 점 ';
                  cuID = document.createElement('span');
                  cuID.className = 'cuID';
                  cuID.innerHTML = id;
                  reviewInfo.appendChild(reviewScore);
                  reviewInfo.appendChild(cuID);
                  
                  reviewContent = document.createElement('div');
                  reviewContent.className = 'review-content';
                  reviewContent.innerHTML = content;
                  reviewList.appendChild(reviewContent);
                  
                  replyContent = document.createElement('div');
                  replyContent.className = 'replyContent';
                  replyContent.innerHTML = rcontent;
                  replyContent.style.color = '#a29bfe';
                  reviewList.appendChild(replyContent);
                  
               </c:forEach>
         }
        </script>
           
        <hr>
        <div>
            <h3>객실 선택</h3>
            <div class="slideshow-container">
            	<c:forEach var="room" items="${map.roomIMG}">
	                <div class="mySlides fade">
	                    <img src="http://182.212.181.172:9000/${room.ro_uploadfile }" style="width: 100%; height: 618px;">
	                </div>
            	</c:forEach>
                <div class="mySlides fade">
                    <img src="${cpath }/resources/img/room3.jpg" style="width: 100%; height: 618px; ">
                </div>
            </div>
            
            <div style="text-align: center;">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>
        <div class="h-comment">
            <section class="hotel-comment">
                <img src="https://cdn.dailyhotel.com/ux/icon-detail-daily-comment.svg" alt="데일리 코멘트 아이콘">
                <h1 class="title">hotel java?'s comment</h1>
                <ul>
                    <li>
                        <p class="comment">${map.dto.ho_description }</p>
                        <span class="order">01</span>
                    </li>
                    <li>
                        <p class="comment">바다를 조망하며 다채로운 온천 스타일을 경험해보십시오.</p>
                        <span class="order">02</span>
                    </li>
                    <li>
                        <p class="comment">책의 숲 사이로 펼쳐지는 지적인 즐거움, 이터널 저니</p>
                        <span class="order">03</span>
                    </li>
                    <li>
                        <p class="comment">** 코로나19로 사회적거리두기로 호텔조식이 도시락 단품으로 변경될 수도 있습니다. **</p>
                        <span class="order">04</span>
                    </li>
                </ul>
            </section>
        </div>
        
        <div class="facility">
            <h1 class="detail-title">업장 내 편의시설</h1>
            <ul class="facilities clearfix">
            	<c:if test="${not empty map.dto.ho_wifi }">
            		<li>
            			<img src="${cpath }/resources/img/37.png" width="70px" height="70px">
            			<br>Wifi<br>
           			</li>
            	</c:if>
            	
            	<c:if test="${not empty map.dto.ho_pc }">
	           		<li>
            			<img src="${cpath }/resources/img/28.png" width="70px" height="70px">
            			<br>PC<br>
	           		</li>
           		</c:if>
           		
            	<c:if test="${not empty map.dto.ho_breakfast }">
           			<li>
            			<img src="${cpath }/resources/img/10.png" width="70px" height="70px">
            			<br>조식<br>
           			</li>
            	</c:if>
            	
             	<c:if test="${not empty map.dto.ho_smoke }">
           			<li>
            			<img src="${cpath }/resources/img/50.png" width="70px" height="70px">
            			<br>흡연가능<br>
           			</li>
            	</c:if>
            	
             	<c:if test="${not empty map.dto.ho_parking }">
           			<li>
            			<img src="${cpath }/resources/img/1.png" width="70px" height="70px">
            			<br>주차가능<br>
           			</li>
           		</c:if> 
           		
           		<c:if test="${not empty map.dto.ho_pool }">
           			<li>
            			<img src="${cpath }/resources/img/18.png" width="70px" height="70px">
            			<br>수영가능<br>
           			</li>
           		</c:if>
           		
            </ul>
        </div>

        <br>
        <div class="map">
            <div class="inner">
            	<a href="${cpath}/map/${hotelName}">
                    <div class="addr">
                        <span>${map.dto.ho_address }</span>
                        <img src="https://cdn.dailyhotel.com/ux/icon-detail-map.svg" alt="map icon">
                    </div>
                </a>
            </div>
        </div>
        <br>

        <!-- 대표 체크인 부터 -->
        <div id="checkIn-checkOut">
            <h1 >대표 체크인/체크아웃 시간</h1>
            <div id="check">
                <div id="check-in">
                    <span style="font-size: 14px; color: #888888">체크인<br></span>
                    <span style="font-size: 16px; color: #4D4D4D;">${map.dto.ho_check_in }</span>
                   
                </div>
                <div id="check-out">
                    <span style="font-size: 14px; color: #888888">체크아웃<br></span>
                    <span style="font-size: 16px; color: #4D4D4D;">${map.dto.ho_check_out }</span>                
                </div>
            </div>    
        </div>
        <hr>

        <!-- 금/흡연 여부 -->
        <div class="static-item">
            <h1>금/흠연 여부</h1>
            <ul class="lists">
                <li>전 객실 금연실</li>
            </ul>            
        </div>
        <hr>
                                                                                                                                                                
        <!-- 부대시설 정보 -->        
        <div class="static-item">
            <h1>부대시설 정보</h1>
            <ul class="lists">
                <li>피트니스, 스파, 사우나, 미팅룸, 실내수영장, 실외수영장(roof top)</li>
                <li>식음시설 : 1층 레스토랑, 풀사이드 바, 편의점, 각종 근린 생활시설</li>
                <h2 class="sub-title">쉘팩토리(Shell Factory)</h2>
                <li class="unvisible more-enter-done">사회적 거리두기 단계에 따라 운영시간이 변경될 수 있습니다.</li>
                <li class="unvisible more-enter-done">운영시간 : 07:00 ~ 22:00(금~토 23:00)</li>
                <li class="unvisible more-enter-done">조식 : 07:00 ~ 10:30</li>
                <li class="unvisible more-enter-done">성인 25,000원, 8세 ~ 13세 13,000원, 4세 ~ 7세 10,000원, 4세 이하 무료</li>
                <li class="unvisible more-enter-done">점심&저녁 단품식사 : 11:00 ~ 22:00(금~토 23:00)</li>
                <li class="unvisible more-enter-done">해당 호텔 결혼식 및 피로연 등으로 레스토랑 이용이 어려울 수 있으므로 예약하신 일정에 호텔로 확인해주시기 바랍니다</li>
                <h2 class="sub-title unvisible more-enter-done">사우나</h2>
                <li class="unvisible more-enter-done">사회적 거리두기 단계에 따라 운영시간이 변경될 수 있습니다.</li>
                <li class="unvisible more-enter-done">06:00 ~ 21:00 이용 가능 / North Tower 지하2층</li>
                <li class="unvisible more-enter-done">매월 첫번째 수요일 정기점검일입니다.</li>
                <li class="unvisible more-enter-done">이용요금 : 일반요금 15,000원 / 투숙객 할인요금 10,000원 (소인 5,000원)</li>
                <li class="unvisible more-enter-done">분실 위험이 있는 귀중품은 리셉션 데스크에 보관해 주시기 바랍니다.</li>
                <li class="unvisible more-enter-done">쾌적한 환경을 위하여 외부음식 반입을 삼가하여 주시기 바랍니다.</li>
                <li class="unvisible more-enter-done">사우나 소인기준 36개월~7세까지 / 7세이하는 반드시 보호자 동반입장으로만 이용 가능합니다.</li>
                <h2 class="sub-title unvisible more-enter-done">피트니스 센터</h2>
                <li class="unvisible more-enter-done">사회적 거리두기 단계에 따라 운영시간이 변경될 수 있습니다.</li>
                <li class="unvisible more-enter-done">이용요금 10,000원</li>
                <li class="unvisible more-enter-done">이용시간 : 07:00 ~ 22:00 (주중,주말 동일)</li>
                <li class="unvisible more-enter-done">장소 : North Tower 20층 위치</li>
                <li class="unvisible more-enter-done">객실 투숙객 및 회원 전용 시설입니다. (투숙객2인 무료이용)</li>
                <li class="unvisible more-enter-done">분실위험이 있는 귀중품은 리셉션 데스크에 보관해 주시기 바랍니다.</li>
                <li class="unvisible more-enter-done">쾌적한 환경을 위하여 외부 음식 반입을 삼가하여 주시기 바랍니다.</li>
                <h2 class="sub-title unvisible more-enter-done">만 18세이상 고객에 한하여 입장이 가능합니다.</h2>
            </ul>
            <div class="show-more-btn">더보기</div>
        </div>
        <hr>

        <!-- 예약 시 참고사항-->
        <div class="static-item">
            <h1>예약 시 참고사항</h1>
            <ul class="lists">
                <h2 class="sub-title">객실당 2인기준으로 1인 인원 추가시 22,000원의 금액이 현장추가결제됩니다.(최대인원 초과 시 입실이 불가합니다.)</h2>
                <li>부모동반 아동투숙 가능</li>
                <li>엑스트라베드 추가 불가 </li>
                <h2 class="sub-title">플라스틱 없는 호텔 만들기</h2>
                <li>스카이베이 호텔 경포는 강원도 최초 "친환경 호텔"로 한걸음 더 내딛기 위해 2020년 2월 16일부터 칫솔, 치약, 면도기, 슬리퍼 등 일회용품 제공이 불가합니다.(욕실용품4종&비누 제공)</li>
            </ul>
        
        </div>
        <hr>
        <!--인피니티풀 정보-->
        <div class="static-item">
            <h1>인피티니풀 정보</h1>
            <ul class="lists">
                <h2 class="sub-title">인피니티 풀(유료시설)</h2>
                <li>사회적 거리두기 단계에 따라 운영시간이 변경될 수 있습니다.</li>
                <li>운영시간 : 07:00~22:00 (주중, 주말 동일)</li>
                <li >이용장소 : North Tower 20층</li>
                <li>운영 시간은 계절 및 기상상황에 따라 상이할 수 있습니다.</li>
                <li>인피니티풀 크기 : 길이 25m x 너비 6m x 깊이 1.3m</li>
                <li>실내수영장 크기 : 길이 20m x 너비 5m x 깊이 1.3m</li>
                <li>요금 : 성인 60,000원, 소인 50,000원</li>
                <li>투숙객 요금:성인 30,000원 , 3세 ~ 13세 20,000원 (여름 성수기(7~8월) 성인 40,000원, 3세 ~ 13세 30,000원)</li>
                <li>명시된 요금은 1일 이용 기준 입니다.</li>
                <li>시즌 및 상품에 따라 요금인 상이할 수 있습니다.</li>
                <li>구명조끼 대여 가능(수량제한으로 선착순 제공)하며, 수영복 대여 서비스는 제공되지 않습니다.</li>
                <li>모든 고객의 안전을 위해 튜브 및 물놀이 기구 사용을 금합니다.(유아용 퍼들 점퍼 및 목튜브 이용은 가능합니다.)</li>
                <li>쾌적한 환경을 위하여 음식물 반입, 흡연, 오일 사용을 금하고 있습니다.</li>
            </ul>
        </div>
        <hr>

        <!-- 조식 정보 -->
        <div class="info-table break-fast static-item">
            <h1>조식 정보
                <span>*조식 요금 현장 결제 필요</span>
            </h1>
            <div class="info-item">
                <table>
                    <tbody>
                        <tr>
                            <td>유아(4~7세 이하)</td>
                            <td>
                                <span>10,000원</span>
                            </td>
                        </tr>
                        <tr>
                            <td>소아(8~13세 이하)</td>
                            <td>
                                <span>13,000원</span>
                            </td>
                        </tr>
                        <tr>
                            <td>성인(14세 이상)</td>
                            <td>
                                <span>25,000원</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <ul>
                    <li>나이는 한국나이 기준이며, 업체 사정에 의해 변경될 수 있습니다.</li>
                    <li>사회적 거리두기 단계에 따라 이용장소가 변경될 수 있습니다.</li>
                    <li>장소 : 1층 쉘팩토리</li>
                    <li>이용시간 : 07:00 ~ 10:30 조식뷔페</li>
                    <li>**코로나19 사회적 거리두기로 호텔에서 제공하는 조식이 도시락 단품으로 변경 될 수 도 있습니다.</li>
                </ul>
        </div>
        <hr>

        <!-- 취소 및 환불 규정-->
        <div class="padding-wrapper">
            <div class="static-item">
                <h1>취소 및 환불 규정</h1>
                <ul class="lists">
                    <li>환불 정책(기본)</li>
                    <li>투숙일 2일전 17:00 ~ 투숙일 당일까지: 환불불가</li>
                    <li>투숙일 3일전 17:00 ~ 투숙일 2일전 16:59 까지: 50% 환불</li>
                    <li>투숙일 4일전 17:00 ~ 투숙일 3일전 16:59 까지: 70% 환불</li>
                    <li>투숙일 4일전 16:59 까지 무료취소</li>
                    <li>취소가능일은 달력일 (주말 및 공휴일 포함)기준으로 산정됩니다.</li>
                </ul>
            </div>
        </div>
        <hr>
        <!-- 확인사항-->
        <div class="padding-wrapper">
            <div class="static-item">
                <h1>확인사항</h1>
                <ul class="lists">
                    <li>'체크인 시 배정'의 경우 특정 객실과 베드타입을 보장하지 않습니다.</li>
                    <li>상기 이미지와 다른 객실로 배정될 수 있으며, 객실 전망은 보장하지 않습니다.</li>
                </ul>
            </div>
        </div>
        <hr>
        <!-- 판매자 정보-->
        <a href="${cpath }/sellerInformation/${map.dto.ho_name}/">
            <div class="seller-info-box">
                <p>판매자 정보</p>
            </div>
        </a>
        
        <!-- 무엇을 도와드릴까요?-->
        <div class="padding-wrapper">
            <div class="councierge">
                <h4 class="detail-title">무엇을 도와드릴까요?</h4>
                <div class="help-text">호텔자바 고객센터가 친절하고 신속하게 답변해드려요.</div>
                <div class="help-time">상담시간: 오전 9시 ~ 익일 새벽 3시</div>
                <div class="help-inquiry">
                    <img src="https://cdn.dailyhotel.com/ux/icon-detail-ops-help.svg" alt="고객센터 문의하기">
                    000-0000-0000
                </div>
            </div>
        </div>
	<!-- 페이지 맨 밑부분 공백 -->
        <div style="height: 50px;"></div>
    </div>


    <script type="text/javascript" src="${cpath }/resources/js/calendar.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script>


        // 더보기 눌렀을 때 글 나오게하기
        const showBtn = document.querySelector('.show-more-btn');
       
        const unvisible = document.querySelectorAll('.unvisible');

        showBtn.onclick = function (){
            unvisible.forEach((ele) => {
                ele.classList.remove('more-enter-done');
                showBtn.innerHTML = '';
            })
        }


        // 객실 사진 슬라이드
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 3000); // 3초마다 이미지 바뀜
        }

    </script>

    
    <script>
        // 모달창을 이용한 아래에서 위로
        $('.js-click-modal').click(function(){
        $('.container').addClass('modal-open');
        });

        $('.js-close-modal').click(function(){
        $('.container').removeClass('modal-open');
        });
    </script>
      <script>
	      // 모달창 리뷰
      $( document ).ready(function() {
    	  $('.trigger').on('click', function() {
    	     $('.modal-wrapper-review').toggleClass('open');
    	    $('.page-wrapper-review').toggleClass('blur-it');
    	     return false;
    	  });
    	});
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script>
	 // 예약 모달창
		 const reservationBtn = document.getElementById('reservation-modal-Btn');
		 const reservation_modal = document.querySelector('.reservation_modal');
		 const reservation_modal_overlay = document.querySelector('.reservation_modal_overlay');
		
		 reservationBtn.onclick = function ()  {
			 reservation_modal.classList.remove('hidden');
			 posY = $(window).scrollTop();
			 $("html, body").addClass("not_scroll");
		 }
		 
		 reservation_modal_overlay.onclick = function() {
			 reservation_modal.classList.add('hidden');
			 $("html, body").removeClass("not_scroll");
			 posY = $(window).scrollTop(posY);
		 }
    </script>

<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

   <script >
	// 예약 달력
	flatpickr.localize(flatpickr.l10ns.ko);
	

	 var dataSelector = document.querySelector('.dataSelector');
	 dataSelector.flatpickr( {
	    mode: "range",
	    dateFormat: "Y-m-d",
	    minDate: "today",
	    local:'ko'
	
	});
 </script>

</body>
</html>
