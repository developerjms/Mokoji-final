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

<title>My Page</title>

<!-- Bootstrap core CSS -->
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet" href="././resources/style/MyPage.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<!--

TemplateMo 569 Edu Meeting

https://templatemo.com/tm-569-edu-meeting

-->
</head>

<body>

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
								<div class="down-content">
									<input type="hidden" ${ code }>
									<h2 href="MyPage.do">${name}님</h2>

									<c:forEach items="${ myinfo }" var="info">
										<input type="hidden" value="${ info.mem_code }"
											name="mem_code">
										<img src="././resources/images/${ info.mem_fname }">
										<h5>관심사 :</h5>
										<span class="badge bg-secondary">${ info.mem_favorite }</span>
									</c:forEach>
								</div>
								<br> <br> <br>


								<h2 style="color: white;">내 피드</h2>
								<hr class="line" style="color: white;">
								<div id="cardlist">
									<input type="hidden" ${ code }>
									<c:forEach items="${ myclubpane }" begin="0" end="3"
										var="clubPane">
										<input type="hidden" value="${ clubPane.MEM_CODE }"
											name="mem_code">
										<c:if test="${ empty myclubpane  }">
										작성한 게시글이 없습니다.
									</c:if>
										<c:if test="${myclubpane ne null }">
											<div class="cards" id="clubList">
												<div class="card" id="card">
													<div class="card__image-holder">
														<input type="hidden" value="${ clubPane.MEM_CODE }"
															name="mem_code"> <img class="card__image"
															src="././resources/images/${clubPane.CP_RPIC}" />
													</div>
													<div class="card-title">
														<a class="toggle-info btn"> <span class="left"></span>
															<span class="right"></span>
														</a>
														<h2>${clubPane.CP_NAME}</h2>
													</div>
													<div class="card-flap flap1">
														<div class="card-description">${ clubPane.CP_CONTENT }</div>
														<div class="card-flap flap2"></div>
													</div>
												</div>
											</div>
										</c:if>

									</c:forEach>
								</div>

								<br> <br> <br>
								<h2 style="color: white;">내 모임</h2>
								<hr class="line" style="color: white;">
								<div id="cardlist">
									<input type="hidden" ${ code }>
									<c:forEach items="${ myclub }" begin="0" end="3"
										var="myclublist">
										 <form action="details.do">
										<input type="hidden" value="${ myclublist.MEM_CODE }"
											name="mem_code">
										<c:if test="${ empty myclublist  }">
										참여중인 모임이 없습니다.
									</c:if>
										<c:if test="${myclublist ne null }">
											<div class="cards" id="clubList">
												<div class="card" id="card">
													<div class="card__image-holder">
														<input type="hidden" value="${ myclublist.MEM_CODE }"
															name="mem_code"> <img class="card__image"
															src="././resources/images/${myclublist.CLUB_RPIC}" />
													</div>
													<div class="card-title">
														<a class="toggle-info btn"> <span class="left"></span>
															<span class="right"></span>
														</a>
														<h2>${myclublist.CLUB_NAME}</h2>
													</div>
													<input type="hidden" value="${myclublist.CLUB_CODE}" name="club_code">
													<div class="card-flap flap1">
														<div class="card-description">${ myclublist.CLUB_INTRO }</div>
														<div class="card-flap flap2">
														<button type="submit" class="btn"> + 더보기</button>	
														</div>
													</div>
												</div>
											</div>
										</c:if>
										</form>
									</c:forEach>
								</div>


								<br> <br>
								<h2 style="color: white;">내 소셜링</h2>
								<hr class="line" style="color: white;">
								<div id="cardlist">
									<input type="hidden" ${ code }>
									<c:forEach items="${ mysocialing }" begin="0" end="3" var="mysocialing">
									<form action="gosocialdetails.do">
										<input type="hidden" value="${ mysocialing.MEM_CODE }"
											name="mem_code">
										<c:if test="${ empty mysocialing  }">
										참여중인 모임이 없습니다.
									</c:if>
										<c:if test="${mysocialing ne null }">
											<div class="cards" id="clubList">
												<div class="card" id="card">
													<div class="card__image-holder">
														<input type="hidden" value="${ mysocialing.MEM_CODE }"
															name="mem_code"> <img class="card__image"
															src="././resources/images/${mysocialing.SOCIAL_RPIC}" />
													</div>
													<div class="card-title">
														<a class="toggle-info btn"> <span class="left"></span>
															<span class="right"></span>
														</a>
														<h2>${mysocialing.SOCIAL_NAME}</h2>
													</div>
													<input type="hidden" value="${mysocialing.SOCIAL_CODE}", name="social_code" />
													<div class="card-flap flap1">
														<div class="card-description">${ mysocialing.SOCIAL_CONTENT }</div>
														<div class="card-flap flap2"></div>
														<button type="submit" class="btn"> + 더보기</button>	
													</div>
												</div>
											</div>
										</c:if>
									</form>
									</c:forEach>
								</div>


								<br> <br>
								<h2 style="color: white;">내 챌린지</h2>
								<hr class="line" style="color: white;">
								<div id="cardlist">
									<input type="hidden" ${ code }>
									<c:forEach items="${ mychallenge }" begin="0" end="3"
										var="mychallenge">
										<input type="hidden" value="${ mychallenge.MEM_CODE }"
											name="mem_code">
										<c:if test="${ empty mychallenge  }">
										참여중인 모임이 없습니다.
									</c:if>
										<c:if test="${mychallenge ne null }">
											<div class="cards" id="clubList">
												<div class="card" id="card">
													<div class="card__image-holder">
														<input type="hidden" value="${ mychallenge.MEM_CODE }"
															name="mem_code"> <img class="card__image"
															src="././resources/images/${mychallenge.CHALL_RPIC}" />
													</div>
													<div class="card-title">
														<a class="toggle-info btn"> <span class="left"></span>
															<span class="right"></span>
														</a>
														<h2>${mychallenge.CHALL_NAME}</h2>
													</div>
													<div class="card-flap flap1">
														<div class="card-description">${ mychallenge.CHALL_CONTENT }</div>
														<div class="card-flap flap2"></div>
													</div>
												</div>
											</div>
										</c:if>

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
