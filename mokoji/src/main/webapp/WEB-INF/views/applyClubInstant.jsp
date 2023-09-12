<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개 모임 등록</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="././resources/style/applyClubInstant.css">
<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".datetimepicker").datetimepicker({ 
		format: "Y-m-d H:i",
	});
});
</script>
    <%
    int club_code = Integer.parseInt(request.getParameter("club_code"));
    
%> 

</head>
<body>
<fieldset>
          	<form action="insertClubInstant.do" method="post">
          	<input type="hidden" name="mem_code" value="${ code }">
          		<input type="hidden" name="club_code" value="<%=club_code%>">
        
          <label for="name">번개 제목</label>
        <input name="cinst_name" type="text" id="cinst_name" placeholder="번개모임 제목을 입력하세요*" required autocomplete="off">
          <label for="email">시작 일시</label>
          <input type="text" class="datetimepicker" name="cinst_date" style="width:140px;">
          <label for="email">번개 장소</label>
          <input name="cinst_loc" type="text" id="cinst_loc" placeholder="번개모임 장소를 입력하세요*" required autocomplete="off">
         
       
          <label for="cinst_cost">모임비</label>
        <input type="text" name="cinst_cost" id="cinstpay" placeholder="금액을 작성해주세요.">
          <label for="cinst_content">번개글</label>
		<textarea name="cinst_content" type="text" class="form-control" id="cinst_content" placeholder="번개글을 써주세요." required autocomplete="off"></textarea>
           <label for="cinst_content">인원수</label>
			<input name="cinst_memtot" type="number" min='3' max='30' step='1' placeholder="3명이상부터 30명 미만까지 작성해주세요.">
        </fieldset>
			
			
		<button type="submit">새 번개모임 생성</button>
		</form>
</body>
</html>