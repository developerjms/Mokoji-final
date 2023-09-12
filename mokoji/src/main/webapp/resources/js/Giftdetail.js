$("#giftcount").keyup(function(){
	var giftpay = $(".card-text").text();
	var point = $("#point").val();
	var count = $("#giftcount").val();
	var total = point - giftpay * count
	
	$("#buypoint").text('구매시 잔여 포인트 : ' + total);
	$("#remainpoint").attr("value", total);
	

});

$(function(){
	$('#submit').on('click', function(){
	var gcon_code = $('#gcon_code').val();
	var remainpoint = $('#remainpoint').val();
	var giftcount = $('#giftcount').val();
	if(remainpoint < 0){
	alert("보유포인트가 부족합니다");
	}else{
	$.ajax({
		url: 'buyGift.do?gcon_code='+gcon_code+'&remainpoint='+remainpoint+'&giftcount='+giftcount,
		type: "POST",
		success : function(){
		 document.location.reload();
			alert("구매완료되었습니다!");	
		},error : function(){
			alert("문제가 생겼다!");
		}
	});
	}
		
	
	});
});
