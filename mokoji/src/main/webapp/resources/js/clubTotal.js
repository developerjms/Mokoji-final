$(function(){
   $('.club').click(function(){
   var ctmid_name = $(this).val();
      $.ajax({
      url: 'clubTotal.do?ctmid_name='+ ctmid_name,
      type: "GET",
      cache : false,
      success : function(data){
            for(var i=0;i<data.length;i++){
if(data[i].MIC_LIKES == 1){
                 $("#cardlist").append('<form action="details.do"><div class="cards" id="clubList"><div class="card"><div class="card__image-holder"><input type="hidden" name="club_code" value="' + data[i].CLUB_CODE + '"/><img class="card__image" src="././resources/images/' + data[i].CLUB_RPIC + '"/></div><div class="card-title"><a href="#" class="toggle-info btn"><span class="left"></span><span class="right"></span></a><h2>'+data[i].CLUB_NAME + '<small>' + data[i].CLUB_LEFT +'/' + data[i].CLUB_MEMTOT +'</small></h2></div><div id="heart" class="heart is-active" value="'+data[i].CLUB_CODE+'"></div><div class="card-flap flap1"><div class="card-description">'+data[i].CLUB_INTRO+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></form>'); 
}else{
                 $("#cardlist").append('<form action="details.do"><div class="cards" id="clubList"><div class="card"><div class="card__image-holder"><input type="hidden" name="club_code" value="' + data[i].CLUB_CODE + '"/><img class="card__image" src="././resources/images/' + data[i].CLUB_RPIC + '"/></div><div class="card-title"><a href="#" class="toggle-info btn"><span class="left"></span><span class="right"></span></a><h2>'+data[i].CLUB_NAME + '<small>' + data[i].CLUB_LEFT +'/' + data[i].CLUB_MEMTOT +'</small></h2></div><div id="heart" class="heart" value="'+data[i].CLUB_CODE+'"></div><div class="card-flap flap1"><div class="card-description">'+data[i].CLUB_INTRO+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></form>'); 
}
}
         }, error :function(){
            alert(ctmid_name);
         }
   });     
   });
   });
   
   
$(function(){
   $('.highcate').on('click', function(){
   var cthigh_name = $(this).text();
   $.ajax({
      url: 'clubTotal.do?cthigh_name='+ cthigh_name,
      type: "POST",
      cache : false,
      
      success : function(data){
            for(var i=0;i<data.length;i++){
if(data[i].MIC_LIKES == 1){
                 $("#cardlist").append('<form action="details.do"><div class="cards" id="clubList"><div class="card"><div class="card__image-holder"><input type="hidden" name="club_code" value="' + data[i].CLUB_CODE + '"/><img class="card__image" src="././resources/images/' + data[i].CLUB_RPIC + '"/></div><div class="card-title"><a href="#" class="toggle-info btn"><span class="left"></span><span class="right"></span></a><h2>'+data[i].CLUB_NAME + '<small>' + data[i].CLUB_LEFT +'/' + data[i].CLUB_MEMTOT +'</small></h2></div><div id="heart" class="heart is-active" value="'+data[i].CLUB_CODE+'"></div><div class="card-flap flap1"><div class="card-description">'+data[i].CLUB_INTRO+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></form>'); 
}else{
                 $("#cardlist").append('<form action="details.do"><div class="cards" id="clubList"><div class="card"><div class="card__image-holder"><input type="hidden" name="club_code" value="' + data[i].CLUB_CODE + '"/><img class="card__image" src="././resources/images/' + data[i].CLUB_RPIC + '"/></div><div class="card-title"><a href="#" class="toggle-info btn"><span class="left"></span><span class="right"></span></a><h2>'+data[i].CLUB_NAME + '<small>' + data[i].CLUB_LEFT +'/' + data[i].CLUB_MEMTOT +'</small></h2></div><div id="heart" class="heart" value="'+data[i].CLUB_CODE+'"></div><div class="card-flap flap1"><div class="card-description">'+data[i].CLUB_INTRO+'</div><div class="card-flap flap2"><div class="card-actions"><button type="submit" class="btn">가입하기</button></div></div></div></div></form>'); 
}
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