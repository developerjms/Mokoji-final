	window.onload = function(){
    document.getElementById("MEM_LOCA").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("MEM_LOCA").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
        
    });

}

$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#id").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#id").focus();
            return;
        }
    	
    	if($.trim($('#pass').val())==''){
    		alert("비번입력해주세요.");
    		$('#pass').focus();
    		return;
    	}
    	
    	if($.trim($('#pass').val()) != $.trim($('#passjea').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#passjea').focus();
    		return;
    	}
    	
    	
    	if($.trim($('#name').val())==''){
    		alert("이름입력해주세요.");
    		$('#name').foucs();
    		return;
    	}
       
        // 자료를 전송합니다.
        document.userinput.submit();
	});
	
	//아이디 중복체크
	$('#id').keyup(function(){
        // 로그인 프로세스 호출
        $.ajax({
            type: 'post',			// 전송방식
            async: true,			// 비동신통신
            url:'idCheck.do',		// **** 요청
            contentType:'application/x-www-form-urlencoded;charset=UTF-8',  // 한글
            //data: id="+$("#id").val(),        // 클라이언트에서 보내는 데이타
            data : { id : $("#id").val() },
            success:function(result){				// 성공하면 함수연결
            	//alert("resultData = "+result)
    			$('#idCheckResult').html(result);            	
    		}
        });
	})
})


