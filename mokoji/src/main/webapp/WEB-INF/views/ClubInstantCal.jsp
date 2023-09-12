<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정표</title>
    <link rel="icon" 
      type="image/png" 
      href="https://findicons.com/files/icons/2805/squareplex/512/google_calendar.png">
    
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="{{ asset('css/style.css') }}">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css"
              crossorigin="anonymous">
        

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.2/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        
        <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css"
              integrity="sha512-63+XcK3ZAZFBhAVZ4irKWe9eorFG0qYsy2CaM5Z+F3kUn76ukznN0cp4SArgItSbDFD1RrrWgVMBY9C/2ZoURA=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js'></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"
            integrity="sha512-GDey37RZAxFkpFeJorEUwNoIbkTwsyC736KNSYucu1WJWFK9qTdzYub8ATxktr6Dwke7nbFaioypzbDOQykoRg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%
    String club_code = request.getParameter("club_code");
  
%> 

<style>
    .fc-day-sat {
        color: #3E74C7;
    }
    
    .fc-day-sun {
        color: red;
    }
    .fc-col-header-cell.fc-day-mon {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-tue {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-wed {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-thu {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-fri {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-sat {
    background-color: #33445A;
}

.fc-col-header-cell.fc-day-sun {
    background-color: #33445A; 
}

.fc-col-header-cell.fc-day-mon,
.fc-col-header-cell.fc-day-tue,
.fc-col-header-cell.fc-day-wed,
.fc-col-header-cell.fc-day-thu,
.fc-col-header-cell.fc-day-fri {
    color: white; 
}    

.fc-day-today {
    background-color: #ebf0f7 !important; /* 당일 배경색 */
}

</style>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            	 customButtons: { 
                     myCustomButton: { 
                         text: '일정추가', 
                         click: function(event) {
                           var club_code = "<%=club_code %>"; // 상담사 이름 추출
                           var url = "applyClubInstant.do?club_code=" + encodeURIComponent(club_code);
                           var name = "ReservePopup";
                           var option ="width = 700, height = 700 left = 100, top = 400, location = no";
                           window.open(url,name,option)
                         } 
                     },    
             },

             headerToolbar: {
                 left: 'prev,next today,dayGridMonth',
                 center: 'title',
                 right: 'myCustomButton'
             },
            locale: 'ko',
            
            
            dayCellContent: function(info) {
                var number = document.createElement("a");
                number.classList.add("fc-daygrid-day-number");
                number.innerHTML = info.dayNumberText.replace("일",'');

                
             // 클릭 이벤트 핸들러 함수 작성
                function cellClickHandler(event) {
                    // 여기에 일정 수정을 위한 로직 작성
                    // 예: 특정 날짜의 일정을 수정하기 위한 팝업 창을 띄워주는 등의 동작
                    console.log("날짜 셀 클릭됨:", info.date);
                }

                // HTML 엘리먼트에 클릭 이벤트 핸들러 추가
                number.addEventListener("click", cellClickHandler);
                


            var container = document.createElement("div");
            container.appendChild(number);

                
                if(info.view.type === "dayGridMonth")
                   {
                   return{html: number.outerHTML};
                   }
                return{domNodes:[number]};   
                },

              
                   selectable: true,
                   droppable: true,
                   
                   eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                       console.log()
                   },
                   eventAdd: function(info) {
                       // info.event.title, info.event.start, info.event.end 등의 정보를 활용하여 서버로 데이터 전송
                       // 서버에서 데이터를 처리한 후, 성공적으로 처리되면 아래와 같이 FullCalendar를 업데이트할 수 있습니다.
                       calendar.refetchEvents();
                   },
                   
            // Your calendar configuration options
                   events: [
                       // Iterate over eventList and generate event objects here
                       <c:forEach var="event" items="${clubInstant}">
                       {
                          title: '<c:out value="${event.CINST_NAME}"/>',
                          start: '<c:out value="${event.CINST_DATE}"/>',
                          extendedProps: {
                              cinst_code: '<c:out value="${event.CINST_CODE}"/>', // cinst_code 추가
                              
                          },

                       },
                       </c:forEach>
                   ],
                   eventClick: function(info) {
  
                	   var clickedEventCinstCode = info.event.extendedProps.cinst_code; // 클릭한 이벤트의 memcode

                           
                           var cinst_code = clickedEventCinstCode;
                           var url = "dodo.do?cinst_code=" + cinst_code;
                           var name = "applyClubInstant";
                           var option = "width=1165,height=600,left=100,top=50,location=no";
                           window.open(url, name, option);
                       
                   }

                                    
        });
        
        calendar.render();
    });
</script> cdfrt56
</head>
<body>
   
    <div class="card mb-4 mt-3 p-2">
        <div id='calendar'></div>
    </div>

</body>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.2/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.2/locales-all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>

</html>