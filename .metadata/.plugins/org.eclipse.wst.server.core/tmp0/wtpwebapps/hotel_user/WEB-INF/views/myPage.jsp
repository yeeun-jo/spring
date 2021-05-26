<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!-- 현재날짜 -->
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 

<c:set var="cpath" >${pageContext.request.contextPath }</c:set>

<link rel="stylesheet" href="${cpath }/resources/css/myPage.css">

<style>
  .review_rating{width: 100%; height:30px; overflow: hidden; margin: 0 auto; }
  .rating {display: inline-block;}
  .rating > input {display: none; margin: 0 5px;}
  .rating > label:before {display: inline-block; content: "\f005"; background: url('${cpath}/resources/img/i_star_off.png') 0 0 no-repeat; width:30px; height:30px; color:rgba(0,0,0,0); background-size: 30px;}
  .rating > input[type="radio"] + label {color: #999; float: right; margin: 0 5px;}
  .rating > input:checked ~ label{content: "\f005"; display: inline-block; background: url('${cpath}/resources/img/i_star_on.png'); width:30px; height:30px; padding: 0; background-size: 30px; z-index: 5;}
  .rating > input:checked ~ label:before {background:none;}
</style>

<body>
    
<div class="myPage">
	<!-- 정보 표시 -->
	
	<!-- 로그인 정보 -->
	<div class="myPage_loginO">
		<h2>개인정보</h2>
		<div class="myPage_loginO_content">
			<div class="">
				<h3>이름</h3>
			</div>
			<div class="">
				<h4>${login.cu_name }</h4>
			</div>
		</div>
		<div class="myPage_loginO_content">
			<div class="">
				<h3>생년월일</h3>
			</div>
			<div class="">
				<h4>${login.cu_birthYear }. ${login.cu_birthMonth }. ${login.cu_birthDay }</h4>
			</div>
		</div>
		<div class="myPage_loginO_content">
			<div class="">
				<h3>성별</h3>
			</div>
			<div class="">
				<h4>${login.cu_gender }</h4>
			</div>
		</div>
		<div class="myPage_loginO_content">
			<div class="">
				<h3>이메일</h3>
			</div>
			<div class="">
				<h4>${login.cu_email }</h4>
			</div>
		</div>
		<div class="myPage_loginO_content">
			<div class="">
				<h3>전화번호</h3>
			</div>
			<div class="">
				<h4>${login.cu_pnum }</h4>
			</div>
		</div>
	</div>

	
	<!-- 예약 내역 -->
	<div class="reservation">
		<h2>예약내역</h2>
 		<!-- 예약 내역이 있을 때 -->
		<c:if test="${not empty reservationList }">
		<table>
			<tr style="height: 40px;">
				<th style="width: 110px;">예약날짜</th>
				<th style="width: 110px;">체크인</th>
				<th style="width: 110px;">체크아웃</th>
				<th style="width: 160px;">호텔명</th>
				<th style="width: 90px;">예약자</th>
				<th style="width: 100px;">결제금액</th>
				<th style="width: 100px;">취소여부</th>
				<th></th>
			</tr>

			<c:forEach var="list" items="${reservationList }">
				<input type="hidden" value="${list.re_idx }">				
				<tr class="re_list" style="height: 50px; text-align: center;">
					<td>
						<c:set var="re_paydate" value="${list.re_paydate }" />
						${fn:substring(re_paydate,0,10) }
					</td>
					<td id="re_indate${list.re_idx }">
						<c:set var="re_indate" value="${list.re_indate }" />
						${fn:substring(re_indate,0,10) }
					</td>
					<td id="re_outdate${list.re_idx }">
						<c:set var="re_outdate" value="${list.re_outdate }" />
						${fn:substring(re_outdate,0,10) }
					</td>
					
					<td id="ho_name${list.re_idx }">${list.ho_name }</td>
					<td>${list.cu_name }</td>
					<td>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.re_payment }" />
					</td>
					<td id="re_cancelYesOrNo">${list.re_cancelYesOrNo }</td>
					<td><button style="width: 50px; height: 30px; background-color:#74b9ff; " class="reviewBtn" ${list.re_cancelYesOrNo == 'N' && date > re_outdate ? "" : "disabled" }>리뷰</button></td>
					<td><input style="background-color:#fd79a8; height: 30px;" class="cancelBtn" id="${list.re_idx}"
						type="button" name="re_cancelYesOrNo" value="취소" ${list.re_cancelYesOrNo == 'N' && list.canTime > 1 ? "" : "disabled" }  ${date > re_outdate ? "disabled" : "" } onclick="changeValue('${list.re_idx}')"></td>
				</tr>
			</c:forEach>
		</table>
			
		</c:if>
		
		<!-- 예약 내역이 없을 때 -->
		<c:if test="${empty reservationList }">
			<div class="">
				<h4 style="text-align: center;">예약 내역이 없습니다.</h4>
			</div>
		</c:if>
	</div>
</div>

<!-- 리뷰 버튼 눌렀을 때 리뷰작성 창 뜨기 -->
<div class="review_modal hidden">
        <div class="review_modal_overlay"></div>   <!--나머지 배경 어둡게 만드는 영역-->
        <div class="review_modal_content" style="border-radius: 30px; width: 400px;">         <!--표시하고 싶은 내용-->
        
            <form id="reviewForm" method="POST">
	            <input type="hidden" name="review_cu_id" value="${login.cu_id }">
	            <input class="re_idx" type="hidden" name="review_re_idx">
	            <div style="margin: 10px 0 10px 0;">
			<div style="display: flex; justify-content: space-between;">
				<div style="width: 100%; ">
		                	<div class="modal_ho_name" style="margin: 10px;"></div>
		                	<div class="modal_date" style="margin: 10px;"></div>
		           	</div>
			 </div>
	            </div>
	            <div style="font-weight: bold; margin: 10px;">호텔은 만족스러우셨나요?
		    	<div class="review_rating" style="margin: 10px;">
				<div class="rating">
					<input type="radio" id="rating_1_star5" name="review_score" value="5"><label for="rating_1_star5"></label>
					<input type="radio" id="rating_1_star4" name="review_score" value="4"><label for="rating_1_star4"></label>
				    <input type="radio" id="rating_1_star3" name="review_score" value="3"><label for="rating_1_star3"></label>
					<input type="radio" id="rating_1_star2" name="review_score" value="2"><label for="rating_1_star2"></label>
					<input type="radio" id="rating_1_star1" name="review_score" value="1"><label for="rating_1_star1"></label>
				</div>
			</div>
		    </div>
	            <div class="modal_date2" style="margin: 10px;"></div>
	            <div class="modal_ho_name2" style="font-weight:bold; margin: 10px;"></div>
	            
	            <div style="margin: 10px 0 10px 0;">
	                <label><input type="radio" name="review_goodORbad" value="만족">만족</label>
	                <label><input type="radio" name="review_goodORbad" value="불만족">불만족</label>
	            </div>
	
	            <div>
	                <div style="font-size: 16px; font-weight:bold; margin: 10px;">후기</div>
	                <div>이용후기를 솔직하게 작성하여</div>
	                <div>다른 고객님들의 선택을 도와주세요!</div>
	            </div>    
	            <p><textarea name="review_opinion" cols="35" rows="5" style="resize: none;" required></textarea></p>
	            <p><input type="submit" value="작성완료"></p>
            </form>
        </div>
    </div>




<script type="text/javascript">
	const cpath = '${cpath}';
	
	const reviewBtn = document.querySelectorAll('.reviewBtn');
	const review_modal = document.querySelector('.review_modal');
   	const closeBtn = document.getElementById('closeBtn');
	const modal_ho_name = document.querySelector('.modal_ho_name');
	const modal_ho_name2 = document.querySelector('.modal_ho_name2');
	const modal_date = document.querySelector('.modal_date');
	const modal_date2 = document.querySelector('.modal_date2');
    const reviewForm = document.getElementById('reviewForm');
	const re_idx = document.querySelector('.re_idx');
	const review_modal_overlay = document.querySelector('.review_modal_overlay');
	    	
    // 리뷰 모달창안에 값 넣어주기
    reviewBtn.forEach(ele => {
    	ele.onclick = (event) => {
    		review_modal.classList.remove('hidden');
    		const idx = event.target.parentNode.parentNode.previousElementSibling.value;
			const name = document.getElementById('ho_name'+ idx).innerText;
			const indate = document.getElementById('re_indate'+idx).innerText;
			const outdate = document.getElementById('re_outdate'+idx).innerText;
			re_idx.value = idx;
			modal_ho_name.innerText = name;
			modal_ho_name2.innerText = name +'은/는 어떠셨나요?';
			modal_date.innerText = indate + ' ~ ' + outdate;
			modal_date2.innerText = indate + ' ~ ' + outdate +'에 이용하신';
			const footer = document.querySelector('.footer-fixed');
			footer.style.backgroundColor = '#666666';
			footer.style.borderTop = 'none';
    	}
    }) 

    // ajax
   reviewForm.onsubmit = function(event){
    	event.preventDefault();
		const formData = new FormData(reviewForm);
		const ob = {};
		
		for(const [key,value] of formData.entries()){
			ob[key] = value;
			console.log(ob);
		}
		
		const url = cpath + '/myPage';
		const opt = {
				method : 'POST',
				body : JSON.stringify(ob),
				headers : {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1){
				alert('리뷰가 등록되었습니다');
				location.href= cpath;
			} else if(text == -1 ){
				  alert('이미 등록하신 리뷰입니다.');
				  location.href = "myPage";
			  }
		})
    }
	

    review_modal_overlay.onclick = function() {
    	review_modal.classList.add('hidden');
	const footer = document.querySelector('.footer-fixed');
	footer.style.backgroundColor = 'rgb(255, 255, 255)';
	footer.style.borderTop = '1px solid rgb(231, 231, 231)';  
    }
	

</script>
<script type="text/javascript">
 	//예약 취소
	
	function changeValue(id) {
			  if(confirm('정말 취소하시겠습니까 ???') == true){
		var box = document.getElementById(id);
		console.log(id);

		const url =  cpath + '/myPage/' + id + "/";
		const opt = {
				method: 'POST', 
				headers : {
					'Content-Type' : 'application/json;charset-utf8'
				}
		};
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			console.log('text : ',text)
			if(text == 1) {
			  box.readOnly = true;	
				  location.href = "myPage";
			} else if(text == -1){
				alert('이미 이용하신 객실입니다 !!');
			}
		});
		  }
		
	}
</script>
</body>
</html>
