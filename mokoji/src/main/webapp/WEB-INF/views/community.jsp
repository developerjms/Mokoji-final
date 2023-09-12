<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>나의 펀딩</title>
</head>
<body>
<div class="row mt-5"></div>
<h1 style="text-align: center; margin-bottom : 20px">나의 펀딩</h1>
<div class="container" id="list">

</div>

<script type="text/javascript">
let list ="";
var result =[];
let currentPage = 0;

function fn_funding_list(){
	 $.ajax({
       url:"community.do"
    	 ,success: function(data) {
    
	    	   list = data.result;	    	 
	    	   console.log(list)
	    	   for(i=0; i < list.length; i += 12){
	    	   		result.push(list.slice(i, i + 12));
	    	   }
        },
		error : function() {
            alert('error');
      },
     complete : function() {       
    	 	fn_page(currentPage);
    	  }
	 }); 
}

function fn_page (num){
		str = "";
		$.each(result[num], function(i, element) {				   
			str+='<div class="card"><div class="card__image-holder"><img class="card__image" src="' + element.club_rpic + '"/></div><div class="card-title"><a href="#" class="toggle-info btn"><span class="left"></span><span class="right"></span></a><h2>'+ element.club_name + '<small>' + element.club_memtot +'</small></h2></div><div class="card-flap flap1"><div class="card-description">'+ element.club_intro +'</div><div class="card-flap flap2"><div class="card-actions"><a href="#" class="btn">가입하기</a></div></div></div>';
		});
			$("#list").append(str);
	}


$(function(){
	fn_funding_list();
});	

//스크롤 바닥 감지
window.onscroll = function(e) {	
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    	currentPage +=1;
    	fn_page(currentPage);
    }
};

</script>

</body>
</html>