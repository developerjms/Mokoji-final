$(document).ready(function(){
   $('.titleWrapper').on('click', function(){
      
    if ($(this).next('#wrapper').css('display') == 'block') {
            $(this).next('#wrapper').css('display', 'none');
  			$(this).next('#wrapper').children(':first').empty();
  			
  			
        } else {
            $(this).next('#wrapper').css('display', 'block');
            var cp_code =  $(this).next('#wrapper').children('.cpcode').val();
            var memcode = $(this).prev('.memcode').val();

            $.ajax({
		     	url: 'selectComment.do?cp_code=' + cp_code,
		     	type: "POST", 
		      	success : function(data){
		      	
		      			  for(var i=0;i<data.length;i++){   	
		      	if(data[i].MEM_CODE == memcode){
		   
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"><button type="button" class="modi" value="'+data[i].CPREPLE_CODE+'">수정</button><button type="button" class="dele" value="'+data[i].CPREPLE_CODE+'">삭제</button></div>');
		            	
		      	}else{
		  			
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"></div>');
		                	
		      	}
		  }
		     	    },error:function(request,status,error){
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   });          
        }
   });

    $('.inactive').on('click',function(){
      $(this).toggleClass('inactive active');
   });
});




$('.replyinsert').each(function(index,element){
	$(this).on('click', function(){
		var cp_code = $(this).next('.cpcode').val();
		var cpreple_content = $(this).prev('.reple').val();
		var memcode = $(this).val();
		$('.reple').val('');
		
		$(this).siblings('div').empty();
     		$.ajax({
		     	url: 'insertComment.do?cp_code=' + cp_code +'&cpreple_content='+cpreple_content,
		     	type: "POST", 
		      	success : function(data){
		      		
		  for(var i=0;i<data.length;i++){   	
		      	if(data[i].MEM_CODE == memcode){
		   
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"><button type="button" class="modi" value="'+data[i].CPREPLE_CODE+'">수정</button><button type="button" class="dele" value="'+data[i].CPREPLE_CODE+'">삭제</button></div>');
		            	
		      	}else{
		  			
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"></div>');
		                	
		      	}
		  }
		     	    },error:function(request,status,error){
		     	   	
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   });   
	});
});

$(document).ready(function(){
	$('.repleupdel').each(function(index,element){
		$(this).on('click','.indel>.modi',function(){
		var cpreple_content = $(this).prev('.cpreple_content').val();
		var cpreple_code = $(this).val();
		$(this).parent('.repleupdel').empty();
					$.ajax({
		     	url: 'updateReple.do?cpreple_code='+cpreple_code + '&cpreple_content=' + cpreple_content,
		     	type: "POST", 
		      	success : function(data){
		      		
		       for(var i=0;i<data.length;i++){   	
		      	if(data[i].MEM_CODE == memcode){
		   
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"><button type="button" class="modi" value="'+data[i].CPREPLE_CODE+'">수정</button><button type="button" class="dele" value="'+data[i].CPREPLE_CODE+'">삭제</button></div>');
		            	
		      	}else{
		  			
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"></div>');
		                	
		      	}
		  }
		     	    },error:function(request,status,error){
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   });  
 
		});
	});
	
		
});
$(document).ready(function(){
$('.repleupdel').each(function(index,element){
		$(this).on('click','.indel>.dele',function(){

			 var cpreple_code = $(this).val();
			 $(this).parent('.indel').empty();
		$.ajax({
		     	url: 'deleteReple.do?cpreple_code='+cpreple_code,
		     	type: "POST", 
		      	success : function(data){
		      		
		        			      			  for(var i=0;i<data.length;i++){   	
		      	if(data[i].MEM_CODE == memcode){
		   
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"><button type="button" class="modi" value="'+data[i].CPREPLE_CODE+'">수정</button><button type="button" class="dele" value="'+data[i].CPREPLE_CODE+'">삭제</button></div>');
		            	
		      	}else{
		  			
		                 	
		                 	$('[name="'+data[i].CP_CODE+'"]').append('<div class="indel">'+data[i].MEM_NAME+'<input type="hidden" class="cpreple_code" value="'+data[i].CPREPLE_CODE+'"><input type="text" class="cpreple_content" value="'+data[i].CPREPLE_CONTENT+'"></div>');
		                	
		      	}
		  }
		     	    },error:function(request,status,error){
		     	    alert(cpreple_code);
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   }); 
	  
		});
	});
});
