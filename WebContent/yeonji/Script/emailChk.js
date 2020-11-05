    $("#NumInputBtn").click(function() {
    	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	var querytext = $("#emailInput").val().trim();
    	
    	console.log(querytext);
    	
    	if (querytext == "") { 
    		$('[data-toggle="tooltip"]').tooltip();
	    	$("input#emailInput").focus(); 
    	} else if(!regEmail.test(querytext)){
    		$('[data-toggle="tooltip"]').attr('data-original-title','유효한 이메일주소를 입력하세요.');
    		$("input#emailInput").focus(); 
    	} else {
    		$("#numTr").show();
    	}
    })


function emailNumChk () { 
	// 인증번호와 입력한 값이 같은지 확인후 같으면 joinImpo-email.jsp로 넘어가고 다르면 알럿 띄우기
	
}

$(function () {
	  
	})