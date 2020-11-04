<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>


<!--css js 넣기 -->


<script>
	function chkSubmit() {
		frm = document.forms["frm"];

		var title = frm["title"].value.trim();
		var content = frm["content"].value.trim();
		var importFile = frm["file1"].value.trim();


		if (title == "") {
			alert("제목은 반드시 작성해야 합니다");
			frm["title"].focus();
			return false;
		}
		
		if (content == "") {
			alert("내용은 반드시 작성해야 합니다");
			frm["content"].focus();
			return false;
		}

		if (importFile == "") {
			alert("증빙자료는 반드시 첨부해주셔야합니다");
			frm["file1"].focus();
			return false;
		}
		return true;
	} // end chkSubmit()
</script>

<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<div class="content">
	<div id="content-box">
		<h2><i class="fas fa-plus-square"></i>진료톡 -
		<c:choose>
			<c:when test="${param.catagory == 'jin_bi'}">
				비뇨기과			
			</c:when>
			<c:when test="${param.catagory == 'jin_jung'}">
				정신과
			</c:when>
		</c:choose>
		</h2>
		<form name="frm" action="Jin_b_writeOk.tp?catagory=${param.catagory}&u_uid=${param.u_uid }" method="post"
			onsubmit="return chkSubmit()" encType="Multipart/form-data">
			<h2>${nowuser[0].u_nickName}님</h2><br>
			제목 : <input type="text" name="title" /><br>
			내용<br>
			<textarea name="content"></textarea><br>
			<span class="red">*</span>증빙서류 <input type="file" id="file1" name="file1" readonly>
			<button type="button" onclick="cleanFile('#file1')">삭제</button><br>
			첨부파일 <input type="file" id="file2" name="file2" readonly>
			<button type="button" onclick="cleanFile('#file2')">삭제</button>
			<br><br>
			<input type="submit" value="등록" />
		</form>
		<button type="button" onclick="location.href='Jin_b_list.tp?catagory=${param.catagory}&u_uid=${param.u_uid }'">목록</button>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
			function cleanFile(fileId) {
				$(fileId).val("");
			}
		</script>
	</div>
</div>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />