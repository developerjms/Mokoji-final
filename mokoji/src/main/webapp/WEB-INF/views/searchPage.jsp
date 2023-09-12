<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Search Page</title>

<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet" href="././resources/style/MyPage.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/searchPage.css">
<!--

TemplateMo 569 Edu Meeting

https://templatemo.com/tm-569-edu-meeting

-->
</head>

<%@ include file="main/header.jsp"%>




<section class="heading-page header-text" id="top">
	<div class="container">
		<div class="row"></div>
		<h1 style="color: white;">마이페이지</h1>
	</div>
</section>

<section class="meetings-page" id="meetings">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-12">
						<div class="meeting-single-item">
							<h2 style="color: white;">동호회 검색 결과</h2>
							<hr class="line" style="color: white;">


							<div id="cardlist">
								<c:forEach items="${clubLocList}" var="clubLoc">
									<form action="details.do">
										<div class="cards" id="clubList">
											<div class="card" id="card">
												<div class="card__image-holder">
													<input type="hidden" name="club_code" value="${ clubLoc.CLUB_CODE }">
													<img class="card__image" src="././resources/images/${clubLoc.CLUB_RPIC}" />
												</div>
												<div class="card-title">
													<a href="#" class="toggle-info btn">
														<span class="left"></span>
														<span class="right"></span>
													</a>
													<h2>${clubLoc.CLUB_NAME}
														<small>전체${clubLoc.CLUB_MEMTOT}</small>
														<small>가입한애들${clubLoc.CLUB_LEFT}</small>
														<small>남은자리${clubLoc.CLUB_MEMTOT - clubLoc.CLUB_LEFT}</small>
													</h2>
												</div>
												<c:if test="${ clubLoc.MIC_LIKES == 1 }">
													<div id="heart" class="heart is-active" value="${clubLoc.CLUB_CODE}"></div>
												</c:if>
												<c:if test="${ clubLoc.MIC_LIKES != 1 }">
													<div id="heart" class="heart" value="${clubLoc.CLUB_CODE}">
													</div>
												</c:if>
												<div class="card-flap flap1">
													<div class="card-description">${ clubLoc.CLUB_INTRO }</div>
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


							<br> <br> <br>
							<div id="cardlist">
								<c:forEach items="${clubCtList}" var="clubCate">
									<form action="details.do">
										<div class="cards" id="clubList">
											<div class="card" id="card">
												<div class="card__image-holder">
													<input type="hidden" name="club_code" value="${ clubCate.CLUB_CODE }">
													<img class="card__image" src="././resources/images/${clubCate.CLUB_RPIC}" />
												</div>
												<div class="card-title">
													<a href="#" class="toggle-info btn">
														<span class="left"></span>
														<span class="right"></span>
													</a>


													<h2>
														${clubCate.CLUB_NAME}
														<small>전체${clubCate.CLUB_MEMTOT}</small>
														<small>가입한애들${clubCate.CLUB_LEFT}</small>
														<small>남은자리${clubCate.CLUB_MEMTOT - clubCate.CLUB_LEFT}</small>
													</h2>
												</div>
												<c:if test="${ clubCate.MIC_LIKES == 1 }">
													<div id="heart" class="heart is-active" value="${clubCate.CLUB_CODE}"></div>
												</c:if>
												<c:if test="${ clubCate.MIC_LIKES != 1 }">
													<div id="heart" class="heart" value="${clubCate.CLUB_CODE}">
													</div>
												</c:if>
												<div class="card-flap flap1">
													<div class="card-description">${ clubCate.CLUB_INTRO }</div>
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


							<h2 style="color: white;">소셜링 검색 결과</h2>
							<hr class="line" style="color: white;">
							<div id="cardlist">
								<c:forEach items="${socialLocList}" var="socialLoc">
									<form action="gosocialdetails.do">
										<div class="cards" id="clubList">
											<div class="card" id="card">
												<div class="card__image-holder">
													<input type="hidden" name="social_code" value="${ socialLoc.SOCIAL_CODE }">
													<img class="card__image" src="././resources/images/${socialLoc.SOCIAL_RPIC}" />
												</div>
												<div class="card-title">
													<a href="#" class="toggle-info btn">
														<span class="left"></span>
														<span class="right"></span>
													</a>


													<h2>
														${socialLoc.SOCIAL_NAME}
														<small>전체${socialLoc.SOCIAL_TOT}</small>
														<small>가입한애들${socialLoc.SOCIAL_LEFT}</small>
														<small>남은자리${socialLoc.SOCIAL_TOT - socialLoc.SOCIAL_LEFT}</small>
													</h2>
												</div>
												<div class="card-flap flap1">
													<div class="card-description">${ socialLoc.SOCIAL_CONTENT }</div>
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
							
								<div id="cardlist">
								<c:forEach items="${socialCtList}" var="socialCate">
									<form action="gosocialdetails.do">
										<div class="cards" id="clubList">
											<div class="card" id="card">
												<div class="card__image-holder">
													<input type="hidden" name="social_code" value="${ socialCate.SOCIAL_CODE }">
													<img class="card__image" src="././resources/images/${socialCate.SOCIAL_RPIC}" />
												</div>
												<div class="card-title">
													<a href="#" class="toggle-info btn">
														<span class="left"></span>
														<span class="right"></span>
													</a>


													<h2>
														${socialCate.SOCIAL_NAME}
														<small>전체${socialCate.SOCIAL_TOT}</small>
														<small>가입한애들${socialCate.SOCIAL_LEFT}</small>
														<small>남은자리${socialCate.SOCIAL_TOT - socialCate.CLUB_LEFT}</small>
													</h2>
												</div>
												<div class="card-flap flap1">
													<div class="card-description">${ socialCate.SOCIAL_INTRO }</div>
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



						</div>
					</div>
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
<script src="././resources/vendor/jquery/jquery.min.js"></script>
<script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="././resources/js/clubTotal.js"></script>
<script src="././resources/js/isotope.min.js"></script>
<script src="././resources/js/owl-carousel.js"></script>
<script src="././resources/js/lightbox.js"></script>
<script src="././resources/js/tabs.js"></script>
<script src="././resources/js/isotope.js"></script>
<script src="././resources/js/video.js"></script>
<script src="././resources/js/slick-slider.js"></script>
<script src="././resources/js/custom.js"></script>
<script src="././resources/js/clubHeartClick.js"></script>
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


</html>