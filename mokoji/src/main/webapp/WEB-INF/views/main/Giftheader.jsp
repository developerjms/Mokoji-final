<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Mokoji Main</title>

</head>
<body>
   <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky">
      <div class="container" id="nav" >
         <div class="row">
            <div class="col-12">
               <nav class="main-nav">
                  <!-- ***** Logo Start ***** -->
                  <a href="go.do" class="logo"> MOKOJI </a>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                     <div class="autocomplete">
                        <input id="search" type="text" placeholder="Search">
                     </div>
                     <li><a class="giftcate">교환권</a></li>
                     <li><a class="giftcate">도서/문구/음반</a></li>
                     <li><a class="giftcate">디지털/가전</a></li>
                     <li><a class="giftcate">레저/스포츠</a></li>
                     <li><a class="giftcate">리빙</a></li>
                     <li><a class="giftcate">뷰티</a></li>
                     <li><a class="giftcate">상품권</a></li>
                     <li><a class="giftcate">식품</a></li>
                     <li><a class="giftcate">패션</a></li>
                     <li><a>포인트 : ${point}</a>
                        <ul class="sub-menu">
                  <!-- ***** Menu End ***** -->
               </nav>
            </div>
         </div>
      </div>
   </header>
   <!-- ***** Header Area End ***** -->
</body>
</html>