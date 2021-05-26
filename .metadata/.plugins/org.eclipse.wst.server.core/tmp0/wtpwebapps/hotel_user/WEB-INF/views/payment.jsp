<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>   
<link rel="stylesheet" href="${cpath }/resources/css/payment.css" > 
</head>

<style>
	.wrap{
	    width: 100%;
	    position: relative;
	}
	
	.wrap2{
	    width: 100%;
	    position: relative;
	}
	.wrap-in{ 
	    width: 1200px;
	    margin: 0 auto;
	}
	.agree_daddy2 {
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
	.agree_mom2 {
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
	
	.agree_x2 {
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
	hidden {
		display: none;
	}
</style>

<body>
<div class="paymentMainDiv">

		<div class="payHeader">
			<div><a href="javascript:history.back();"><img src="${cpath }/resources/img/arrow.jpg"></a></div>
        	<div class="payment">결제하기</div>
        </div>
        <div class="nameInsert">
            <div class="hotelName">${map.roomList.ro_ho_name}</div>
            <div>${map.roomList.ro_roomtype}</div>
        </div>

        <div class="checkInOutDiv">
            <div class="checkInOutDiv_div">
                <div class="checkInOut" >체크인</div>
                <div>${map.dayStart } ${map.roomList.ho_check_in }</div>
            </div>

            <div>
                <div class="checkInOut">체크아웃</div>
                <div>${map.dayEnd } ${map.roomList.ho_check_out }</div>
            </div>
        </div>

        <div class="reservationInfo">
            <div class="infoDiv">
                <div class="reservationName">예약자 정보</div>
                <div></div>
            </div>

            <div class="infoDiv">
                <div class="personInfo">예약자명</div>
                <div>${login.cu_name }</div>
            </div>

            <div class="infoDiv">
                <div class="personInfo">연락처</div>
                <div>${login.cu_pnum }</div>
            </div>

            <div class="infoDiv" >
                <div class="personInfo">이메일</div>
                <div>${login.cu_email }</div>
            </div>
        </div>

            <div class="otherPerson">
                <input type="checkbox">
                <div>예약자와 투숙자가 다를 경우 체크해주세요.</div>
            </div>

        <div class="howToVisitDiv">
            <div>방문 방법</div>
            <div class="visitSelect">
                <div><button class="howToVisit">도보</button></div>
                <div><button class="howToVisit">차량</button></div>
            </div>
        </div>
        
        <div class="discountMethodSelect">할인수단 선택 및 결제금액</div>

        <div class="discountMethod">
            <div>할인 수단은 중복 사용 할 수 없습니다.</div>

            <div class="infoDiv">
                <div class="couponUse">할인쿠폰 사용</div>            
                <div class="notUse">사용 안함 ></div>
            </div>

            <div class="infoDiv" >
                <div class="couponUse">적립금 사용</div>
                <div class="notUse">보유 : 0원 ></div>
            </div>
        </div>

        <div class="amountOfpayment">
            <div>결제금액</div>
            <div><fmt:formatNumber value="${map.result }" pattern="#,###" />원</div>
        </div>

        <div class="methodOfpayment">결제수단</div>

        <div class="guidance">혜택안내</div>

        <div class="kakaopay">
            <img src="${cpath }/resources/img/kakaopay.jpg">
        </div>
        
        <div class="kakaopayImg">
            <img src="https://cdn.dailyhotel.com/ux/kakaopay-on.svg">
            <div>카카오페이 결제</div>
        </div>

        <div class="paymentInfo">결제 정보</div>

        <div class="infoDiv">
            <div>예약 금액</div>
            <div>(총 ${map.fewDay}박) <fmt:formatNumber value="${map.result }" pattern="#,###" />원</div>
        </div>

        <div class="discount">
            <div class="infoDiv">
                <div>할인 금액</div>
                <div>0원</div>
            </div>
        </div>

        <div class="infoDiv">
            <div>총 결제금액(VAT 포함)</div>
            <div class="totalAmount"><fmt:formatNumber value="${map.result }" pattern="#,###" />원</div>
        </div>

        <div class="rule">취소 규정 및 동의사항</div>

        <div class="guidance">취소 및 환불 규정</div>

        <div class="refundPolicy">
            <ul>
                <li>
                    <span id="cancelDate_span"></span>까지 <span>무료</span>로 예약 취소를 할 수 있는 상품입니다. 이후 예약을 변경하거나 취소할 경우 환불 수수료가 부과될 수 있습니다. 
                </li>
                <li>
                    예약을 계속 진행하시려면 필수사항 동의 후 [결제하기] 버튼을 눌러주세요.
                </li>
            </ul>
        </div>

        <div class="agreeDiv">
            <div>
                <input id="agreeCheck" type="checkbox">
            </div>
            <div class="personal_agree">개인정보 제 3자 제공 동의 (필수)</div>
        </div>

        <button id="paymentBtn">결제하기</button>

    </div>
    
    <div class="payment_modal hidden">
        <div class="payment_modal_overlay"></div>   <!--나머지 배경 어둡게 만드는 영역-->
        <div class="payment_modal_content">         <!--표시하고 싶은 내용-->
            <div class="customerCheck">고객님, 확인하셨나요?</div>
            <ul>
                <li class="modal_li">선택하신 상품의 
                    <span class="modal_span">취소 및 환불 규정을 다시 한번 확인</span>해주시기 바랍니다.
                </li>
                <li class="modal_li">환불 불가 표시 상품의 경우 규정과 상관없이 변경, 취소, 환불이 
                    <span class="modal_span">절대 불가</span>합니다.
                </li>
                <li class="modal_li">'체크인 시 배정'의 경우 베드 타입을 보장하지 않으며 2인이 투숙할 수 있는 객실로 배정됩니다.</li>
                <li class="modal_li">미성년자는 보호자 동반시 투숙 가능합니다.</li>
                <li class="modal_li">취소 규정 등 위 내용에 동의하시면 버튼을 눌러 결제를 진행해 주세요.</li>
            </ul>
            <div class="twoBtn">
                <button id="closeBtn">취소</button>
                <form method="post">
                	<input type="hidden" name="re_indate" value="${map.dayStart }" >
                	<input type="hidden" name="re_outdate" value="${map.dayEnd }" >
                	<input type="hidden" name="re_daycount" value="${map.fewDay }"> 
                	<input type="hidden" name="re_payment" value="${map.result }">
                	<input type="hidden" name="re_calendar_pk" value="${map.roomList.calendar_pk }">
                	<input type="hidden" name="re_cu_id" value="${login.cu_id }">
                	<input type="hidden" name="ad_email" value="${hotelDTO.ad_email }">                 
                	<button type="submit" id="progressBtn" >동의하고 결제 진행</button>
 				</form>	           
            </div>
        </div>
    </div>

	<!-- 개인정보 제 3자 동의 -->
	<div class="wrap2 hidden">
        <!-- 전체 화면 -->
        <div class="wrap-in">
            <!-- 모달부분 -->
            <div class="agree_daddy2">
                <div class="agree_mom2">
                    <div>
                        <div class="agree_div">
                            <div class="agree_div_top">
                                <div class="agree_title">개인정보 제3자 제공 동의</div>
                                <div class="agree_x_button">
                                    <button class="agree_x2"></button>
                                </div>
                            </div>
                            <div class="agree_div_body">
                                <table class="agree_table">
                                    <tbody class="agree_tbody">
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">제공받는자</th>
                                            <td colspan="1" class="agree_td">예약할려는 호텔 이름 (ex 웨스턴 조선 서울)</td>
                                        </tr>
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">제공 목적</th>
                                            <td colspan="1" class="agree_td">예약 구매한 상품 서비스의 제공 및 계약의 이행
                                                <br>(이용자 및 이용정보 확인), 민원 처리 등 소비자 분쟁해결
                                            </td>
                                      </tr>
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">제공 항목</th>
                                            <td colspan="1" class="agree_td">예약번호, 예약자 정보(예약자명, 이메일, 휴대폰번호)
                                                 또는 투숙자 정보(투숙자명, 이메일,휴대폰번호)
                                            </td>
                                        </tr>
                                        <tr rowspan="1" class="agree_tr">
                                            <th colspan="1" class="agree_th">이용 및 보유기간</th>
                                            <td colspan="1" class="agree_td">개인정보 이용목적 달성시 까지
                                                <br>단, 관계법령에 의하여 보존할 필요성이 있는 경우 그 시점까지 보존 후 지체 없이 폐기
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="agree_tfoot">
                                        <td colspan="2">
                                            <em>위 개인정보 제3자 제공 동의를 거부할 수 있으며, 거부할 경우 서비스 이용이 제한됩니다.</em>
                                        </td>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
 		</div>
    </div>
    
    
    
    <script>
    // 취소 날짜 구하기(체크인 하루전)
    const checkIn = '${map.dayStart }';
    
    var cancelDate = new Date(checkIn);
    
	 // 날짜(일) 
	 cancelDate.setDate(cancelDate.getDate()-1)
	 cancelDate = getFormatDate(cancelDate);
	 
	 function getFormatDate(cancelDate){
		    var year = cancelDate.getFullYear();              	//yyyy
		    var month = (1 + cancelDate.getMonth());          	//M
		    month = month >= 10 ? month : '0' + month;  		//month 두자리로 저장
		    var day = cancelDate.getDate();                   	//d
		    day = day >= 10 ? day : '0' + day;          		//day 두자리로 저장
		    return  year + '.' + month + '.' + day;       		//'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
	 
	 const cancelDate_span = document.getElementById('cancelDate_span');
	 cancelDate_span.innerText = cancelDate + '일 16시 59분';
	 
    </script>
    
    
    <script>

		const pAgree = document.getElementById('agreeCheck');
		
		wrap = document.querySelector('.wrap2');
		close = document.querySelector('.agree_x2');
		
		pAgree.onclick = function(){
			if(pAgree.checked){
				wrap.classList.remove('hidden');
			}
		}		
		
		close.onclick = function(){
			wrap.classList.add('hidden');
		}
	</script>

<script>
    const paymentBtn = document.getElementById('paymentBtn');
    const agreeCheck = document.getElementById('agreeCheck');

    const modal = document.querySelector('.payment_modal');
    const closeBtn = document.getElementById('closeBtn');
    const progressBtn = document.getElementById('progressBtn');

    // 결제하기 버튼 눌렀을 때, 개인정보제공 동의 체크 안되어있으면 alert띄우기
    paymentBtn.onclick = function(){
        if(agreeCheck.checked == false){
            alert('개인정보 제 3자 제공 동의에 동의해주세요');
        }
        else{
            modal.classList.remove('hidden');
        }
    }
    closeBtn.onclick = function() {
        modal.classList.add('hidden');
    }
    
    progressBtn.onclick = function(){
        alert('결제가 완료되었습니다.');
        modal.classList.add('hidden');
    }
</script>

</body>
</html>
