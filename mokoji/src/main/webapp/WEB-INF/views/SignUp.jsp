<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 회원가입</title>
<link rel="stylesheet" href="././resources/style/SignUp.css">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript">
   window.onload = function(){
       document.getElementById("MEM_LOCA").addEventListener("click", function(){ //주소입력칸을 클릭하면
           //카카오 지도 발생
           new daum.Postcode({
               oncomplete: function(data) { //선택시 입력값 세팅
                   document.getElementById("MEM_LOCA").value = data.address; // 주소 넣기
                   document.getElementById("MEM_LOCB").focus(); //상세입력 포커싱
               }
           }).open();
           
       })

   }
   </script>
</head>

<body>

   <div class="form">

      <ul class="tab-group">
         <li class="tab active"><a href="#signup">회원가입</a></li>
         <li class="tab"><a href="#login">로그인</a></li>
      </ul>

      <div class="tab-content">
         <div id="signup">

            <form action="insertMember.do" method="post" enctype="multipart/form-data">

               <div class="top-row">

                  <div class="field-wrap">
                     <label for="username"><span
                        class="point successNameChk"></span></label> 
                     <input  placeholder="아이디   *최소 4자리를 입력해주세요!" type="text" id="username" name="mem_id" required autocomplete="off" />
                     <input type="hidden" id="nameDoubleChk" />
                  </div>

                  <div class="field-wrap">
                     <input type="password" id="userpass" name="mem_pw" placeholder="비밀번호" maxlength="14" title="14자 까지 입력" required autofocus />
                  </div>

                  <div class="field-wrap">
                     <input type="password" id="userpasschk" name="mem_pw2" placeholder="비밀번호 확인" maxlength="14" title="14자 까지 입력" required autofocus /> 
                     <span class="point successPwChk"></span> 
                     <input type="hidden" id="PwDoubleChk" />
                  </div>

                  <div class="field-wrap">
                     <label><span class="req"></span>
                     </label> <input  placeholder="이름" type="text" name="mem_name" required autocomplete="off" />
                  </div>

                  <div class="field-wrap">
                     <label> <span class="req"></span>
                     </label> <input  placeholder="주민번호    *-없이 적어주세요!" type="text" name="mem_jumin" required autocomplete="off" />
                  </div>

                  <div class="field-wrap">
                     <label> <span class="req"></span>
                     </label> <input  placeholder="전화번호   *-없이 적어주세요!" type="text" name="mem_tel" required autocomplete="off" />
                  </div>

                  <div class="field-wrap">
                  <div>
                     <label class="signgood">관심사<span class="req"></span></label>
                      <select  id="cthigh_name" name="cthigh_name" onchange="remove()" class="signupcreate">
                        <option value="선택" selected>== 선택 ==</option>
                        <c:forEach items="${ catehighList }" var="category">
                           <option value="${ category.cthigh_name }">${ category.cthigh_name }</option>
                        </c:forEach>
                     </select>
                     
                     <select id="mem_favorite" name="mem_favorite" class="signupcreate">
                        <option value="선택" selected>=========</option>
                     </select><br><br><br>
                     </div>

                  <div class="field-wrap">
                     <label class="signgood"> 관심지역<span class="req"></span>
                     </label> <select id="mem_loc" name="mem_loc" class="signupcreate">
                        <option value="선택" selected>== 선택 ==</option>
                        <option value="경기">경기</option>
                        <option value="부산">부산</option>
                        <option value="서울">서울</option>
                     </select>
                  </div>
               
             <div class="field-wrap">
             <span class="req"></span>
             <div id="signupimage_container"></div>
               <input type="file" name="file" accept="image/*" id="file" onchange="setThumbnail4(event);">
            </div>

                  <div class="field-wrap">
                     <label> <span class="req"></span>
                     </label> <input value="주소" type="text" id="MEM_LOCA" name="mem_addr"
                        readonly required autocomplete="off" />
                  </div>

                  <div class="field-wrap">
                     <label> <span class="req"></span>
                     </label> <input placeholder="상세주소" type="text" id="MEM_LOCB"
                        name="mem_addrdetail" />
                  </div>

                  <button type="submit" class="button button-block">회원가입</button>


               </div>
         </div>
            </form>

         </div>
        
         <div id="login">

            <form action="checkMember.do" method="post">

               <div class="field-wrap">
                  <label> <span class="req"></span>
                  </label> <input placeholder="아이디" type="text" name="mem_id" required autocomplete="off" />
               </div>

               <div class="field-wrap">
                  <label> <span class="req"></span>
                  </label> <input placeholder="비밀번호" type="password" name="mem_pw" required autocomplete="off" />
               </div>

               <p class="forgot">
                  <a href="#">Forgot Password?</a>
               </p>
               <p class="forgot">
                  <a href="#">Forgot Email?</a>
               </p>
               
             

               <button type="submit" class="button button-block" >로그인</button>

            </form>

         </div>

      </div>
      <!-- tab-content -->

   </div>
   <!-- /form -->
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <script type="text/javascript" src="././resources/js/SignUp.js"></script>
   <script type="text/javascript" src="././resources/js/socialloadimg.js"></script>

</body>
</html>