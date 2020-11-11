<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="CSS/common.css">
<link rel="stylesheet" href="CSS/rite.css">

<script>
	function chkSubmit() {
		frm = document.forms["frm"];

		var title = frm["title"].value.trim();
		var hospital = frm["hospital"].value.trim();
		var visit = frm["visit"].value.trim();
		var symptom = frm["symptom"].value.trim();
		var content = frm["content"].value.trim();
		var importFile = frm["file1"].value.trim();


		if (title == "") {
			alert("제목은 필수 작성내용입니다.");
			frm["title"].focus();
			return false;
		}
		
		if (hospital == "") {
			alert("방문병원은 필수 작성내용입니다.");
			frm["hospital"].focus();
			return false;
		}
		
		if (visit == "") {
			alert("방문일은 필수 작성내용입니다.");
			frm["visit"].focus();
			return false;
		}
		
		if (symptom == "") {
			alert("증상은 필수 작성내용입니다.");
			frm["symptom"].focus();
			return false;
		}
		
		if (content == "") {
			alert("내용은 필수 작성내용입니다.");
			frm["content"].focus();
			return false;
		}

		if (importFile == "") {
			alert("증빙자료는 필수 작성내용입니다.");
			frm["file1"].focus();
			return false;
		}
		
		return true;
	} // end chkSubmit()
</script>

<%@ include file="../layout/top2.jsp" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<div class="content">
	<div id="content-box">
		<!-- 유저 닉네임 area -->
		<div id="write-top-box">
			<h1><i class="fas fa-plus-square"></i>진료톡 -
			<c:choose>
				<c:when test="${param.catagory == 'jin_bi'}">
					비뇨기과			
				</c:when>
				<c:when test="${param.catagory == 'jin_jung'}">
					정신과
				</c:when>
			</c:choose>
			</h1>
			
			<img src="../layout/assets/img/tiger_par-logo-B.svg" alt="navbar brand"
				class="navbar-brand write-logo">
			
			<h1 class="text-right">${nowuser[0].u_nickName}님</h1>
		</div>
		<!-- END 유저 닉네임 area -->
		
		<form name="frm" action="Jin_b_writeOk.tp" method="post"
			onsubmit="return chkSubmit()" encType="Multipart/form-data">
			
			<input type="hidden" name="catagory" value="${param.catagory}"/>
			<input type="hidden" name="u_uid" value="${nowuser[0].u_uid}"/>
			
			제목  <input type="text" name="title" /><br><br>
			<table>
				<tr>
					<td>방문병원</td>
					<td><input type="text" name="hospital"></td>
				</tr>			
				<tr>
					<td>방문일자</td>
					<td><input type="text" name="visit"></td>
				</tr>			
				<tr>
					<td>증상</td>
					<td><input type="text" name="symptom"></td>
				</tr>			
			</table>
			<textarea name="content"></textarea><br>
			<span class="red">*</span>증빙서류 <input type="file" id="file1" name="file1" readonly>
			<button type="button" onclick="cleanFile('#file1')">삭제</button><br>
			첨부파일 <input type="file" id="file2" name="file2" readonly>
			<button type="button" onclick="cleanFile('#file2')">삭제</button>
			<br><br>
			<input type="submit" value="등록" />
		</form>
		<button type="button" onclick="location.href='Jin_b_list.tp?catagory=${param.catagory}'">목록</button>

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