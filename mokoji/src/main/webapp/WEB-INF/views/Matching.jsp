<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>


<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Template Mo">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">

<title>매칭</title>

<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet"
   href="././resources/style/templatemo-edu-meeting.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/Matching.css">
<link rel="stylesheet" href="././resources/style/googlechart.css">

   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
   // Google Visualization API 스크립트 로드
   google.load('visualization', '1.0', {'packages':['corechart']});

   // Google Visualization API 로드 후 콜백 함수 지정
   google.charts.setOnLoadCallback(drawChart);

   // 차트를 그리는 함수
   function drawChart() {
       var btnModalList = document.querySelectorAll(".btn_modal");
       
       for (var i = 0; i < btnModalList.length; i++) {
           btnModalList[i].addEventListener('click', function() {
               var winCount = this.previousElementSibling.value;
               var lostCount = this.previousElementSibling.previousElementSibling.value;
               var winning = this.previousElementSibling.previousElementSibling.previousElementSibling.value;

               
               
               var data = new google.visualization.DataTable();
               data.addColumn('string', 'Topping');
               data.addColumn('number', 'Slices');
               data.addRows([
                   ['승', parseInt(winCount)],
                   ['패', parseInt(lostCount)],
               ]);

               var options = {
                   'width': 400,
                   'height': 300,
                   vAxis: {title: 'number'},
                   hAxis: {title: 'number'},
                   animation: {
                       duration: 1000,
                       easing: 'in',
                      startup: true
                }
               };

               var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
               chart.draw(data, options);
               
               var percent = 0;
               var handler = setInterval(function(){
                   // values increment
                   percent += 1;
                   // apply new values
                   data.setValue(0, 1, percent);
                   data.setValue(1, 1, 100 - percent);
                   // update the pie
                   chart.draw(data, options);
                   // check if we have reached the desired value
                   if (percent > parseInt(winning))
                       // stop the loop
                       clearInterval(handler);
               }, 30);
               
           });
       }
   }
   
   </script>



</head>

<body>
   <%@ include file="main/header.jsp"%>



   <section class="match-page header-text" id="top">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <h2>매칭</h2>
            </div>
         </div>
      </div>
   </section>


   <section class="meetings-page" id="meetings">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="filters">
                        <ul>
                           <li data-filter=".15">축구</li>
                           <li data-filter=".10">야구</li>
                           <li data-filter=".28">농구</li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="row grid">
                        <c:forEach items="${ matchList }" var="matchList">

                           <div
                              class="col-lg-4 templatemo-item-col all ${matchList.CTMID_CODE}">
                              <div class="meeting-item">
                                 <div class="thumb">
                                    <img class="img" src="././resources/images/${matchList.CLUB_RPIC}">
                                 </div>
                                 <div class="down-content">
                                    <form action="joinmatch.do">
                                       <input type="hidden" value="${matchList.MAT_CODE}" name="mat_code">
                                       <input type="hidden" value="${matchList.CLUB_CODE}" name="club_code" />
                                       <input type="hidden" value="${memctmid_code}" name="memct_code">
                                       <h4>${ matchList.MAT_NAME }</h4>
                                       <div>동호회 명 : ${ matchList.CLUB_NAME }</div>
                                       <fmt:formatDate var="newFormattedDateString" value="${ matchList.MAT_DATE }" pattern="yyyy-MM-dd"/>
                                       <div>희망 매칭 날짜 : ${ newFormattedDateString }</div>
                                       <div>희망 매칭 시간 : ${ matchList.MAT_TIME }</div>
                                       <c:if test="${ memctmid_code == 15 and matchList.CTMID_CODE == 15 }">
                                          <button type="submit" class="matching-button-red">참가하기</button>
                                       </c:if>
                                       <c:if test="${ memctmid_code == 10 and matchList.CTMID_CODE == 10 }">
                                          <button type="submit" class="matching-button-red">참가하기</button>
                                       </c:if>
                                       <c:if test="${ memctmid_code == 28 and matchList.CTMID_CODE == 28 }">
                                          <button type="submit" class="matching-button-red">참가하기</button>
                                       </c:if>
                                    <input type="hidden" value="${matchList.WINNING}" class="winning" ></input>
                                    <input type="hidden" value="${matchList.LOSTCOUNT}" class="matchlost" ></input>
                                    <input type="hidden" value="${matchList.WINCOUNT}" class="matchwin" ></input>
                                    
                                    <button type="button" class="btn_modal winning-button-blue" data-bs-toggle="modal" data-bs-target="#exampleModal">승률보기</button>
                                    </form>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                       aria-labelledby="exampleModalLabel" aria-hidden="true">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">승률</h5>
                                                <button type="button" class="btn-close"
                                                   data-bs-dismiss="modal" aria-label="Close"></button>
                                             </div>
                                             <div class="modal-body">
                                                <div id="chart_div"></div>
                                             </div>
                                             <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                   data-bs-dismiss="modal">닫기</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>


                                 </div>
                              </div>
                           </div>

                        </c:forEach>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>




      <%@ include file="main/footer.jsp"%>
   </section>



   <!-- Scripts -->
   <!-- Bootstrap core JavaScript -->
   <!--Load the AJAX API-->
   <script src="././resources/vendor/jquery/jquery.min.js"></script>
   <script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!--Load the AJAX API-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


   
   <script src="././resources/js/isotope.min.js"></script>
   <script src="././resources/js/owl-carousel.js"></script>
   <script src="././resources/js/lightbox.js"></script>
   <script src="././resources/js/tabs.js"></script>
   <script src="././resources/js/isotope.js"></script>
   <script src="././resources/js/video.js"></script>
   <script src="././resources/js/slick-slider.js"></script>
   <script src="././resources/js/custom.js"></script>
   <script src="././resources/js/logOut.js"></script>
   




</body>

</html>