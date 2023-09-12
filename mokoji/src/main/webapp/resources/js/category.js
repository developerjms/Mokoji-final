$("#cthigh_name").blur(function(){
   var cthigh_name = $("#cthigh_name").val();
   $.ajax({
      url: 'ClubList.do?cthigh_name='+ cthigh_name,
      type: "GET", 
      success : function(data){
            for(var i=0;i<data.length;i++){
               $("#mem_favorite2").append("<option value="+ data[i].ctmid_code +">"+ data[i].ctmid_name +"</option>");
            }
         }, error :function(){
            alert("request error!");
         }
   });     
});



   function remove(){
      $("#mem_favorite2").val("");
      $("#mem_favorite2").empty();
  
   }
   
   $("#cthigh_name1").blur(function(){
   var cthigh_name = $("#cthigh_name1").val();
   $.ajax({
      url: 'ClubList.do?cthigh_name='+ cthigh_name,
      type: "GET", 
      success : function(data){
            for(var i=0;i<data.length;i++){
               $("#mem_favorite3").append("<option value="+ data[i].ctmid_code +">"+ data[i].ctmid_name +"</option>");
            }
         }, error :function(){
            alert("request error!");   
         }
   });     
});



   function remove1(){
      $("#mem_favorite3").val("");
      $("#mem_favorite3").empty();
  
   }
   
   $("#cthigh_name2").blur(function(){
   var cthigh_name = $("#cthigh_name2").val();
   $.ajax({
      url: 'ClubList.do?cthigh_name='+ cthigh_name,
      type: "GET", 
      success : function(data){
            for(var i=0;i<data.length;i++){
               $("#mem_favorite4").append("<option value="+ data[i].ctmid_code +">"+ data[i].ctmid_name +"</option>");
            }
         
         
         }, error :function(){
            alert("request error!");
         }
   });     
});



   function remove2(){
      $("#mem_favorite4").val("");
      $("#mem_favorite4").empty();
  
   }
   
   
   function Active()  {
    const target = document.getElementById('clubpay');
    target.disabled = false;
  }
  
  function Disable()  {
    const target = document.getElementById('clubpay');
    target.disabled = true;
          $("#clubpay").val("");
      $("#clubpay").empty();
    
  }
function textActive()  {
    const target = document.getElementById('socialpay');
    target.disabled = false;
  }
  
  function textDisable()  {
    const target = document.getElementById('socialpay');
    target.disabled = true;
          $("#socialpay").val("");
      $("#socialpay").empty();
  }
  
   