var today = new Date();//오늘 날짜
 
 
function prevClaendar(){//이전 달력
  today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
  buildCalendar();
}
//다음 달력을 오늘을 저장하고 달력에 뿌려줌
function nextCalendar(){
  today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
  
  buildCalendar();
 
}
function buildCalendar(){
  var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
  var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
  var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
  var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
  
  tblCalendarYM.innerHTML = today.getFullYear()+"년 "+(today.getMonth()+1)+"월";
 
  //기존에 테이블에 잇던 달력 내용 삭제
  while(tblCalendar.rows.length >1){
    tblCalendar.deleteRow(tblCalendar.rows.length -1);
  }
 
  var row = null;
  row  = tblCalendar.insertRow();
  var cnt = 0;
 
 
  // 1일이 시작되는 칸을 맞추어줌
  for ( i=0; i < nMonth.getDay(); i++) {
    cell =row.insertCell();
    cnt = cnt + 1;
}

  //달력 출력
  for(i=1; i <= lastDate.getDate(); i++){
    // 밑에 cell를 활용안해서 달력을 넘기면 달력이 제대로 안나옴
    cell =row.insertCell();   // <- row.insertCell();가 1일부터 시작하게 해줌
      
    var newDiv = document.createElement("div"); 
    var newBtn = document.createElement('button');
    var newBr = document.createElement('br');
    newBtn.append(i);
    newBtn.append(newBr);
    cell.appendChild(newBtn);
    
  
 
    newBtn.style.width = "100%";  
    newBtn.style.height = "100%";
    newBtn.style.border = "none";
    newBtn.style.backgroundColor = "#fff";
    newBtn.style.fontSize = "16px";
    newDiv.style.color = "black";
    newDiv.style.fontSize = "10px";
    newDiv.style.width = "40px";
    newDiv.style.marginLeft = "60px";
    newDiv.style.textAlign = "center";
    
   
    
    // 버튼 클릭시 색 변경
    const colorHandler = function(event) {
        event.target.style.color = "#db074a"; 
        event.target.style.backgroundColor = event.target.style.color;
        event.target.style.color = "#fff";
    }

    newBtn.onclick = colorHandler;

        
    if(cnt % 7 == 0){
      cell.style.color = '#c33';
      }
      if(cnt % 7 == 6) {
        cell.style.color = '#2993cc';
        cell.appendChild(newBtn).append("85,000");
      }
      else if(cnt % 7 == 5){
        cell.appendChild(newBtn).append("74,000");
      } else {
        cell.appendChild(newBtn).append("65,000");
      }
      cell.style.fontWeight = 'bold';

      cnt = cnt + 1;
     if (cnt% 7 == 0)  {  //1주=7일
       row = calendar.insertRow();
     
     }
  }

   

  for (let i = 1; i < 7 - lastDate.getDay(); i++) {
    cell =row.insertCell();

    cnt = cnt + 1;
    if (cnt % 7 == 0)    //1주=7일
      row = calendar.insertRow();
  }
 
}