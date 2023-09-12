
 var animated = false;
  $(".heart").each(function(index,element){
  	$(this).on("click", function() {
  		if($(this).hasClass("is-active")){
    		$(this).removeClass("is-active");
				var cp_code = $(this).attr("value");
				$(this).empty();
					$.ajax({
		     			 url: 'downHeart.do?cp_code=' + cp_code,
		     			 type: "POST",
		      			 success : function(data){
		            	 for(var i=0;i<data.length;i++){
		                 $("[value="+data[i].cp_code+"]").append('<div class="cnt">'+data[i].cp_likes+'</div>');
		            }	  
		     	    },error:function(request,status,error){
		     	    
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   });     
		            }else{
						$(this).addClass("is-active");
		            	var cp_code = $(this).attr("value");
		            	$(this).empty();
							$.ajax({
		     			 		url: 'updateHeart.do?cp_code=' + cp_code,
		     			 		type: "POST", 
		      			 		success : function(data){
		            	 			for(var i=0;i<data.length;i++){
		                 			$("[value="+data[i].cp_code+"]").append('<div class="cnt">'+data[i].cp_likes+'</div>');
		            		}
		     	    },error:function(request,status,error){
		     	  
		        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       	}
		   });        
		  }
		});
	}); 