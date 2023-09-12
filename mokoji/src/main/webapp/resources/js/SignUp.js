

$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

     if (e.type === 'keyup') {
         if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
       if( $this.val() === '' ) {
          label.removeClass('active highlight'); 
         } else {
          label.removeClass('highlight');   
         }   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
          label.removeClass('highlight'); 
         } 
      else if( $this.val() !== '' ) {
          label.addClass('highlight');
         }
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

   window.onload = function(){
    document.getElementById("MEM_LOCA").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("MEM_LOCA").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
        
    })

}

    $("#username").blur(function(){
       var mem_id = $("#username").val();
       if(mem_id == "" || mem_id.length < 4){
          $(".successNameChk").text("아이디는 4자 이상 8자 이하로 설정해주세요 :)");
         $(".successNameChk").css("color", "red");
         $("#nameDoubleChk").val("false");
       }else{
          $.ajax({
            url : 'SignUp.do?mem_id='+ mem_id,
            type : 'post',
            cache : false,
            success : function(data) {
               if (data == 0) {
                  $(".successNameChk").text("사용가능한 아이디입니다.");
                  $(".successNameChk").css("color", "green");
                  $("#nameDoubleChk").val("true");
               } else {
                  $(".successNameChk").text("사용중인 아이디입니다 :p");
                  $(".successNameChk").css("color", "red");
                  $("#nameDoubleChk").val("false");
               }
            }, error : function() {
               console.log("실패");
            }
         });
       }
    });

    //비밀번호 확인
   $("#userpasschk").blur(function(){
      if($("#userpasschk").val() == $("#userpass").val()){
         $(".successPwChk").text("비밀번호가 일치합니다!");
         $(".successPwChk").css("color", "green");
         $("#pwDoubleChk").val("true");
      }else{
         $(".successPwChk").text("비밀번호가 일치하지 않습니다!");
         $(".successPwChk").css("color", "red");
         $("#pwDoubleChk").val("false");
      }
   });
   
$("#cthigh_name").blur(function(){
   var cthigh_name = $("#cthigh_name").val();
   $.ajax({
      url: 'SignUp.do?cthigh_name='+ cthigh_name,
      type: "GET",
      cache : false,
      
      success : function(data){
            for(var i=0;i<data.length;i++){
               $("#mem_favorite").append("<option>"+data[i].ctmid_name+"</option>");
            }
         
         
         }, error :function(){
            alert("request error!");
         }
   });     
});

   function remove(){
      $("#mem_favorite").val("");
      $("#mem_favorite").empty();
      }
   
   