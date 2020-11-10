<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script>
	function loginGoogle(){
		location.href="https://accounts.google.com/o/oauth2/auth?client_id="+
		"1009736396986-j8pui1ntu7sbsfhkkk23fcrhldkd3a7r.apps.googleusercontent.com"+
		"&redirect_uri="+
		"http://localhost:8888/tiger_pharmacy/googleLogin.tp" +
		"&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile&approval_prompt=force&access_type=offline";
	}

	$(document).ready(function(){
	 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    var email = $("input[name='uname']");
	    var idcheck = $("input[name='remember']");
	    email.val(key); 
	     
	    if(email.val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        idcheck.attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
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
	});
	 
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

</script>

<link rel="stylesheet" href="CSS/login.css">
<%@ include file="../layout/top1_2.jsp"%>
<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>i

<div class="content">
	<div id="logincontainer">
		<div class="loginFrm">
				<h1>로그인</h1>
				<hr>

				<div class="google-login">
					<button id="loginBtn" class="g-login" onclick="loginGoogle()">
						<img class="mr-2 mb-1" src="Img/google-icon.svg" alt="구글 로그인 로고">구글
						계정으로 로그인
					</button>
				</div>

				<div class="hr-sect">
					<p class="mx-3  my-0">or</p>
				</div>
			<form>
				<div id="email_pw_input">
					<input type="text" placeholder="이메일 주소" name="userEmail" id="userEmail" required>

					<input type="password" placeholder="비밀번호" name="pw" id="pw" required>

					<button type="submit" id="loginBtn">로그인</button>
				</div>
				<div id="loginbottom">
					<label> <input type="checkbox" name="remember"> 아이디
						기억하기
					</label> <span id="idpwfind" class="pr-2"><a href="pwfind.tp">비밀번호를
							잊으셨나요?</a></span>
				</div>
				<hr>
				<div>
					<b>호랭이 약방 계정이 없으세요?</b> <span id="join" class="ml-2"><a
						href="joinSelect.tp">회원가입</a></span>
				</div>
			</form>

		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>