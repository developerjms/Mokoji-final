$('input[name="radio"]').change(function(){
	var shophigh_name = $(this).val();
	$.ajax({
		url: 'getMiddleList.do?shophigh_name='+ shophigh_name,
		type: "POST",
		success : function(data){
			for(var i=0;i<data.length;i++){
				$("#GiftList").append('<label class="control control--radio">'+data[i].shopmiddle_name+'<input type="radio" name="radio1" value="'+data[i].shopmiddle_code+'"/><div class="control__indicator"></div></label>')
			}
		}, error : function(){
			alert(shophigh_name);
		}
	
	});
});


$('input[name="radio"]').change(function(){
$("#GiftList").empty();
});

$(function(){
	$('#checkGift').on('click', function(){
	var shopmiddle_code = $('input[name="radio1"]:checked').val();
	var gcon_price = $('#selectPay').val();
	$.ajax({
		url:'searchGift.do?shopmiddle_code='+shopmiddle_code+'&gcon_price='+gcon_price,
		type:"GET",
		success : function(data){
		for(var i=0;i<data.length;i++){
			$("#giftCardList").append('<form action="goGiftshopdetails.do"><div class="col"><div class="card"><img src="'+data[i].GCON_RPIC+'"class="card-img-top" alt="..."><div class="card-body"><li class="giftcard" value="'+data[i].GCON_CODE+'"><a><h5 class="card-title">'+data[i].GCON_NAME+'</h5></a></li><input type="hidden" name="gcon_code" value="'+data[i].GCON_CODE+'" /><p class="card-text">'+data[i].GCON_PRICE+'</p></div><div class="center"><button type="submit"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></button></div></div></div></form>')
		}
		}, error : function(){
			alert("뭔가잘못되었다!");
		}
	});	
	});
});


$(function(){
$('#checkGift').click(function(){
$('#giftCardList').empty();
});
});

$(function(){
	$('.giftcate').on('click', function(){
		var shophigh_name = $(this).text();
		 $.ajax({
			url: 'giftcate.do?shophigh_name='+ shophigh_name,
			type: "POST",
			success : function(data){
			for(var i=0;i<data.length;i++){
			$("#giftCardList").append('<form action="goGiftshopdetails.do"><div class="col"><div class="card"><img src="'+data[i].GCON_RPIC+'"class="card-img-top" alt="..."><div class="card-body"><li class="giftcard" value="'+data[i].GCON_CODE+'"><a><h5 class="card-title">'+data[i].GCON_NAME+'</h5></a></li><input type="hidden" name="gcon_code" value="'+data[i].GCON_CODE+'" /><p class="card-text">'+data[i].GCON_PRICE+'</p></div><div class="center"><button type="submit"><span data-attr="Buy">Buy</span><span data-attr="Now">Now</span></button></div></div></div></form>')
		}
		}, error : function(){
			alert(shophigh_name);
		}
	
	});
	});
	
});

$(function(){
$('.giftcate').click(function(){
$('#giftCardList').empty();
});
});


