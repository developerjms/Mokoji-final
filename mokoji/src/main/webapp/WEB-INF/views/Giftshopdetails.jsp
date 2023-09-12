<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
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
    <link rel="styleshhet" href="./././resources/style/createClub.css"> 
    <link rel="stylesheet" href="./././resources/style/fontawesome.css">
    <link rel="stylesheet" href="./././resources/style/owl.css">
    <link rel="stylesheet" href="./././resources/style/lightbox.css">
    <link rel="stylesheet" href="./././resources/style/Giftshopdetails.css">
    <link rel="stylesheet" href="./././resources/style/detailbuybutton.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
   
</head>
<body>
<%@ include file="main/Giftheader.jsp"%>
<div class="card mb-3">
    <c:forEach items="${GiftOneList}" var="glist">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="${glist.gcon_rpic}" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h1 class="card-title">${glist.gcon_name}</h1>
        <div class="price">
        <input type="hidden" id="gcon_code" value="${glist.gcon_code}"><input type="hidden" id="point" value="${point}">
        </div>
        <h3 class="card-text" value="${glist.gcon_price}">${glist.gcon_price}&nbsp;point<br><br></h3>
        <fieldset>
        <input type="number" id="giftcount" placeholder="갯수를 입력하세요.">
        </fieldset>
		<br>
        <li id="nowpoint">현재 보유 포인트 : ${point}</li><br>
        <li id="buypoint">구매시 잔여 포인트 : ${point}</li><br>
        <input type="hidden" id="remainpoint">
       <div class="center">
        <button type="submit"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></button>
    </div>
      </div>
    </div>
  </div>
  </c:forEach>
</div>

   
   
   
   
   
   
   
   
   
   
   
   
   
      <%@ include file="main/footer.jsp"%>
   <script src="././resources/vendor/jquery/jquery.min.js"></script>
   <script src="././resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="././resources/js/jquery-1.9.1.min.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
       <script src="././resources/js/owl-carousel.js"></script>
       <script src="././resources/js/tabs.js"></script>
       <script src="././resources/js/custom.js"></script>
       <script src="././resources/js/Giftdetail.js"></script>
    
    
    
    
    
    
    
    
</body>
</html>