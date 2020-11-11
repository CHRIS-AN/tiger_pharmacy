$("#loginBtn").click(function() {
	var userEmail = $("#userEmail").val().trim();
	var pw = $("#pw").val();
	
	var regEmail =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	var key = getCookie("key");
	var email = $("input[name='uname']");
	var idcheck = $("input[name='remember']");
	email.val(key); 
	
	if(email.val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		idcheck.attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}

	
	
	var url = "EmailPWChk.tp"

		if (userEmail == "") {
			alert("이메일을 입력해주세요.");
		} else if(!regEmail.test(userEmail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
		} else {

			$.ajax({
				url : url,
				type : "POST",
				data : {'userEmail': userEmail, 'pw': pw},
				success : function(result) {
//					console.log("성공일때 "+ result);
//					alert("result:"+result);
					if(result == 1){ //로그인 성공
//						console.log("1일때 "+ result);
						alert("로그인에 성공하였습니다.");

							
							
							idcheck.change(function(){ // 체크박스에 변화가 있다면,
								if(idcheck.is(":checked")){ // ID 저장하기 체크했을 때,
									setCookie("key", email.val(), 7); // 7일 동안 쿠키 보관
								}else{ // ID 저장하기 체크 해제 시,
									deleteCookie("key");
								}
							});

							// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
							email.keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
								if(idcheck.is(":checked")){ // ID 저장하기를 체크한 상태라면,
									setCookie("key", email.val(), 7); // 7일 동안 쿠키 보관
								}
							});
							location.href='../layout/index.jsp';
						
					}else if(result == 0) { //비밀번호 불일치
						alert("비밀번호가 일치하지 않습니다.");
					}else if(result == -1){ //해당 아이디 없음
						alert("해당 이메일은 존재하지 않습니다.");
					}

				},

				error : function(xhr, status, error) {
					alert("Error : " + status + " ==> " + error);
				}
			})// ajax
		}

})

	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}