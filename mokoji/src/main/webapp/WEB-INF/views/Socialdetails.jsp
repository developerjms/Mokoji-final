<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>
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

<title>Education - List of Meetings</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">


<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/socialdetails.css">


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
               <h2>소셜링 상세페이지</h2>
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
                           <c:choose>
                              <c:when test="${ memct_code eq 1 }">
                                 <!-- Button trigger modal -->
                                 <li type="button" class="btn" data-bs-toggle="modal"
                                    data-bs-target="#joincurrentModal">승인현황</li>
                                 <li data-filter=".sang" class="active">상세페이지</li>


                              </c:when>

                           </c:choose>
                        </ul>

                     </div>
                  </div>

                  <!-- 승인현황 -->
                  <div class="modal fade" id="joincurrentModal" tabindex="-1"
                     aria-labelledby="ModalLabel" aria-hidden="true">
                     <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h1 class="modal-title fs-5" id="exampleModalLabel">승인현황</h1>
                              <button type="button" class="btn-close"
                                 data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>

                           <div class="modal-body1">
                              <div class="col-lg-12">
                                 <div id="contact">
                                    <div class="row">
                                       <div class="col-lg-12"></div>
                                       <table class="table">
                                          <tr>
                                             <th scope="col"></th>
                                             <th scope="col">아이디</th>
                                             <th scope="col">성별</th>
                                             <th scope="col">나이</th>
                                             <th scope="col">승인</th>
                                             <th scope="col">거절</th>
                                          </tr>

                                          <c:forEach items="${MemSocialList}" var="memclub">
                                             <c:set var="i" value="${i+1}"></c:set>
                                             <tr>
                                                <th scope="row">${i}</th>
                                                <td>${memclub.MEM_ID}</td>

                                                <c:if
                                                   test="${Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '1' or Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '3'}">
                                                   <td>남자</td>
                                                </c:if>

                                                <c:if
                                                   test="${Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '2' or Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '4'}">
                                                   <td>여자</td>
                                                </c:if>

                                                <c:if
                                                   test="${Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '1' or Integer.parseInt(memclub.MEM_JUMIN.charAt(6)) eq '2'}">
                                                   <c:set var="now" value="<%=new java.util.Date()%>" />
                                                   <c:set var="sysYear">
                                                      <fmt:formatDate value="${now}" pattern="yyyy" />
                                                   </c:set>
                                                   <td>${sysYear-(Integer.parseInt(memclub.MEM_JUMIN.substring(0, 2))+1900)+1}</td>
                                                </c:if>
                                                <td>
                                                   <form action="upsocialing.do" method="post">
                                                      <c:forEach items="${ OneSocialList }" var="clist">
                                                         <input type="hidden" name="scoial_code"
                                                            value="${clist.social_code }">
                                                      </c:forEach>
                                                      <input type="hidden" name="socialinfo_code"
                                                         value="${memclub.SOCIALINFO_CODE}" />
                                                      <button class="grant" type="submit" value="승인">승인</button>
                                                   </form>
                                                </td>
                                                <td>
                                                   <form action="upsocialing.do" method="post">
                                                      <c:forEach items="${ OneSocialList }" var="clist">
                                                         <input type="hidden" name="social_code"
                                                            value="${clist.social_code }">
                                                      </c:forEach>
                                                      <input type="hidden" name="socialinfo_code"
                                                         value="${memclub.SOCIALINFO_CODE}" />
                                                      <button class="grant" type="submit" value="거절">거절</button>
                                                   </form>
                                                </td>
                                             </tr>
                                          </c:forEach>
                                       </table>
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">입금확인란</h1>
                                       <table class="table">
                                       <tr>
                                             <th scope="col"></th>
                                             <th scope="col">아이디</th>
                                             <th scope="col">입금확인</th>
                                       </tr>
                                          <c:forEach items="${Socialpay}" var="spay">
                                             <c:set var="i" value="${i+1}"></c:set>
                                             <tr>
                                                <th scope="row">${i}</th>
                                                <td>${spay.MEM_NAME}</td>
                                                <td>
                                                   <form action="upsocialpay.do" method="post">
                                                      <c:forEach items="${ OneSocialList }" var="clist">
                                                         <input type="hidden" name="scoial_code"
                                                            value="${clist.social_code }">
                                                      </c:forEach>
                                                      <input type="hidden" name="socialinfo_code"
                                                         value="${spay.SOCIALINFO_CODE}" />
                                                      <button class="grant" type="submit" value="승인">승인</button>
                                                   </form>
                                                </td>
                                             </tr>
                                          </c:forEach>
                                       </table>
                                       
                                       </table>
                                    </div>
                                 </div>
                              </div>

                           </div>
                        </div>
                     </div>
                  </div>


                  <div class="col-lg-12">
                     <div class="row grid">
                        <section class="contact-us">
                           <form action="socialjoin.do">
                              <div class="templatemo-item-col all sang">
                                 <div class="row">
                                    <div class="col-lg-9 align-self-center">
                                       <div class="row">
                                          <div class="col-lg-12">
                                             <div id="contact" method="post">
                                                <div class="row">
                                                   <c:forEach items="${ OneSocialList }" var="clist">
                                                   	<div class="meeting-single-item">
                                                      <div class="thumb">
                                                         <div class="price">
                                                            <span>${ clist.social_signtype }</span>
                                                            <input type="hidden" name="social_code" value="${ clist.social_code }" />
                                                            <input type="hidden" name="social_signtype" value="${ clist.social_signtype }" />
                                                         </div>
                                                         <div class="date">
                                                            <h6>
                                                               활동지역 <span>${ clist.social_loc }</span>
                                                            </h6>
                                                         </div>
                                                         <div class="person">
																										<h6
																											style="font-size: 13px; text-transform: uppercase; font-weight: 600; color: #a12c2f;">인원수
																										</h6>

																										<span
																											style="display: block; color: #1f272b; font-size: 17px; margin-top: 7px;">${ clist.social_left }/${ clist.social_tot }</span>
																									</div>
                                                         <a href="meeting-details.html"><img
                                                            src="././resources/images/${ clist.social_rpic }"></a>
                                                      </div>
                                                      <div class="down-content">
                                                         <h4>${ clist.social_name }</h4>
                                                          <div class="down-content">
                                                          	<table class="table">
                                                        		<tr>
                                                          		<td style="font-weight:bold;">나이</td>
                                                          		<td style="font-weight:bold;">성별</td>
                                                           		<td style="font-weight:bold;">내용</td>
                                                         		</tr>
                                                           <tr>
                                                              <td> ${ clist.social_maxage }</td>
                                                              <td>${ clist.social_gender }</td>
                                                              <td>${ clist.social_content }</td>
                                                           </tr>
                                          				</table>
										                  </div>
                                                         <div class="col-lg-12"></div>
                                                         <div class="row">
                                                            <div class="col-lg-4">
                                                               <div>
                                                                  <button type="submit">가입하기</button>
                                                               </div>
                           </form>
                     </div>
                  </div>
   </section>
   </div>
   </div>
   </c:forEach>
   </div>
   </div>
   </div>
   </div>
   <%@ include file="main/footer.jsp"%>


   <!-- Scripts -->
   <!-- Bootstrap core JavaScript -->
   <script src="././resources/vendor/jquery/jquery.min.js"></script>
   <script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <script src="././resources/js/socialHeartClick.js"></script>
   <script src="././resources/js/isotope.min.js"></script>
   <script src="././resources/js/owl-carousel.js"></script>
   <script src="././resources/js/lightbox.js"></script>
   <script src="././resources/js/tabs.js"></script>
   <script src="././resources/js/isotope.js"></script>
   <script src="././resources/js/video.js"></script>
   <script src="././resources/js/slick-slider.js"></script>
   <script src="././resources/js/custom.js"></script>
   <script src="././resources/js/Category.js"></script>
   <script src="././resources/js/socialloadimg.js"></script>
   <script src="././resources/js/pidwrite.js"></script>
   <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
</body>

</body>

</html>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="././resources/vendor/jquery/jquery.min.js"></script>
<script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="././resources/js/isotope.min.js"></script>
<script src="././resources/js/owl-carousel.js"></script>
<script src="././resources/js/lightbox.js"></script>
<script src="././resources/js/tabs.js"></script>
<script src="././resources/js/isotope.js"></script>
<script src="././resources/js/video.js"></script>
<script src="././resources/js/slick-slider.js"></script>
<script src="././resources/js/custom.js"></script>
<script src="././resources/js/Category.js"></script>
<script src="././resources/js/socialloadimg.js"></script>
<script src="././resources/js/pidwrite.js"></script>
<script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
   crossorigin="anonymous"></script>
</body>

</body>

</html>