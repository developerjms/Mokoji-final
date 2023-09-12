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
<meta charset="UTF-8">
<link href="././resources/style/clubin.css">
<link href="././resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.9.1.js" integrity="sha256-e9gNBsAcA0DBuRWbm0oZfbiCyhjLrI6bmqAl5o+ZjUA=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="././resources/js/createClub.js"></script>
</head>
<body>
<form method="post" action="applyClubInst.do">
<c:forEach items="${ thisClubInst }" var="thisci">
<table class="table">
  <thead class="thead-light">
    <tr>
<th scope="col"> </th>
<th scope="col">번개장  </th>
<th scope="col">번개 이름 </th>
<input type="hidden" name="cinst_code" value="${thisci.CINST_CODE }"/>
<th scope="col">번개 날짜</th>
<th scope="col">번개내용  </th>
<th scope="col">번개 정원</th>
<th scope="col">번개비용  </th> 
<th scope="col">번개현재참여인원 </th>
  </tr>
  <tr>
  	<th scope="row">1 </th>
  	<td> ${thisci.MEM_NAME }</td>
  	<td> ${thisci.CINST_NAME } </td>
  	<td>  ${thisci.CINST_DATE } </td>
  	<td>${thisci.CINST_CONTENT } </td>
  	<td> ${thisci.CINST_MEMTOT } </td>
  	<td>${thisci.CINST_COST } </td>
  	<td> ${thisci.CINST_LEFT } </td>
  	</tr>
  	</thead>
  	
  	
  </tbody>
</table>
<c:if test="${thisci.CINST_MEMTOT - thisci.CINST_LEFT eq 0 }">
<button type="button" class="nonono">번개 신청하기!</button>
</c:if>
<c:if test="${thisci.CINST_MEMTOT - thisci.CINST_LEFT > 0 }">
<button type="submit" style="position: relative;
    left: 1000px;">번개 신청하기!</button> 
</c:if>
</c:forEach>






<div id="profile">
<table class="table">
  <thead class="thead-light">
  <tr>
  	<th scope="col">참가자</th>
  	
<c:forEach items="${ applyMember }" var="applyMem">

  	<th scope="col">
<c:set var="i" value="${i+1}"></c:set>  	
  	</th>
  </tr>
   <tr>
  <th scope="row" style="width: 130px;">${i} </th>
  <div class="icon" style=" position: relative;
    top: 100px;
    left: 90px;">
	<th style="width: 50px"><img style="position: relative;"  " width=30px;" src="././resources/images/${applyMem.MEM_REALFNAME }"></th>
	<td><h6 style="position: inherit;; left: 180px; top: 196px;">${applyMem.MEM_NAME }</h6> </td>
	</div>
</c:forEach>
</tr>
 </thead>
</table>
</div>

</form>
<script type="text/javascript">
$(function(){
	$('.nonono').on('click',function(){
		alert('번개 신청이 이미 가득 찼습니다!');	
	
	});
});

</script>
</body>
</html>