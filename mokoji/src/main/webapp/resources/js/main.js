function autocomplete(inp, arr) {

  var currentFocus;

  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;

      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;

      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
  
      this.parentNode.appendChild(a);
  
      for (i = 0; i < arr.length; i++) {
  
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
  
          b = document.createElement("DIV");
  
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
  
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
  
          b.addEventListener("click", function(e) {
  
              inp.value = this.getElementsByTagName("input")[0].value;
  
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
      
        currentFocus++;
      
        addActive(x);
      } else if (e.keyCode == 38) { 
      
        currentFocus--;
        
        addActive(x);
      } else if (e.keyCode == 13) {
        
        e.preventDefault();
        	location.href="SearchClub.do?search="+$('#search').val();
        if (currentFocus > -1) {
        
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    
    if (!x) return false;
    
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}


var countries = ["강남구", "강동구" ,"강북구", "강서구" , "관악구" , "광진구" , "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구", "전시", "영화", "페스티벌", "뮤지컬", "공연", "연극", "연주회", "등산", "야구", "산책", "러닝", "클라이밍", "축구", "다이어트", "서핑", "배드민턴", "볼링", "요가", "골프", "풋살", "필라테스", "자전거", "다이빙", "플로깅", "농구", "맛집투어", "카페", "요리", "맥주", "칵테일", "디저트", "커피", "위스키", "티룸", "전통주", "비건", "페어링", "사진", "보드게임", "드로잉", "댄스", "공예", "글쓰기", "방탈출", "악기연주", "음악감상", "봉사활동", "만화", "게임", "명상", "반려동물", "소개팅", "파티", "국내여행", "해외여행", "캠핑", "드라이브", "테마파크", "복합문화공간", "독서", "스터디", "브랜딩", "커리어", "사이드프로젝트", "창작", "관심사", "또래", "재테크", "N잡", "창업", "주식", "부동산", "영어", "언어교환", "중국어", "콘서트", "헬스", "수영", "와인", "파인다이닝", "노래", "캘리그라피", "피크닉", "동네", "일본어" ];

autocomplete(document.getElementById("search"), countries);