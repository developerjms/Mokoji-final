<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<title>동호회 상세</title>
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
<link rel="stylesheet" href="././resources/style/clubtest.css">
<link rel="stylesheet" href="././resources/style/reply.css">
<script src="https://code.jquery.com/jquery-1.9.1.js" integrity="sha256-e9gNBsAcA0DBuRWbm0oZfbiCyhjLrI6bmqAl5o+ZjUA=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
					<h6>${club.clubname}</h6>
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
											<li type="button" class="btn" data-bs-toggle="modal"
												data-bs-target="#exampleModalToggle">모임피드</li>
											<li data-filter=".sang" class="active">상세페이지</li>
											<li type="button" class="btn btn" data-bs-toggle="modal"
												data-bs-target="#matchingModal">매칭승인현황</li>
											<li type="button" class="btn btn" data-bs-toggle="modal"
												data-bs-target="#matchinginsertModal">매칭생성</li>
										</c:when>

										<c:when test="${ memct_code eq 2 }">
											<li type="button" class="btn" data-bs-toggle="modal"
												data-bs-target="#exampleModalToggle">모임피드</li>
										</c:when>

										<c:when test="${ memct_code eq 0 }">
											<li data-filter=".sang" class="active">상세페이지</li>
										</c:when>

									</c:choose>
								</ul>

							</div>
						</div>


						<!-- Modal -->
						<div class="modal fade" id="matchingModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">매칭승인현황</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">

										<!-- Button trigger modal -->
										<table>
											<table class="table">
												<tr>
													<th scope="col">매칭명</th>
													<th scope="col">동호회명</th>
													<th scope="col">승률</th>
													<th scope="col" colspan="2">확인</th>

												</tr>
												<c:forEach items="${ allmatchList }" var="allmatchList">
													<input type="hidden" value="${ allmatchList.MAT_CODE }"
														name="mat_code">
													<input type="hidden" value="${ allmatchList.WINNING }"
														name="winning">
													<tr>
														<td>${allmatchList.MAT_NAME}</td>
														<td>${allmatchList.CLUB_NAME}</td>
														<td>${allmatchList.WINNING }</td>
														<td>
															<form action="upMatching.do" method="post">
																<c:forEach items="${ oneClubList }" var="clist">
																	<input type="hidden" name="club_code"
																		value="${ clist.club_code }">
																</c:forEach>
																<input type="hidden" name="matinfo_code"
																	value="${allmatchList.MATINFO_CODE}">
																<button type="submit">수락</button>
															</form>
														</td>
														<td>
															<form action="delMatching.do" method="post">
																<c:forEach items="${ oneClubList }" var="clist">
																	<input type="hidden" name="club_code"
																		value="${ clist.club_code }">
																</c:forEach>
																<input type="hidden" name="matinfo_code"
																	value="${allmatchList.MATINFO_CODE}">
																<button type="submit">거절</button>
															</form>
														</td>
													</tr>
												</c:forEach>
											</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
											</div>
											</div>
											</div>
											</div>







											<!-- Modal -->
											<div class="modal fade" id="matchinginsertModal"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5" id="exampleModalLabel">매칭 생성</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<c:forEach items="${ oneClubList }" var="clist">
																<form action="insertMatching.do" method="post">
																	<input type="hidden" value="${clist.club_code}"
																		name="club_code">
																	<div>매칭 이름</div>
																	<br>
																	<input type="text" name="mat_name">
																	<div>매칭 희망 날짜</div>
																	<input type="date" name="mat_date">
																	<div>매칭 희망 시간</div>
																	<input type="time" name="mat_time">
																	<div>인원수 ※최소 3, 최대 인원 수는 30 입니다.</div>
																	<input name="mat_clubmemtot" type="number" min='3'
																		max='30' step='1'>
																	<div class="col-lg-12">
																		<div class="main-button-red">
																			<button type="submit" class="matching-button-red">매칭신청</button>
																		</div>
																	</div>
																</form>
															</c:forEach>



														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
														</div>
													</div>
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
																				<th scope="col">이름</th>
																				<th scope="col">아이디</th>
																				<th scope="col">성별</th>
																				<th scope="col">나이</th>
																				<th scope="col">승인</th>
																			</tr>

																			<c:forEach items="${MemClubList}" var="memclub">
																				<c:set var="i" value="${i+1}"></c:set>
																				<tr>
																					<th scope="row">${i}</th>
																					<td>${memclub.MEM_NAME }</td>
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
																						<form action="upMemClub.do" method="post">
																							<c:forEach items="${ oneClubList }" var="clist">
																								<input type="hidden" name="club_code"
																									value="${clist.club_code }">
																							</c:forEach>
																							<input type="hidden" name="mc_code"
																								value="${memclub.MC_CODE}" />
																							<button class="grant" type="submit" value="승인">승인</button>
																						</form>
																						<form action="delMemClub.do" method="post">
																							<c:forEach items="${ oneClubList }" var="clist">
																								<input type="hidden" name="club_code"
																									value="${clist.club_code }">
																							</c:forEach>
																							<input type="hidden" name="mc_code"
																								value="${memclub.MC_CODE}" />
																							<button class="grant" type="submit" value="거절">거절</button>
																						</form>
																					</td>
																				</tr>
																			</c:forEach>
																		</table>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>



											<!-- 모임피드 -->
											<div class="modal" id="exampleModalToggle" aria-hidden="true"
												aria-labelledby="exampleModalToggleLabel" tabindex="-1">
												<div class="modal-dialog modal-dialog-centered modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5" id="exampleModalToggleLabel">동호회
																게시판</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<c:forEach items="${clubPaneList }" var="clubPane">
																<form method="post" action="insertComment.do">
																	<div class="row">
																		<div class="col-lg-9 align-self-center">
																			<div class="row">
																				<div class="col-lg-12">
																					<div id="contact">
																						<div class="row">
																							<div class="col-lg-120" id="pid"style="margin-left: 95px";>
																								<input type="hidden" name="cp_code"
																									value="${clubPane.CP_CODE }">
																							<img src="././resources/images/${clubPane.MEM_REALFNAME }" id="profile">
																							<div class="name"><h5>${ clubPane.MEM_NAME }</h5></div>
																								<hr class="line">
																								<img
																									src="././resources/images/${clubPane.CP_PIC }">
																								<div class="title">
																								<h5 class="id">${clubPane.CP_NAME }</h5>
																								<hr class="line">
																									<h6 class="content">${clubPane.CP_CONTENT }</h6>
																									<c:choose>
																										<c:when test="${ clubPane.CNT eq 1 }">
																											<div id="heart" class="heart is-active"
																												value="${clubPane.CP_CODE}"></div>
																											<div class="hc"
																												style="bottom: 120px; position: relative; left: 550px;">${clubPane.CP_LIKES}</div>

																										</c:when>
																										<c:otherwise>
																											<div id="heart" class="heart"
																												value="${clubPane.CP_CODE}"></div>

																											<div class="hc"
																												style="bottom: 120px; position: relative; left: 550px;">${clubPane.CP_LIKES}</div>
																										</c:otherwise>
																									</c:choose>
																								</div>



																										<!-- Tab / Collapse Section -->

																										<div class="tab-container">

																											<!-- Tab 1 -->

																											<div class="tab-accordian">
																												<input type="hidden" class="memcode"
																													value="${code }" />
																												<div class="titleWrapper inactive">
																													<h6>댓글 더보기</h6>
																													<div class="collapse-icon">
																														<div class="acc-close"></div>
																														<div class="acc-open"></div>
																													</div>
																												</div>
																									
																												
																												<div id="wrapper" class="desWrapper">
																													<div class="repleupdel" name="${ clubPane.CP_CODE }">
																													
																													</div>
																													<input name="cpreple_content" type="text" class="reple" placeholder="댓글을 입력하세요." required autocomplete="off">
																													<button class="replyinsert" type="button" value="${code }"><img src="././resources/images/send.png"></button>
																													<input type="hidden" class="cpcode" value="${clubPane.CP_CODE }" />
																												</div>
																											</div>
																										</div>
																										<fmt:formatDate var="newFormattedDateString" value="${clubPane.CP_DATE }" pattern="yyyy-MM-dd" />
																								<div class="date1">${ newFormattedDateString }</div>	
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>

																</form>
															</c:forEach>
														</div>
														<div class="modal-footer">
															<button class="btn" data-bs-target="#exampleModalToggle2"
																data-bs-toggle="modal">게시글 작성</button>
														</div>
													</div>
												</div>



											</div>




											<div class="modal" id="exampleModalToggle2"
												aria-hidden="true"
												aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
												<div class="modal-dialog modal-dialog-centered modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5"
																id="exampleModalToggleLabel2">게시글 작성</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<!-- 새 피드 작성모달 -->
															<form action="insertClubPane.do" method="post"
																enctype="multipart/form-data">
																<fieldset>
																	<input name="cp_name" type="text" id="cp_name"
																		placeholder="게시글 제목을 입력하세요*" required
																		autocomplete="off">
																</fieldset>
																<label class="rectangle-232-vNM">
																	<div id="socialimage_container"></div> <input id="bbb"
																	type="file" name="clubpanefile"
																	onchange="setThumbnail(event);"
																	placeholder="이미지를 선택해주세요" /> <script
																		src="././resources/js/socialuploadimg.js"></script>
																</label>
																<div class="col-lg-12">
																	<fieldset>
																		<textarea name="cp_content" type="text"
																			class="form-control" id="cp_content"
																			placeholder="게시글을 써주세요." required autocomplete="off"></textarea>
																	</fieldset>
																</div>
																<c:forEach items="${ oneClubList }" var="list">
																	<input id="clubcode" type="hidden" name="club_code"
																		class="clubcode" value="${list.club_code }">
																</c:forEach>
																<button id="btn" class="btn" type="submit"
																	data-bs-target="#exampleModalToggle"
																	data-bs-toggle="modal">피드 올리기</button>

															</form>
															<div class="modal-footer">
																<button class="btn" data-bs-target="#exampleModalToggle"
																	data-bs-toggle="modal">게시판 돌아가기</button>

															</div>
														</div>
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
														<form action="insertSocialing.do"
															enctype="multipart/form-data">
															<div class="templatemo-item-col all sang">
																<div class="row">
																	<div class="col-lg-9 align-self-center">
																		<div class="row">
																			<div class="col-lg-12">
																				<div id="contact" method="post">
																					<div class="row">
																						<c:forEach items="${ oneClubList }" var="clist">
																							<div class="meeting-single-item">
																								<div class="thumb">
																									<div class="price">
																										<span>${ clist.club_signtype }</span>
																									</div>


																									<div class="date">
																										<h6>활동지역</h6>
																										<span>${ clist.club_loc }</span>
																									</div>


																									<div class="person">
																										<h6
																											style="font-size: 13px; text-transform: uppercase; font-weight: 600; color: #a12c2f;">인원수
																										</h6>

																										<span
																											style="display: block; color: #1f272b; font-size: 17px; margin-top: 7px;">${ clist.club_left }/${ clist.club_memtot }</span>
																									</div>

																									<a href="meeting-details.html"><img
																										src="././resources/images/${ clist.club_rpic }"></a>
																								</div>
																								<div class="down-content">
																									<h5>${ clist.club_name }</h5>

																									<h6 class="description">${ clist.club_intro }</h6>
														</form>
												</div>
											</div>
											<form action="joinClub.do">
												<div class="col-lg-12">
													<input type="hidden" name="club_code"
														value="${clist.club_code }"> <input type="hidden"
														name="mem_code" value="${ code }"> <input
														type="hidden" name="club_signtype"
														value="${ clist.club_signtype }"> <br>

													<div>
														<c:forEach items="${ oneClubList }" var="clist">
															<c:choose>
																<c:when
																	test="${(clist.club_gender eq gender and clist.club_memtot-clist.club_left > 0 and clist.club_maxage+10 > age) or (clist.club_gender eq '누구나'  and clist.club_memtot-clist.club_left > 0 and clist.club_maxage+10 > age) or (clist.club_maxage eq 0 and clist.club_gender eq gender and clist.club_memtot-clist.club_left > 0) or (clist.club_maxage eq 0 and clist.club_gender eq '누구나' and clist.club_memtot-clist.club_left > 0)}">
																	<button type="submit" class="btn">가입하기</button>
																</c:when>
																<c:otherwise>
																	<button type="button" class="nono">가입하기</button>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</div>
												</div>
											</form>
		
		
		
		
		
		<!-- Button trigger modal -->
		<c:choose>
		<c:when test="${ memct_code eq 1 or  memct_code eq 2}">
		<c:forEach items="${oneClubList }" var="onecode">
			<a class="main_bt read_bt" href="javascript:void(0);" onclick="openfullcalendarPopup('${onecode.club_code}')">번개모임하기</a>
		</c:forEach> 
		
		
		</c:when>
		</c:choose>



		</div>
		</div>
		</div>
		</div>
		</c:forEach>
		</div>
		</div>
		</div>
	</section>


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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
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
	<script src="././resources/js/heartClick.js"></script>
	<script src="././resources/js/createClub.js"></script>
	<script src="././resources/js/reply.js"></script>
	<script src="././resources/js/repleUpDel.js"></script>
	<script src="././resources/js/openClubInstantCal.js"></script>
	
	
	
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
        $('.tab').each(function(index, element){
      	  $(this).on('click',function(){
      	    if($(this).hasClass("active")){
      	    	$(this).removeClass("active").children(".hidden").slideToggle();
      	    }else{
      	    	$(this).addClass("active").children(".hidden").slideToggle();
      	      
      	    }
      	  });
      	});
        


                	

    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>

</body>

</html>