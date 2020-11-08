
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
			dataType : "text",
			data : {
				"userEmail" : useremail,
				"emailChk" : random
			},

			success : function(result) {
				alert("인증번호 발송!");
			},

			error : function(xhr, status, error) {
				alert("Error : " + status + " ==> " + error);
			}

		});// ajax

		$("#numTr").show();// 이메일 인증 입력란.
		$("#alert-info").show();

		$("#emailNumConfirm").click(function() {
			if ($("#numInput").val() >= 5) {
				var userContent = $("#numInput").val();

				if (userContent == random) {
					alert("인증 성공!");

					$("#NumInputBtn").val("인증완료!");
					$("#NumInputBtn").attr("disabled", true);// 읽기전용으로 변환
					$("#numInput").attr("disabled", true);
					location.href='joinImpo-email.jsp?userEmail=' + useremail;

				} else {

					$("#NumInputBtn").val("인증번호 재 발송!");
					event.preventDefault();
				}
			}
		});// keyup

	}
});// jquery

