<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script>
	<%--function checkLoginStatus() {
		var loginBtn = document.querySelector('#loginBtn');
			if(gauth.isSignedIn.get()){
				loginBtn.value = 'Logout';
			} else {
				loginBtn.value = 'Login';
			}
	}

	function init() {
		gapi.load('auth2',function() {
			window.gauth = gapi.auth2.init({
				client_id : '481290883581-g710kes62ie2f8f8q5o9a773og405qg6.apps.googleusercontent.com'
			})
			gauth.than(function() {
				console.log('google success');
				checkLoginStatus();
				}, function() {
				console.log('google fail');
				});
		});
	}--%>
	function loginGoogle(){
		location.href ="https://accounts.google.com/o/oauth2/auth?client_id="+
		"1009736396986-j8pui1ntu7sbsfhkkk23fcrhldkd3a7r.apps.googleusercontent.com"+
		"&redirect_uri="+
		"http://localhost:8888/tiger_pharmacy/googleLogin.tp" +
		"&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile&approval_prompt=force&access_type=offline";
	};
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
					<input type="text" placeholder="이메일 주소" name="uname" required>

					<input type="password" placeholder="비밀번호" name="pw" required>

					<button type="submit">로그인</button>
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