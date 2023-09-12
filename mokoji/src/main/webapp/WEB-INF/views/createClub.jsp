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

<title>Education - List of Meetings</title>


<!-- Bootstrap core CSS -->`
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="././resources/style/fontawesome.css">
<link rel="stylesheet"
   href="././resources/style/templatemo-edu-meeting.css">
<link rel="stylesheet" href="././resources/style/owl.css">
<link rel="stylesheet" href="././resources/style/lightbox.css">
<link rel="stylesheet" href="././resources/style/createClub.css">


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
               <h2>생성 페이지</h2>
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
                           <li data-filter=".club" class="active">동호회</li>
                           <li data-filter=".social">소셜링</li>
                           <li data-filter=".chal">챌린지</li>
                        </ul>

                     </div>
                  </div>

                  <div class="col-lg-12">
                     <div class="row grid">
                     
                     <section class="contact-us" method="post">
   <form action="inserting.do" method="post" enctype="multipart/form-data">
         <div class="templatemo-item-col all chal">
            <div class="row">
               <div class="col-lg-9 align-self-center">
                  <div class="row">
                     <div class="col-lg-12">
                        <div id="contact">
                           <div class="row">
                              <div class="col-lg-12">
                                 <h2>챌린지 생성</h2>
                              </div>
                              <div class="col-lg-4">
                                 <input type="hidden" value="${ code }" name="mem_code">
                                 <fieldset>
                                    <input name="chall_name" type="text" id="chall_name" placeholder="챌린지 제목을입력하세요*" required autocomplete="off">
                                 </fieldset>
                              </div>

                              <div class="col-lg-4">
                                 <fieldset>
                                    <input name="chall_startdate" type="date" id="chall_startdate" required autocomplete="off" />
                                 </fieldset>
                              </div>

                              <div class="col-lg-4">
                                 <fieldset>
                                    <input type="date" name="chall_enddate" id="chall_enddate" required autocomplete="off" />
                                 </fieldset>
                              </div>


                              <div>
                              <label class="rectangle-232-vNM">
                                 <div id="challimage_container">
                                 </div>
                                 <input name="challengefile" type="file" id="chall_pic" accept="image/*" onchange="setThumbnail3(event)" placeholder="이미지를 선택해주세요" />
                     </label>
                           </div>
                              <div class="col-lg-12">
                                 <fieldset>
                                    <textarea name="chall_content" type="text" class="form-control" id="chall_content" placeholder="챌린지를 자유롭게 소개해주세요*" required autocomplete="off"></textarea>
                                 </fieldset>
                              </div>
                              <div>
                                 <div>
                                                      <p style="font-weight:bold;">주 활동 지역을 선택해주세요!</p>
                                                         <select name="chall_loc" class="create">
                                                               <option value="전체">전체</option>
                                                               <option value="강남구">강남구</option>
                                                               <option value="강동구">강동구</option>
                                                               <option value="강북구">강북구</option>
                                                               <option value="강서구">강서구</option>
                                                               <option value="관악구">관악구</option>
                                                               <option value="광진구">광진구</option>
                                                               <option value="구로구">구로구</option>
                                                               <option value="금천구">금천구</option>
                                                               <option value="노원구">노원구</option>
                                                               <option value="도봉구">도봉구</option>
                                                               <option value="동대문구">동대문구</option>
                                                               <option value="동작구">동작구</option>
                                                               <option value="마포구">마포구</option>
                                                               <option value="서대문구">서대문구</option>
                                                               <option value="서초구">서초구</option>
                                                               <option value="성동구">성동구</option>
                                                               <option value="성북구">성북구</option>
                                                               <option value="송파구">송파구</option>
                                                               <option value="양천구">양천구</option>
                                                               <option value="영등포구">영등포구</option>
                                                               <option value="용산구">용산구</option>
                                                               <option value="은평구">은평구</option>
                                                               <option value="종로구">종로구</option>
                                                               <option value="중구">중구</option>
                                                               <option value="중랑구">중랑구</option>                                                      
                                                         </select>      
                                 </div><br>
                              </div>
                              <label class="item--DS9" style="font-weight:bold;">챌린지 주제를 선택해주세요!<br><br></label>
                              <div class="line-50-t2V"></div>


                              <div class="field-wrap">
                                 <span class="req"></span>
                                    <select id="cthigh_name" name="cthigh_name" onchange="remove()" class="create">
                                    <option value="선택" selected>== 선택 ==</option>
                                       <c:forEach items="${ catehighList }" var="category">
                                          <option value="${ category.cthigh_name }">${ category.cthigh_name }</option>
                                       </c:forEach>
                                    </select>
                                    <select id="mem_favorite2" name="ctmid_code" class="create">
                                       <option value="선택">== 선택 ==</option>
                                     </select>
                                     <br><br>
                              </div>

                              <label class="item" style="font-weight:bold;">어떻게 멤버를 모집할까요?<br><br></label>
                              <div class="line-81-zw3"></div>
                              <label class="item--ySH" style="font-weight:bold;">성별</label>
                              <div class="gender">
                                 <select name="chall_gender" class="create">
                                    <option value="none">=== 선택 ===</option>
                                    <option value="누구나">누구나</option>
                                    <option value="남자">남자</option>
                                    <option value="여자">여자</option>
                                 </select><br><br>
                              </div>

                              <div class="line-84-Zuj"></div>
                              <label class="item3" style="font-weight:bold;">연령</label>
                              <div class="age">
                                 <select name="chall_age" class="create">
                                    <option value="none">=== 선택 ===</option>
                                    <option value="999">무관</option>
                                    <option value="20">20대</option>
                                    <option value="30">30대</option>
                                    <option value="40">40대</option>
                                    <option value="50">50대</option>
                                    <option value="60">60대</option>
                                 </select><br><br>
                              </div>
                              <div class="line-85-6em"></div>

                              <label class="item5" style="font-weight:bold;">인원 수</label>
                              <div class="per">
                                 <input name="chall_tot" type="number" min='2' step='1'>
                                  <div class="item6" style="font-weight:bold;">※최소 2, 최대 인원 수는 30 입니다.</div>
                              </div>
                              <div class="position-absolute bottom-0 end-0">
                              <button type="submit" style="float:right;">챌린지 생성</button>
                              </div>
                              </form>
                                    
                              
                           </div>
                        </div>
                     </div>
                  </div>
   
      </section>
                        
                        
                        <form action="insertSocialing.do" method="post" enctype="multipart/form-data">
                           <section class="contact-us" id="contact">
                              <div class="templatemo-item-col all social">
                                 <div class="row">
                                    <div class="col-lg-9 align-self-center">
                                       <div class="row">
                                          <div class="col-lg-12">
                                             <div id="contact" method="post">
                                                <div class="row">
                                                   <div class="col-lg-12">
                                                      <h2>소셜링 생성</h2>
                                                   </div>
                                                   <div class="col-lg-4">
                                                      <input type="hidden" value="${ code }" name="mem_code">
                                                      <fieldset>
                                                         <input name="social_name" type="text" id="social_title" placeholder="소셜링 제목을입력하세요*" required autocomplete="off">
                                                      </fieldset>
                                                   </div>

                                                   <div class="col-lg-4">
                                                      <fieldset>
                                                         <input name="social_date" type="date"
                                                            id="social_date" required autocomplete="off" />
                                                      </fieldset>

                                                   </div>
                                                   <div>
                                                      <label class="rectangle-232-vNM">
                                                         <div id="socialimage_container"></div>
                                                         <input name="socialingfile" type="file" id="social_pic" accept="image/*" onchange="setThumbnail(event);" placeholder="이미지를 선택해주세요" name="socialimgup" />
                                                         <script src="././resources/js/socialuploadimg.js"></script>
                                                      </label>

                                                   </div>
                                                   <div class="col-lg-12">
                                                      <fieldset>
                                                         <textarea name="social_content" type="text" class="form-control" id="social_content" placeholder="소셜링을 자유롭게 소개해주세요*" required autocomplete="off"></textarea>
                                                      </fieldset>
                                                   </div>
                                                   <div>
                                                      <div>
                                                         <p style="font-weight:bold;">주 활동 지역을 선택해주세요!</p>
                                                         <select name="social_loc" class="create">
                                                               <option value="전체">전체</option>
                                                               <option value="강남구">강남구</option>
                                                               <option value="강동구">강동구</option>
                                                               <option value="강북구">강북구</option>
                                                               <option value="강서구">강서구</option>
                                                               <option value="관악구">관악구</option>
                                                               <option value="광진구">광진구</option>
                                                               <option value="구로구">구로구</option>
                                                               <option value="금천구">금천구</option>
                                                               <option value="노원구">노원구</option>
                                                               <option value="도봉구">도봉구</option>
                                                               <option value="동대문구">동대문구</option>
                                                               <option value="동작구">동작구</option>
                                                               <option value="마포구">마포구</option>
                                                               <option value="서대문구">서대문구</option>
                                                               <option value="서초구">서초구</option>
                                                               <option value="성동구">성동구</option>
                                                               <option value="성북구">성북구</option>
                                                               <option value="송파구">송파구</option>
                                                               <option value="양천구">양천구</option>
                                                               <option value="영등포구">영등포구</option>
                                                               <option value="용산구">용산구</option>
                                                               <option value="은평구">은평구</option>
                                                               <option value="종로구">종로구</option>
                                                               <option value="중구">중구</option>
                                                               <option value="중랑구">중랑구</option>                                                      
                                                         </select><br><br>    
                                                      </div>
                                                   </div>
                                                   <br> <label class="item--DS9" style="font-weight:bold;">소셜링 주제를 선택해주세요!</label> </br>
                                                   <div class="line-50-t2V"></div>


                                                   <div class="field-wrap">
                                                      <span class="req"></span>
                                                      <select id="cthigh_name1" name="cthigh_name" onchange="remove1()" class="create">
                                                         <option value="선택" selected>== 선택 ==</option>
                                                         <c:forEach items="${ catehighList }" var="category">
                                                            <option value="${ category.cthigh_name }">${ category.cthigh_name }</option>
                                                         </c:forEach>
                                                      </select>
                                                      <select id="mem_favorite3" name="ctmid_code" class="create">
                                                         <option value="선택">== 선택 ==</option>
                                                      </select><br><br>
                                                   </div>
												
                                                   <label class="item" style="font-weight:bold;">어떻게 멤버를 모집할까요?</label>
												<div class="mb-3 createrow">
                                                   <div class="form_radio_btn">
                                             	<input id="radio-1" type="radio" name="social_signtype" value="선착순">
                                         		 <label for="radio-1">선착순</label>
                                          		</div>
                                         		 <div class="form_radio_btn">
                                                    <input id="radio-2" type="radio" name="social_signtype" value="승인제">
                                          			<label for="radio-2">승인제</label>
                                                 </div>
                                                   </div>
                                                  </div>
                                                  
                                                   <div class="line-81-zw3"><br></div>
                                                   <label class="item--ySH" style="font-weight:bold;">성별</label>
                                                   <div class="gender">
                                                      <select name="social_gender" class="create">
                                                         <option value="none">== 선택 ==</option>
                                                         <option value="남자">남자</option>
                                                         <option value="여자">여자</option>
                                                         <option value="누구나">누구나</option>
                                                      </select><br><br>
                                                   </div>

                                                   <div class="line-84-Zuj"></div>
                                                   <label class="item3" style="font-weight:bold;">연령</label>
                                                   <div class="age">
                                                      <select name="social_maxage" class="create">
                                                         <option value="none">== 선택 ==</option>
                                                         <option value="999">무관</option>
                                                         <option value="20">20대</option>
                                                         <option value="30">30대</option>
                                                         <option value="40">40대</option>
                                                         <option value="50">50대</option>
                                                         <option value="60">60대</option>
                                                      </select><br><br>
                                                   </div>
                                                   <div class="line-85-6em"></div>


                                                   <label class="item4" style="font-weight:bold;">참여비</label>
													<div class="mb-4 createrow1">
                                                   <div class="form_radio_btn">
                                                         <input id="radio-3" type="radio" name="socialinfo_chpay" onclick="textActive()" value="있음">
                                                      <label for="radio-3" id="yes">있음</label>
                                                      </div>
                                                      <div class="form_radio_btn">
                                                         <input id="radio-4" type="radio" name="socialinfo_chpay" onclick="textDisable()" value="없음">
                                                      <label for="radio-4" id="no">없음</label> 
                                                      </div>
                                                      <input type="text" name="social_cost" id="socialpay" placeholder="금액을 작성해주세요." disabled>
                                                   </div>



                                                   <label class="item5" style="font-weight:bold;">인원 수</label>
                                                   <div class="per">
                                                      <input name="social_tot" type="number" min='2' max='30' step='1'>
                                                   </div>

                                                   <div class="item6" style="font-weight:bold;">※최소 2, 최대 인원 수는 30 입니다.</div>
                                                   <div class="col-lg-12">
                                                      <fieldset>
                                                         <button type="submit" id="form-submit" class="button" style="float:right;">소셜링 생성</button>
                                                      </fieldset>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                        </form>
                     </div>
                  </div>
   </section>


   <section class="contact-us" id="contact">
      <div class="col-lg-4 templatemo-item-col all club">
         <div class="row">
            <div class="col-lg-9 align-self-center">
               <div class="row">
                  <div class="col-lg-12">
                     <form id="contact" action="insertClub.do" method="post" enctype="multipart/form-data">
                        <div class="row">
                           <div class="col-lg-12">
                              <h2>동호회 생성</h2>
                           </div>
                           <div class="col-lg-4">
                              <input type="hidden" value="${ code }" name="mem_code">
                              <fieldset>
                                 <input name="club_name" type="text" id="title" placeholder="동호회 이름을 입력하세요*" required="">
                              </fieldset>
                           </div>
                           <div>
                              <label class="rectangle-232-vNM">
                                 <div id="clubimage_container"></div>
                                 <input name="clubfile" type="file" id="club_pic" accept="image/*" onchange="setThumbnail1(event);" placeholder="이미지를 선택해주세요" name="clubimgup" />
                                 <script src="././resources/js/socialuploadimg.js"></script>
                           </div>
                           <div class="col-lg-12">
                              <fieldset>
                                 <textarea name="club_intro" type="text" class="form-control" id="message" placeholder="동호회을 자유롭게 소개해주세요*" required=""></textarea>
                              </fieldset>
                           </div>

                           <div>
                              <div>
                                 <p style="font-weight:bold;">주 활동 지역을 선택해주세요!</p>
												<select name="social_loc" class="create">
                                                               <option value="전체">전체</option>
                                                               <option value="강남구">강남구</option>
                                                               <option value="강동구">강동구</option>
                                                               <option value="강북구">강북구</option>
                                                               <option value="강서구">강서구</option>
                                                               <option value="관악구">관악구</option>
                                                               <option value="광진구">광진구</option>
                                                               <option value="구로구">구로구</option>
                                                               <option value="금천구">금천구</option>
                                                               <option value="노원구">노원구</option>
                                                               <option value="도봉구">도봉구</option>
                                                               <option value="동대문구">동대문구</option>
                                                               <option value="동작구">동작구</option>
                                                               <option value="마포구">마포구</option>
                                                               <option value="서대문구">서대문구</option>
                                                               <option value="서초구">서초구</option>
                                                               <option value="성동구">성동구</option>
                                                               <option value="성북구">성북구</option>
                                                               <option value="송파구">송파구</option>
                                                               <option value="양천구">양천구</option>
                                                               <option value="영등포구">영등포구</option>
                                                               <option value="용산구">용산구</option>
                                                               <option value="은평구">은평구</option>
                                                               <option value="종로구">종로구</option>
                                                               <option value="중구">중구</option>
                                                               <option value="중랑구">중랑구</option>                                                      
                                                         </select>   <br><br>   
                              </div>
                           </div>
                           <label class="item--DS9" style="font-weight:bold;">모임 주제를 선택해주세요!</label>
                           <div class="line-50-t2V"></div>


                           <div class="field-wrap">
                             <span class="req"></span>
                                 <select id="cthigh_name2" name="cthigh_name" onchange="remove2()" class="create">
                                 <option value="선택" selected>== 선택 ==</option>
                                 <c:forEach items="${ catehighList }" var="category">
                                    <option value="${ category.cthigh_name }">${ category.cthigh_name }</option>
                                 </c:forEach>
                              </select> <select id="mem_favorite4" name="ctmid_code" class="create">
                                 <option value="선택" selected>== 선택 ==</option>
                              </select><br><br>
                           </div>

                           <label class="item" style="font-weight:bold;">어떻게 멤버를 모집할까요?</label>

                         	<div class="mb-5 createrow">
                         	 <div class="form_radio_btn">
                               <input id="radio-5" type="radio" name="club_signtype" value="선착순">
                               <label for="radio-5" id="com">선착순</label>
                               </div>
                               <div class="form_radio_btn">
                               <input id="radio-6" type="radio" name="club_signtype" value="승인제">
                               <label for="radio-6" id="grant">승인제</label> 
                               </div><br><br>
							</div>
							
                           <div class="line-81-zw3"></div>
                           <label class="item--ySH" style="font-weight:bold;">성별</label>
                           <div class="gender">
                              <select name="club_gender" class="create">
                                 <option value="none">== 선택 ==</option>
                                 <option value="남자">남자</option>
                                 <option value="여자">여자</option>
                                 <option value="누구나">누구나</option>
                              </select><br><br>
                           </div>

                           <div class="line-84-Zuj"></div>
                           <label class="item3" style="font-weight:bold;">연령</label>
                           <div class="age">
                              <select name="club_maxage" class="create">
                                 <option value="none">== 선택 ==</option>
                                 <option value="0">무관</option>
                                 <option value="20">20대</option>
                                 <option value="30">30대</option>
                                 <option value="40">40대</option>
                                 <option value="50">50대</option>
                                 <option value="60">60대</option>
                              </select>
                           </div>

                           <div class="line-85-6em"><br></div>



                           <label class="item4" style="font-weight:bold;">참여비</label>
                           
                           <div class="line-86-7Vs"></div>
                           <div class="mb-6 createrow">
                           		<div class="form_radio_btn">
                                 <input id="radio-7" type="radio" name="clubinfo_chpay" onclick="Active()" value="있음">
                              <label for="radio-7" id="yes">있음</label>
                             			 </div>
                              	<div class="form_radio_btn">
                                 <input id="radio-8" type="radio" name="clubinfo_chpay" onclick="Disable()" value="없음">
                              <label for="radio-8" id="no">없음</label>
                              </div>
                                 <input type="text" name="club_cost" id="clubpay" placeholder="금액을 작성해주세요." disabled>
                           </div>
                           <label class="item5" style="font-weight:bold;">인원 수</label>
                           <div class="per">
                              <input name="club_memtot" type="number" min='2' max='30' step='1'>
                           </div>
                           <div class="item6" style="font-weight:bold;">※최소 2, 최대 인원 수는 30 입니다.</div>
                           <div class="col-lg-12">
                              <fieldset>
                              <input type="hidden" value="${checknum }">
                              <c:if test="${checknum < 1 }">
                                 <button type="submit" id="form-submit1" class="button">동호회 생성</button>
                              </c:if>
                              <c:if test="${checknum >= 1}">
                                 <button type="button" class="noinsert" id="form-submit1" class="button" style="float:right;">동호회 생성</button>
                              </c:if>
                                 
                              </fieldset>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
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

   <script src="././resources/js/isotope.min.js"></script>
   <script src="././resources/js/owl-carousel.js"></script>
   <script src="././resources/js/lightbox.js"></script>
   <script src="././resources/js/tabs.js"></script>
   <script src="././resources/js/isotope.js"></script>
   <script src="././resources/js/video.js"></script>
   <script src="././resources/js/slick-slider.js"></script>
   <script src="././resources/js/custom.js"></script>
   <script src="././resources/js/category.js"></script>
   <script src="././resources/js/socialloadimg.js"></script>
   <script src="././resources/js/socialpay.js"></script>
   <script src="././resources/js/createClub.js"></script>
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