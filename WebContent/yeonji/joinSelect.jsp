<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<link rel="stylesheet" href="CSS/joinSelect.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../layout/top1_2.jsp"%>
<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<div class="content">
	<div id="joinSelectcontainer">
		<div class="joinSelectFrm">
				<h1>회원가입</h1>
				<hr>

				<div class="google-join">
					<button id="joinBtn" class="g-join" onclick="">
						<img class="mr-2 mb-1" src="Img/google-icon.svg" alt="구글 로고">구글
						계정으로 회원가입
					</button>
				</div>

				<div class="hr-sect">
					<p class="mx-3  my-0">or</p>
				</div>
				<div id="emailSelectBtn">
					<button type="submit" onclick="location.href='joinBrowsewrap.jsp' ">이메일로 회원가입</button>
				</div>
				<hr>
				<div>
					<b>이미 호랭이 약방 계정이 있으신가요?</b> <span id="login" class="ml-2"><a
						href="login.jsp">로그인</a></span>
				</div>
		</div>
	</div>
</div>
<script>
$("#joinBtn").click(function(){
	location.href="https://accounts.google.com/o/oauth2/auth?client_id="+
	"1009736396986-j8pui1ntu7sbsfhkkk23fcrhldkd3a7r.apps.googleusercontent.com"+
	"&redirect_uri="+
	"http://localhost:8888/tiger_pharmacy/redirect.tp" +
	"&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&approval_prompt=force&access_type=offline";
});
</script>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>