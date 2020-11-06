<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/top.jsp"%>


<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<link rel="stylesheet" href="CSS/pwChange.css">

<%@ include file="../layout/top1_2.jsp"%>
<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<div class="content">
	<div id="pwchangecontainer">
		<div class="pwchangeFrm">
			<form>
				<h1>비밀번호 재설정</h1>
				<hr>
				<div id="pw_input">
					<input type="text" placeholder="비밀번호 재설정" name="pwchange" required>
					<input type="text" placeholder="비밀번호 재설정 확인" name="pwchangeck" required>

					<button type="submit">비밀번호 변경하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/script_bottom.jsp"%>