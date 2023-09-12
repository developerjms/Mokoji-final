<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Template Mo">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">

<title>Education - List of Meetings</title>

<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/social.css">
<link rel="stylesheet" href="././resources/style/socialTotal.css">

<script src="././resources/js/clubTotal.js"></script>
<!--

TemplateMo 569 Edu Meeting

https://templatemo.com/tm-569-edu-meeting

-->
</head>

<body>
   <%@ include file="main/header.jsp"%>
   <section class="heading-page header-text" id="top">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <h2>소셜링</h2>
            </div>
         </div>
      </div>
   </section>

   <section class="meetings-page" id="meetings">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 show active">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="filters">
                        <ul>
                           <c:forEach items="${ highcategory }" var="catehigh">

                              <c:choose>
                                 <c:when test="${catehigh.cthigh_name eq '문화'}">
                                    <li data-filter=".${catehigh.cthigh_name}"
                                       class="highcate active">${catehigh.cthigh_name}</li>
                                 </c:when>
                                 <c:otherwise>
                                    <li data-filter=".${catehigh.cthigh_name}" class="highcate">${catehigh.cthigh_name}</li>
                                 </c:otherwise>
                              </c:choose>









                           </c:forEach>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-12" id="mcate">
                     <div class="row grid">
                        <c:forEach items="${ midcategory }" var="catemid">

                           <div
                              class="col-lg-4 templatemo-item-col all ${catemid.cthigh_name}">
                              <div class="meeting-item">
                                 <div class="thumb">
                                    <img src="${catemid.ctmid_pic}" />
                                 </div>

                                 <button class="social" value="${ catemid.ctmid_name }"
                                    onclick="delcontent()">${ catemid.ctmid_name }</button>

                              </div>
                           </div>
                        </c:forEach>

                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>

<div id="cardlist">
         <c:forEach items="${ SocialTotList }" var="sociallist">
         <form action="gosocialdetails.do">
      <div class="cards" id="socialList">
            <div class="card" id="card">
               <div class="card__image-holder">
                  <input type="hidden" name="social_code" value="${sociallist.social_code}">
                  <img class="card__image" src="././resources/images/${sociallist.social_rpic}" />
               </div>
               <div class="card-title">
                  <a href="#" class="toggle-info btn"> <span class="left"></span>
                     <span class="right"></span>
                  </a>
                  <h2>
                     ${sociallist.social_name}
                     <br>
                     <br>
                     
                      <small>  ${sociallist.social_left}/${sociallist.social_tot}</small>
                  </h2>
               </div>
               <div class="card-flap flap1">
                  <div class="card-description">${ sociallist.social_content }</div>
                  <div class="card-flap flap2">
                     <div class="card-actions">
                        <button type="submit" class="btn">가입하기</button>
                     </div>
                  </div>
               </div>
            </div>
            </div>
            </form>
         </c:forEach>

      </div>







      <%@ include file="main/footer.jsp"%>
   </section>


   <!-- Scripts -->
   <!-- Bootstrap core JavaScript -->
   <script src="././resources/vendor/jquery/jquery.min.js"></script>
   <script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="././resources/js/jquery-1.9.1.min.js"></script>

   <script src="././resources/js/socialTotal.js"></script>
   <script src="././resources/js/isotope.min.js"></script>
   <script src="././resources/js/owl-carousel.js"></script>
   <script src="././resources/js/lightbox.js"></script>
   <script src="././resources/js/tabs.js"></script>
   <script src="././resources/js/video.js"></script>
   <script src="././resources/js/slick-slider.js"></script>
   <script src="././resources/js/custom.js"></script>
</body>


</body>

</html>