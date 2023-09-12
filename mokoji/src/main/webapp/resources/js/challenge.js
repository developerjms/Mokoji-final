$(function(){
   $('.chall').click(function(){
   var ctmid_name = $(this).val();
      $.ajax({
      url: 'challengeTotal.do?ctmid_name='+ ctmid_name,
      type: "GET",
      cache : false,
      success : function(data){
            for(var i=0;i<data.length;i++){
                 $("#cardlist").append('<form action="ChallengeOne.do"><div class="cards" id="challengeList"><input type="hidden" name="chall_code" value="'+data[i].chall_code+'"><div class="card" id="card"><div class="card__image-holder"><img class="card__image" src="' + data[i].chall_rpic +'" /></div><div class="card-title"><a href="#" class="toggle-info btn"> <span class="left"></span><span class="right"></span></a><h2>'+ data[i].chall_name+ '</h2><span>' + data[i].chall_left +'/' + data[i].chall_tot +'</span></div><div class="card-flap flap1"><div class="card-description">'+data[i].chall_content+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></div></form>');   
            }
         }, error :function(){
            alert(ctmid_name);
         }
   });     
   });
   });
   
   
$(function(){
   $('.highcate').click(function(){
   var cthigh_name = $(this).text();
   $.ajax({
      url: 'challengeTotal.do?cthigh_name='+ cthigh_name,
      type: "POST",
      cache : false,
      
      success : function(data){
            for(var i=0;i<data.length;i++){
         
            $("#cardlist").append('<form action="ChallengeOne.do"><div class="cards" id="challengeList"><input type="hidden" name="chall_code" value="'+data[i].chall_code+'"><div class="card" id="card"><div class="card__image-holder"><img class="card__image" src="' + data[i].chall_rpic +'" /></div><div class="card-title"><a href="#" class="toggle-info btn"> <span class="left"></span><span class="right"></span></a><h2>'+ data[i].chall_name+ '</h2><span>' + data[i].chall_left +'/' + data[i].chall_tot +'</span></div><div class="card-flap flap1"><div class="card-description">'+data[i].chall_content+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></div></form>');
            
            }
         }, error :function(){
            alert(ctmid_name);
         }
      });     
   });
});

$(document).ready(function(){
  var zindex = 10;
  
  $(document).on('click','.card',function(e){

    var isShowing = false;

    if ($(this).hasClass("show")) {
      isShowing = true
    }

    if ($("div.cards").hasClass("showing")) {
      // a card is already in view
      $("div.card.show")
        .removeClass("show");

      if (isShowing) {
        // this card was showing - reset the grid
        $("div.cards")
          .removeClass("showing");
      } else {
        // this card isn't showing - get in with it
        $(this)
          .css({zIndex: zindex})
          .addClass("show");

      }

      zindex++;

    } else {
      // no cards in view
      
      $("div.cards")
        .addClass("showing");
      $(this)
        .css({zIndex:zindex})
        .addClass("show");

      zindex++;
    }
    
  });
});

function delcontent(){
$('#cardlist').empty();
}


$(function(){
$('.highcate').click(function(){
$('#cardlist').empty();

});
});

$(function(){
	$('.nochall').on('click',function(){
		alert('참여 조건을 확인해주세요!');	
	});
});