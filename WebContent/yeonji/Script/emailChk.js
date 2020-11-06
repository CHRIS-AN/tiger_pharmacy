
$("#alert-info").hide();

// $("#NumInputBtn").click(function() {
// var regEmail =
// /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
// var querytext = $("#userEmail").val().trim();
//    	
// console.log(querytext);
//    	
// if (querytext == "") {
// $('[data-toggle="tooltip"]').tooltip();
// $("input#userEmail").focus();
// } else if(!regEmail.test(querytext)){
// $('[data-toggle="tooltip"]').attr('data-original-title','유효한 이메일주소를 입력하세요.');
// $("input#userEmail").focus();
// } else {
// $("#numTr").show();
// $("#alert-info").show();
// }
// })

$("#NumInputBtn").click(function() {
	alert("이메일 인증 시작!");

	var email = $("#userEmail").val();

	var key;// 인증키
	var bool = true;

	if (bool) {

		$.ajax({
			url : "userEmail_Insert.ajax",
			type : "post",
			dataType : "text",
			data : {
				"email" : email
			},

			success : function(result) {
				alert("인증번호 발송!");
				key = result;
				bool = false;
			},

			error : function(xhr, status, error) {
				alert("Error : " + status + " ==> " + error);
			}

		});// ajax

		$("#numTr").show();// 이메일 인증 입력란.
		$("#alert-info").show();

		$("#numInput").keyup(function() {
			if ($("#numInput").val() >= 6) {
				var userContent = $("#numInput").val();
				alert(userContent);

				if (userContent == key) {
					alert("인증 성공!");

					$("#NumInputBtn").val("인증완료!");
					$("#NumInputBtn").attr("disabled", true);// 읽기전용으로 변환
					$("#numInput").attr("disabled", true);

				} else {

					$("#NumInputBtn").val("인증번호 재 발송!");
					event.preventDefault();
				}
			}
		});// keyup
	} else {// Y
		alert("test1 => false");
		event.preventDefault();
	}

});// jquery

