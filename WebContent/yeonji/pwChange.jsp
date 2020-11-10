<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="yeonji.beans.JoinUserDAO"%>

<%@ include file="../layout/top.jsp"%>
<!-- 추가할 CSS,Script 등 여기에 넣으세요! -->
<link rel="stylesheet" href="CSS/pwChange.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%@ include file="../layout/top1_2.jsp"%>
<%@ include file="../layout/top2.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>
<div class="content">
	<div id="pwchangecontainer">
		<div class="pwchangeFrm">
			<form action="pwChangeAction.jsp?email=${param.email }" method="post" >
				<h1>비밀번호 재설정</h1>
				<hr>
				<div id="pw_input">
					<input type="text" id="pw" name="pw" placeholder="비밀번호 재설정" required>
	                <input type="text" id="pwChk" name="pwChk" placeholder="비밀번호 재설정 확인" required>
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
					<button type="submit" id="ChangeBtn">비밀번호 변경하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>
<script src="Script/pwChange.js" type="text/javascript"></script>
<%@ include file="../layout/script_bottom.jsp"%>