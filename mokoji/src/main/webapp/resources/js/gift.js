$(function(){
	$('.giftcate').on('click', function(){
		var shophigh_name = $(this).text();
		 $.ajax({
			url: 'giftcate.do?shophigh_name='+ shophigh_name,
			type: "POST",
			success : function(data){
			for(var i=0;i<data.length;i++){
			$('#giftlist').append( '<form action="goGiftshopdetails.do"><div class="col"><div class="card"><img src="'+data[i].gcon_rpic+'"class="card-img-top" alt="..."><div class="card-body"><li class="giftcard" value="'+data[i].gcon_code+'"><a><h5 class="card-title">'+data[i].gcon_name+'</h5></a></li><input type="hidden" name="gcon_code" value="'+data[i].gcon_code+'" /><p class="card-text">'+data[i].gcon_price+'</p></div><button type="submit">구매하기</button></div></div></form>')
		}
		}, error : function(){
			alert(shophigh_name);
		}
	
	});
	});
	
});

$(function(){
$('.giftcate').click(function(){
$('#giftlist').empty();
});
});