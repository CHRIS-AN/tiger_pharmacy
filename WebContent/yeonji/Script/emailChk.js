   

$("#alert-info").hide();

$("#NumInputBtn").click(function() {
    	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	var querytext = $("#useremail").val().trim();
    	
    	console.log(querytext);
    	
    	if (querytext == "") { 
    		$('[data-toggle="tooltip"]').tooltip();
	    	$("input#useremail").focus(); 
    	} else if(!regEmail.test(querytext)){
    		$('[data-toggle="tooltip"]').attr('data-original-title','유효한 이메일주소를 입력하세요.');
    		$("input#useremail").focus(); 
    	} else {
    		$("#numTr").show();
    		$("#alert-info").show();
    	}
    })


$("#NumInputBtn").click(function () {
	alert("이메일 인증 시작!");
	
	var user_email = $("#useremail").val();
	
	var key;// 인증키
	var bool = true;
	
	if(bool){
		
		$.ajax({
			url:"<c:url value='/yeonji/'/>"
			type:"post",
				dataType:"json",
				data:{"user_email1":user_email1,
					  "user_email2":user_email2},
				success: function(result){
					alert("인증번호 발송!");
					key=result;
					bool=false;
				},
				
				error:function(xhr, status, error){
					alert("Error : " + status + " ==> " + error);
				}

			});// ajax
			$(".writechk").show();	// 이메일 인증 입력란.
			$(".btemail").val("인증번호 확인!"); // 이메일 인증 버튼 -> 내용 변경
			$(".writechk").keyup(function(){
				if($(".writechk").val()>=6){
					var userContent = $(".writechk").val();
					// alert(userContent);

					if(userContent == key){
						alert("인증 성공!");
						$("#emailchk").val("Y");// 숨겨져있음 -> DB에 저장할거임 (Y/N)
						$("#btemail").val("인증완료!");
						$("#btemail").attr("disabled", true);// 읽기전용으로 변환
						$(".writechk").attr("disabled", true);
					}else {
						$("#emailchk").val("N");
						$("#btemail").val("인증번호 재 발송!");
						event.preventDefault();
					}
				}
			});// keyup
		}else {// Y
			alert("test1 => false");
			event.preventDefault();
		}
		
	});// jquery
	
