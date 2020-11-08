<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>


<!--css js 넣기 -->

<script>
	function chkSubmit() {

		frm = document.forms["frm"];
		var b_nickname = frm["b_nickname"].value.trim();
		var title = frm["title"].value.trim();
		var b_pw = frm["b_pw"].value.trim();
		var content = frm["content"].value.trim();

		if (b_pw == "") {
			alert("비밀번호를 작성해야합니다.");
			frm["b_pw"].focus();
			return false;
		}

		if (b_nickname == "") {
			alert("작성자 란은 반드시 입력해야 합니다");
			frm["nickname"].focus();
			return false;
		}

		if (title == "") {
			alert("제목은 반드시 작성해야 합니다");
			frm["title"].focus();
			return false;
		}
		if (content == "") {
			alert("내용을 반드시 입력해주세요.");
			frm["content"].focus();
			return false;
		}
		return true;
	} 
</script>

<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<div class="content">
	<div id="content-box">

		<h2>자유톡 비회원</h2>
		<form name="frm" action="nonWriteOk.tp" method="post"
			onsubmit="return chkSubmit()" enctype="Multipart/form-data">
			작성자: <input type="text" name="b_nickname" /> &nbsp; &nbsp; &nbsp;
			&nbsp; &nbsp; &nbsp; &nbsp;비밀번호: <input type="password" name="b_pw" /><br>
			<hr>

			제목: <input type="text" name="title" /><br>
			<hr>
			첨부파일 :
			<%-- 첨부파일 --%>
			<input type="file" name="file2"><br>
			<hr>
			내용:<br>
			<textarea name="content" style="width: 100%; height: 200px;"></textarea>
			<br>
			<br> <input type="submit" value="등록" />
		</form>
		<br>
		<button type="button" onclick="location.href='nonList.tp'">목록으로</button>


	</div>
</div>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />
