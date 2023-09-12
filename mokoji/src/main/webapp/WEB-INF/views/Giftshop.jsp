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
    <link rel="stylesheet" href="./././resources/style/fontawesome.css">
    <link rel="stylesheet" href="./././resources/style/Giftshop.css">
    <link rel="stylesheet" href="./././resources/style/buybutton.css">
   
    <link rel="stylesheet" href="./././resources/style/owl.css">
    <link rel="stylesheet" href="./././resources/style/lightbox.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
   
</head>
<body>
<%@ include file="main/Giftheader.jsp"%>
   

      <div class="container" id="item">
   
   <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner" id="slider">
    <div class="carousel-item active">
      <img src="./././resources/images/1.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./././resources/images/2.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./././resources/images/3.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>
      
   <h3>인기 기프티콘 <h4></h4></h3>
   <a class="more" href="goGiftTotal.do">더보기</a>
   <hr>
   
   <div class="row row-cols-3 row-cols-md-3 g-6" style="grid-row-gap: 20px;" id="giftlist">
   <c:forEach items="${AllgifticonList}" var="glist">
   <form action="goGiftshopdetails.do">
  <div class="col">
    <div class="card">
      <img src="${glist.gcon_rpic}" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${glist.gcon_name}</a></h5>
        <input type="hidden" name="gcon_code" value="${glist.gcon_code}" />
        <p class="card-text">${glist.gcon_price}</p>
      </div>
      <div id="buy">
  <div class="center">
        <button type="submit"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></button>
    </div>
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
   <script src="././resources/js/gift.js"></script>
</body>
</html>