
$("#alert-info").hide();

$("#NumInputBtn").click(function() {
	var regEmail =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var useremail = $('#userEmail').val().trim();

	var url ="MailSend.tp";
	var random = 0;
	random = Math.floor(Math.random()*(99999-10000+1))+10000;

	
	if (useremail == "") {
		$('[data-toggle="tooltip"]').tooltip();
		$("input#userEmail").focus();
	} else if(!regEmail.test(useremail)){
		$('[data-toggle="tooltip"]').attr('data-original-title','유효한 이메일주소를 입력하세요.');
		$("input#userEmail").focus();
	} else {

		$.ajax({
			url : url,
			type : "post",
			data : {'userEmail': useremail, 'emailChk': random},
			success : function(result) {

				console.log("성공일때 "+ result);
				
				if(result == 1){
					console.log("true일때 "+ result);
					alert("이미 사용중인 이메일 입니다.");
				}else if(result == 0) {
					console.log("false일때 "+ result);
					alert("인증번호 발송!");
					$("#numTr").show();// 이메일 인증 입력란.
					$("#alert-info").show();

					$("#emailNumConfirm").click(function() {

						var code = $("#numInput").val();

						if (code == random) {
							alert("인증 성공!");

							$("#NumInputBtn").val("인증완료!");
							$("#NumInputBtn").attr("disabled", true);// 읽기전용으로 변환
							$("#numInput").attr("disabled", true);


						} else {

							$("#NumInputBtn").val("인증번호 재 발송!");
							event.preventDefault();
						}

					});// click
				}
			},

			error : function(xhr, status, error) {
				alert("Error : " + status + " ==> " + error);
			}
		})// ajax
	}
});// jquery

