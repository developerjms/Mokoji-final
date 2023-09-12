<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<title>Challenge Details</title>


<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet" href="././resources/style/templatemo-edu-meeting.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/challengedetails.css">


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
               <h2>챌린지 상세페이지</h2>
            </div>
         </div>
      </div>
   </section>
   <section class="meetings-page" id="meetings">
     
                 <div class="col-lg-12">
                                    <div class="row grid">
                                       <section class="contact-us">
                                             <div class="templatemo-item-col all sang">
                                                <div class="row">
                                                   <div class="col-lg-9 align-self-center">
                                                      <div class="row">
                                                         <div class="col-lg-12">
                                                            <div id="contact" method="post">
                                                               <div class="row">
                                                                 <c:forEach items="${ challenge }" var="chlist">
                                                                     <div class="meeting-single-item">
                                                                        <div class="thumb">

                                                                           <div class="date">
                                                                              <h6>활동지역</h6>
                                                                              <span>${chlist.chall_loc}</span>
                                                                           </div>

                                                                           <div class="person">
                                                                              <h6
                                                                                 style="font-size: 13px; text-transform: uppercase; font-weight: 600; color: #a12c2f;">인원수
                                                                              </h6>
									
                                                                              <span style="display: block; color: #1f272b; font-size: 17px; margin-top: 7px;">${ chlist.chall_left }/${ chlist.chall_tot}</span>
                                                                           </div>
                                                                           <img src="././resources/images/${ chlist.chall_rpic }">
                                                                        </div>
                                                                        <div class="down-content">
                                                                           <h5>${ chlist.chall_name }<br><br><br></h5>
                                                                        	<table class="table">
                                                                    		<tr>
                                                                    		<td style="font-weight:bold;">나이</td>
                                                                    		<td style="font-weight:bold;">성별</td>
                                                                    		<td style="font-weight:bold;">내용</td>
                                                                    		</tr>
                                                                           <tr>
                                                                           <td> ${ chlist.chall_age }</td>
                                                                           <td>${ chlist.chall_gender }</td>
                                                                           <td>${ chlist.chall_content }</td>
                                                                           </tr>
                                          									</table>
										                                    </div>
										                                 </div>
										 						<form action="joinChallenge.do" enctype="multipart/form-data">
										 						<c:choose>
																<c:when test="${(chlist.chall_gender eq gender and chlist.chall_tot-chlist.chall_left > 0 and chlist.chall_age+10 > age) or (chlist.chall_gender eq '누구나'  and chlist.chall_tot-chlist.chall_left > 0 and chlist.chall_age+10 > age) or (chlist.chall_age eq 0 and chlist.chall_gender eq gender and chlist.chall_tot-chlist.chall_left > 0) or (chlist.chall_age eq 0 and chlist.chall_gender eq '누구나' and chlist.chall_tot-chlist.chall_left > 0)}">
																<button type="submit" class="btn">가입하기</button>
																</c:when>
																<c:otherwise>
																<button type="button" class="nochall">가입하기</button>
																</c:otherwise>
																</c:choose>
										          						</form>
																</c:forEach>
										                        </section>
                      

                 


						
						   </div>
						   </div>

   </div>
   </div>
   </div>
   </div>
   <%@ include file="main/footer.jsp"%>


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
   <script src="././resources/js/socialpay.js"></script>
   <script src="././resources/js/pidwrite.js"></script>
   <script src="././resources/js/challenge.js"></script>
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
</body>


</body>

</html>