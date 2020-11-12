<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<link rel="stylesheet" href="CSS/pwFind.css">

<%@ include file="../layout/top1_2.jsp"%>
<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<div class="content">
	<div id="pwfindcontainer">
		<div class="pwfindFrm">
			<form action="../Send" method="post">
				<h1>비밀번호를 잊으셨나요?</h1>
				<hr>
				<h6>계정으로 사용하는 이메일 주소를 입력하시면, 비밀번호 재설정 링크를 전송해 드립니다.</h6>

				<div id="email_input">
					<input type="text" placeholder="이메일 주소" name="email" required>

					<button type="submit">재설정링크 전송하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>