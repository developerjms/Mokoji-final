<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html style="background-color: #f0efe0;">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <title>Mokoji Shop</title>

    <!-- Bootstrap core CSS -->
    <link href="./././resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="./././resources/style/fontawesome.css">
    <link rel="stylesheet" href="./././resources/style/GiftshopTotal.css">
    <link rel="stylesheet" href="./././resources/style/GiftTotal.css">
    <link rel="stylesheet" href="./././resources/style/owl.css">
    <link rel="stylesheet" href="./././resources/style/lightbox.css">
    <link rel="stylesheet" type="text/css" href="./././resources/style/buybutton.css">
   
   
</head>
<body>

     <%@ include file="main/Giftheader.jsp"%>
         
      <div class="container" id="giftfont">
       <h1>기프티콘 구매</h1><br>
   <p>적립된 포인트로 기프티콘을 구매해보세요.</p></div>
      
      
      <div class="row row-cols-1 row-cols-md-3 g-6" id="option" style="grid-row-gap: 20px;">
      
  <div class="control-group" style="overflow:auto;" id="scroll">
    <h3>카테고리</h3>
    <br>
    <label class="control control--radio">교환권
      <input type="radio" name="radio" value="교환권" />
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">도서 문구 음반
      <input type="radio" name="radio" value="도서/문구/음반"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">디지털 가전
      <input type="radio" name="radio" value="디지털/가전"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">레저 스포츠
      <input type="radio" name="radio" value="레저/스포츠"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">리빙
      <input type="radio" name="radio" value="리빙"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">뷰티
      <input type="radio" name="radio" value="뷰티"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">상품권
      <input type="radio" name="radio" value="상품권"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">식품
      <input type="radio" name="radio" value="식품"/>
      <div class="control__indicator"></div>
    </label>
    <label class="control control--radio">패션
      <input type="radio" name="radio" value="패션"/>
      <div class="control__indicator"></div>
    </label>
  </div>
  
  
  <div class="control-group" style="overflow:auto;" id="scroll" >
    <h3>세부 분류</h3>
    <br>
    <div id="GiftList">
   
    </div>
  </div>
  <div class="control-group" style="overflow:auto;">
    <h3>가격</h3>
    <br>
    <div class="select">
      <select id="selectPay">
        <option value="999999">가격을 선택해주세요.</option>
        <option value="5000">5000 point이하</option>
        <option value="10000">10000 point이하</option>
        <option value="30000">30000 point이하</option>
        <option value="50000">50000 point이하</option>
        <option value="100000">100000 point이하</option>
        <option value="999999">100000 point이하</option>
      </select>
      <div class="select__arrow"></div>
      <a type="button" id="checkGift">조회</a>
    </div>
   
  </div>
</div>
</div>
   <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner" id="slider">
    <div class="carousel-item active">
      <img src="./././resources/images/001.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./././resources/images/002.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./././resources/images/003.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" type="hidden" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" type="hidden" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>
   
      
   <div class="container" id="item"> 
   <div class="row row-cols-1 row-cols-md-3 g-6" id="giftCardList" style="grid-row-gap: 20px;">
   <c:forEach items="${giftList}" var="glist">
  <form action="goGiftshopdetails.do">
  <div class="col">
    <div class="card">
      <img src="${glist.gcon_rpic}" class="card-img-top" alt="...">
      <div class="card-body">
       <li class="giftcard" value="${glist.gcon_code}"><a><h5 class="card-title">${glist.gcon_name}</h5></a></li>
        <input type="hidden" name="gcon_code" value="${glist.gcon_code}" />
        <p class="card-text">${glist.gcon_price}</p>
      </div>
       <div class="center">
        <button type="submit"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></button>
    </div>
    </div>
  </div>
  </form>
  </c:forEach>
   
   </div>
 
 
   </div>
   
   
   
   
   
   
   
   
   
   
   
   
      <%@ include file="main/footer.jsp"%>
   <script src="././resources/vendor/jquery/jquery.min.js"></script>
   <script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="././resources/js/jquery-1.9.1.min.js"></script>
    <script src="././resources/js/Giftshop.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
</body>
</html>