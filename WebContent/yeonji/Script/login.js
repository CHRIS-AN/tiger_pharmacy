$("#loginBtn").click(function() {
	var userEmail = $("#userEmail").val();
	var pw = $("#pw").val();
	
	var regEmail =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	var url = "EmailPWChk.tp"

		if (userEmail == "") {
			alert("이메일을 입력해주세요.");
		} else if(!regEmail.test(useremail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
		} else {

			$.ajax({
				url : url,
				type : "post",
				data : {'userEmail': userEmail, 'pw': pw},
				success : function(result) {

					console.log("성공일때 "+ result);
					
				},

				error : function(xhr, status, error) {
					alert("Error : " + status + " ==> " + error);
				}
			})// ajax
		}

})