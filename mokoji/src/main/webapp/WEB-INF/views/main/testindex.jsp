<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Mokoji</title>

    <!-- Bootstrap core CSS -->
    <link href="./././resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="./././resources/style/fontawesome.css">
    <link rel="stylesheet" href="./././resources/style/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="./././resources/style/owl.css">
    <link rel="stylesheet" href="./././resources/style/lightbox.css">
    <link rel="stylesheet" href="./././resources/style/testindex.css">
<!--

TemplateMo 569 Edu Meeting

https://templatemo.com/tm-569-edu-meeting

-->
  </head>

<body>
  <!-- ***** Header Area Start ***** -->
 <%@ include file="header.jsp" %>
  <!-- ***** Header Area End ***** -->

  <!-- ***** Main Banner Area Start ***** -->
  <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="./././resources/images/course-video.mp4" type="video/mp4" />
      </video>

<div class="video-overlay header-text">
          <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <div class="caption">
              <h2>어서오세요 Mokoji입니다!</h2>
             <c:if test="${ name == null }">
              <div class="main-button-red">
                  <div><a href="goSign.do">로그인</a></div>
              </div>
              </c:if>
          </div>
              </div>
            </div>
          </div>
      </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->

  <section class="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="owl-service-item owl-carousel">
          
          
          
        
        
          
          <c:forEach items="${ clubList }" var="index">
            <div class="item">
              <div class="icon">
                <img src="./././resources/images/service-icon-01.png" alt="">
              </div>
              <div class="down-content">
                <h4>${ index.club_name }</h4>
                <p>${ index.club_intro }</p>
              </div>
            </div>
            </c:forEach>
            
            
            
            
            
         
            
          </div>
        </div>
      </div>
    </div>
  </section>

   <section class="upcoming-meetings" id="meetings">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
            <h2>이런 동호회도 있어요!</h2>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="row">
          
          <c:forEach items="${clubList}" var="clist" begin="0" end="11" step="2">
            <div class="col-lg-4">
              <div class="meeting-item">
                <div class="thumb">
                  <div class="price">
                    <span>${clist.club_loc}</span>
                  </div>
                  <img src="./././resources/images/mainmeetpage.jpg" alt="New Lecturer Meeting">
                </div>
                <div class="down-content">
                  <h4>${clist.club_name}</h4>
                  <h6>${clist.club_intro}</h6>                  
                </div>
              </div>
            </div>
         </c:forEach>

          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="apply-now" id="apply">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">           
          <div class="row">
            <div class="col-lg-12">
              <div class="item">
                <h3>모임 신청 하러 가기</h3>
                <p>"새로운 친구들과 함께 재미있는 시간을 보내고 싶다면, 지금 바로 모임 신청을 해보세요! 다양한 관심사와 활동을 즐길 수 있는 모임에서 즐거움과 소통을 만끽할 할 수 있습니다."</p>
                <div class="main-button-red">
                  <div class="scroll-to-section"><a href="#contact">바로 가기!</a></div>
              </div>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="item">
                <h3>챌린지 참여하기</h3>
                <p>"자신의 잠재력을 확인하고 목표를 이루고 싶다면, 챌린지에 도전해보세요! 함께 성장하고 성취를 누릴 수 있는 기회를 놓치지 말고 도전의 첫 걸음을 내딛어 보세요!"</p>
                <div class="main-button-yellow">
                  <div class="scroll-to-section"><a href="#contact">바로 가기!</a></div>
              </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="accordions is-first-expanded">
            <article class="accordion">
                <div class="accordion-head">
                    <span>언제 어디서나, 관심사와 어울리는 동호회를 만나다!</span>
                    <span class="icon">
                        <i class="icon fa fa-chevron-right"></i>
                    </span>
                </div>
                <div class="accordion-body">
                    <div class="content">
                        <p>지금 "언제 어디서나 시간, 장소에 제약받지 말고 편하게 가입하자"의 첫 걸음을 내딛어보세요! 여러분의 관심사와 스케줄에 맞는 동호회를 찾아, 새로운 친구들과 함께 특별한 시간을 만끽해보세요.</p>
                </div>
                </div>
            </article>
            <article class="accordion">
                <div class="accordion-head">
                    <span> 함께 뛰어보자! 단체 대회로 만나는 끼와 열정</span>
                    <span class="icon">
                        <i class="icon fa fa-chevron-right"></i>
                    </span>
                </div>
                <div class="accordion-body">
                    <div class="content">
                        <p>함께 뛰어나보는 단체 대회를 통해 새로운 동료들과 만나고, 관심사를 나누며, 친목과 협력을 강화해보세요. "마음 맞는 팀끼리 단체전 참여해보자"의 즐거움과 성취감을 함께 누려보세요!</p>
                    </div>
                </div>
            </article>
            <article class="accordion">
                <div class="accordion-head">
                    <span>나만의 세상, 다양한 모임을 즐겨보세요</span>
                    <span class="icon">
                        <i class="icon fa fa-chevron-right"></i>
                    </span>
                </div>
                <div class="accordion-body">
                    <div class="content">
                        <p>이제 더 이상 "내가 이 분야에서만 뛰어나야 한다"는 압박을 느끼지 마세요. "망설이지 말고 다양한 모임을 즐기자"의 첫 걸음을 내딛어보세요. 여러분만의 다양한 관심사와 재능을 발견하고, 풍요로운 삶을 누려보세요.</p>
                    </div>
                </div>
            </article>
            <article class="accordion last-accordion">
                <div class="accordion-head">
                    <span>가벼운 만남, 소셜링으로 즐기는 일회성 모임</span>
                    <span class="icon">
                        <i class="icon fa fa-chevron-right"></i>
                    </span>
                </div>
                <div class="accordion-body">
                    <div class="content">
                        <p>이제 "피로와 부담이 적은 가벼운 모임으로 관심사를 공유하자"의 첫 걸음을 내딛어보세요. 소셜링을 통해 새로운 사람들과 만나고, 소소한 즐거움을 함께 나누며, 특별한 순간을 누려보세요.</p>
                    </div>
                </div>
            </article>
            <article class="accordion last-accordion">
              <div class="accordion-head">
                  <span> 포인트로 소소한 선물, 다양한 기프티콘 선물 받자!</span>
                  <span class="icon">
                      <i class="icon fa fa-chevron-right"></i>
                  </span>
              </div>
              <div class="accordion-body">
                  <div class="content">
                      <p>이제 "차곡차곡 얻은 포인트로 다양한 기프티콘 선물 받자"의 기프티콘 교환 서비스를 통해 노력의 결과를 보상받고, 소소한 행복과 만족을 느껴보세요. 자신의 노력이 가치 있다는 것을 확인할 수 있는 특별한 경험을 시작해보세요.</p>
                  </div>
              </div>
          </article>
          <article class="accordion last-accordion">
            <div class="accordion-head">
                <span>정확한 매칭 신뢰 할 수 있는 커뮤니티</span>
                <span class="icon">
                    <i class="icon fa fa-chevron-right"></i>
                </span>
            </div>
            <div class="accordion-body">
                <div class="content">
                    <p>신뢰할 수 있는 후기와 매칭 시스템을 통해, 당신의 관심사와 목적을 위한 동료들과의 만남을 경험해보세요.</p>
                </div>
            </div>
        </article>
        </div>
        </div>
      </div>
    </div>
  </section>

  <section class="our-courses" id="courses">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
            <h2>인기 챌린지</h2>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="owl-courses-item owl-carousel">
          
          
          <c:forEach items="${challengeList}" var="chlist" begin="0" end="12">
            <div class="item">
              <img src="./././resources/images/mainmeetpage1.jpg" alt="">
              <div class="down-content">
                <h4>${chlist.chall_name}<br>${chlist.chall_content}</h4>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="our-facts">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="row">
            <div class="col-lg-12">
              <h2>Mokoji의 현황</h2>
            </div>
            <div class="col-lg-6">
              <div class="row">
                <div class="col-12">
                  <div class="count-area-content">
                    <div class="count-digit">94</div>
                    <div class="count-title">사용 만족도</div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="count-area-content">
                    <div class="count-digit">515</div>
                    <div class="count-title">하루 평균 유입고객</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="row">
                <div class="col-12">
                  <div class="count-area-content new-students">
                    <div class="count-digit">115631</div>
                    <div class="count-title">누적 고객수</div>
                  </div>
                </div> 
                <div class="col-12">
                  <div class="count-area-content">
                    <div class="count-digit">14151</div>
                    <div class="count-title">하루 평균 이용고객</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> 
        <div class="col-lg-6 align-self-center">
          <div class="video">
            <a href="https://www.youtube.com/watch?v=HndV87XpkWg" target="_blank"><img src="./././resources/images/play-icon.png" alt=""></a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="contact-us" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 align-self-center">
          <div class="row">
            <div class="col-lg-12">
              <form id="emailForm" class="gform indexcontact" method="POST" data-email="zxzxssy@gmail.com" 
                        action="https://script.google.com/macros/s/AKfycbzFGGsOaXoSg44jOsjaOwneGc8zA9l4mjeBrdGEi7L_Y41-emQnjhryOlb-xgDfAq-CRQ/exec">
                <div class="row">
                  <div class="col-lg-12">
                    <h2>이메일 보내기</h2>
                  </div>
                  <div class="col-lg-4">
                    <fieldset>
                      <input name="senderName" class="form-control" type="text" id="senderName" placeholder="YOURNAME...*" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-4">
                    <fieldset>
                    <input name="senderEmail" class="form-control" type="text" id="senderEmail" pattern="[^ @]*@[^ @]*" placeholder="YOUR EMAIL..." required="">
                  </fieldset>
                  </div>
                  <div class="col-lg-4">
                    <fieldset>
                      <input name="subject" type="text" class="form-control" id="subject" placeholder="SUBJECT...*" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12">
                    <fieldset>
                      <textarea name="message"  type="text" class="form-control" id="message" placeholder="YOUR MESSAGE..." required=""></textarea>
                    </fieldset>
                  </div>
                      <div style="display:none" class="thankyou_message">
                      
                     </div>
                  <div class="col-lg-12">
                    <fieldset>
                      <button type="submit" id="form-submit" class="button email-button-red">SEND MESSAGE NOW</button>
                    </fieldset>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
          <div class="col-lg-3">
          <div class="right-info">
            <ul>
              <li>
                <span>주식회사 Mokoji</span>
                <br>
                <h6>대표 : 최모씨</h6>
                <br>
                <h6>대표 번호 : 070-000-000</h6>
              </li>
              <li>
                <h6>이메일</h6>
                <span>Mokoji@meeting.edu</span>
              </li>
              <li>
                <h6>주소</h6>
                <span>서울특별시 구로구 구로동 디지털로34길 27 대륭포스트타워 3차</span>
              </li>
              <li>
                <h6>고객센터</h6>
                <span>0000-0000</span>
                <br>
                <h6>(월~금) 오전 9:00 ~ 오후 5:00</h6>
                <h6>주말/공휴일 제외</h6>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  <%@ include file="footer.jsp" %>
  </section>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="./././resources/vendor/jquery/jquery.min.js"></script>
    <script src="./././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="./././resources/js/isotope.min.js"></script>
    <script src="./././resources/js/owl-carousel.js"></script>
    <script src="./././resources/js/lightbox.js"></script>
    <script src="./././resources/js/tabs.js"></script>
    <script src="./././resources/js/video.js"></script>
    <script src="./././resources/js/slick-slider.js"></script>
    <script src="./././resources/js/main.js"></script>
    <script src="./././resources/js/custom.js"></script>
       <script
      src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <script type="text/javascript" src="././resources/js/logOut.js"></script>
   <script src="https://code.jquery.com/jquery-3.4.1.js"
      integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
      crossorigin="anonymous"></script>
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
        
        $(function(){
        	$('#nonSignUp').on('click',function(){
        		alert('로그인 시 이용 가능합니다!');
        	});
        	
        });
        
        
        
        
        (function() {
            // get all data in form and return object
            function getFormData(form) {
               var elements = form.elements;
               var honeypot;

               var fields = Object.keys(elements).filter(function(k) {
                  if (elements[k].name === "honeypot") {
                  honeypot = elements[k].value;
                  return false;
                  }
                  return true;
               }).map(function(k) {
                  if(elements[k].name !== undefined) {
                  return elements[k].name;
                  // special case for Edge's html collection
                  }else if(elements[k].length > 0){
                  return elements[k].item(0).name;
                  }
               }).filter(function(item, pos, self) {
                  return self.indexOf(item) == pos && item;
               });

               var formData = {};
               fields.forEach(function(name){
                  var element = elements[name];

                  // singular form elements just have one value
                  formData[name] = element.value;

                  // when our element has multiple items, get their values
                  if (element.length) {
                  var data = [];
                  for (var i = 0; i < element.length; i++) {
                     var item = element.item(i);
                     if (item.checked || item.selected) {
                        data.push(item.value);
                     }
                  }
                  formData[name] = data.join(', ');
                  }
               });

               // add form-specific values into the data
               formData.formDataNameOrder = JSON.stringify(fields);
               formData.formGoogleSheetName = form.dataset.sheet || "responses"; // default sheet name
               formData.formGoogleSendEmail
                  = form.dataset.email || ""; // no email by default

               return {data: formData, honeypot: honeypot};
            }

            function handleFormSubmit(event) {  // handles form submit without any jquery
               event.preventDefault();           // we are submitting via xhr below
               var form = event.target;
               var formData = getFormData(form);
               var data = formData.data;

               // If a honeypot field is filled, assume it was done so by a spam bot.
               if (formData.honeypot) {
                  return false;
               }

               disableAllButtons(form);
               var url = form.action;
               var xhr = new XMLHttpRequest();
               xhr.open('POST', url);
               // xhr.withCredentials = true;
               xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xhr.onreadystatechange = function() {
                  if (xhr.readyState === 4 && xhr.status === 200) {
                     form.reset();
                     var formElements = form.querySelector(".form-elements")
                     if (formElements) {
                        formElements.style.display = "none"; // hide form
                     }
                     var thankYouMessage = form.querySelector(".thankyou_message");
                     if (thankYouMessage) {
                        thankYouMessage.style.display = "block";
                        alert("메일 전송에 성공했습니다. 확인 후 회신드리겠습니다.");
                     }
                  }
               };
               // url encode form data for sending as post data
               var encoded = Object.keys(data).map(function(k) {
                  return encodeURIComponent(k) + "=" + encodeURIComponent(data[k]);
               }).join('&');
               xhr.send(encoded);
            }

            function loaded() {
               // bind to the submit event of our form
               var forms = document.querySelectorAll("form.gform");
               for (var i = 0; i < forms.length; i++) {
                  forms[i].addEventListener("submit", handleFormSubmit, false);
               }
            };
            document.addEventListener("DOMContentLoaded", loaded, false);

            function disableAllButtons(form) {
               var buttons = form.querySelectorAll("button");
               for (var i = 0; i < buttons.length; i++) {
                  buttons[i].disabled = true;
               }
            }
            })();
        
    </script>
</body>

</body>
</html>