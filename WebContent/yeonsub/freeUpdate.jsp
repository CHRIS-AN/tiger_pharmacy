<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="yeonsup.beans.*"%>
<%
	int result = (Integer) request.getAttribute("result");
// request에 담겨져 오는 것 회원 정보 dto
%>
<!-- 로그인 확인 -->

<c:if test="${result == 0 }">
	<script>
		alert("로그인을 해주세요")
		// 나중에 로그인 페이지로 변경
		history.back();
	</script>
</c:if>
<%@ include file = "../layout/top.jsp"%>

<%@ include file = "../layout/top1_2.jsp"%>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	var content = frm["content"].value.trim();
	var title = frm["title"].value.trim();
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	if(content == ""){
		alert("내용을 작성해주세요");
		frm["content"].focus();
		return false;
	}
	
	return true;	
} // end chkSubmit()
</script>
<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/freeUpdate.css">
<%@ include file = "../layout/top2.jsp"%>
<%@ include file = "../layout/header.jsp"%>
<%@ include file = "../layout/sidebar.jsp"%>
	<!--컨텐츠가 들어가는 메인화면-->
	<div id="content-box">
		<div id="write-top-box">
			<h1><i class="fas fa-book-medical"></i> 회원 수정</h1>
			<img alt="호랑이약방.로고" src="../layout/assets/img/tiger_par-logo-B.svg"
				class="img-responsive center-block write-logo">
			
			<h2 class="text-right">${board.u_nickName }님</h2>
			
		</div>

		<form name="frm" action="freeUpdateOk.tp" method="post"
			onsubmit="return chkSubmit()" encType="Multipart/form-data">

			<input type="hidden" name="u_uid" value="${user.u_uid }">
			<input type="hidden" name="b_uid" value="${board.b_uid }">
			<!-- 회원 고유번호 -->
			<input type="hidden" name="catagory" value="자유">
			<!-- 카테고리 -->

			<div id="write-title-box">
				<h4>제목</h4>
				<input type="text" name="title"
					value="${board.title }" maxlength="50" />
				<div class="clear"></div>
			</div>
			<div id="wrtie-content-box">
				<textarea name="content" >${board.content }</textarea>
				<div style="margin:10px 0;">
				<div id="delFiles"></div>
					<div class="upfile-button">
						<span class="upfile-text">첨부파일</span>
						<c:if test="${not empty board.file }">
							${board.file }
							<button style="margin-left:15px;" type="button"
								onclick="deleteFiles(${board.b_uid}); $(this).parent().remove();">삭제</button>
						</c:if>
						<c:if test="${empty board.file }">
							<input type='file' id='file' name='upfile' readonly>
							<button type='button' onclick="cleanFile(${board.b_uid})">삭제</button>
							<br>
						</c:if>
					</div>
				
				<div id = "fileUp"></div>
				</div>
			</div>
			<script>
				function deleteFiles(fileUid){
					// 삭제할 file 의 bf_uid 값(들)을 #delFiles 에 담아 submit 하게 한다
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid +"'>");
					
					var upFile = $("#fileUp");
				
					
					$(upFile).append("<input type='file' id='file' style='width:300px; margin-right:30px; overflow:hidden; display:inline-block' name='upfile' readonly>" +
							"<button type='button' onclick='cleanFile('#file')''>삭제</button>");
				}
				function cleanFile(fileId) {
					$(fileId).val("");
				}
			</script>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();"
					class="btn btn-warning" /> 
				<input
					type="submit" value="수정" class="btn btn-warning" />
			</div>
		</form>
	</div>
<%@ include file = "../layout/footer.jsp"%>
<%@ include file = "../layout/script_bottom.jsp"%>

