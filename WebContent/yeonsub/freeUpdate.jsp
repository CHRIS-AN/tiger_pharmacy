<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="yeonsup.beans.*"%>
<%
	int result = (Integer) request.getAttribute("result");
// request에 담겨져 오는 것 회원 정보 dto
%>
<!-- 로그인 확인

<c:if test="${result == 0 }">
	<script>
		alert("로그인을 해주세요")
		// 나중에 로그인 페이지로 변경
		history.back();
	</script>
</c:if>
 -->
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
<%@ include file="../layout/top.jsp" %>
<link rel="stylesheet" href="css/common.css">
<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../layout/top2.jsp" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

	<!--컨텐츠가 들어가는 메인화면-->
	<div id="content-box">
		<div id="write-top-box">
			<h1>
				<span> <!-- 아이콘ㄴ --> </span>회원 글쓰기
			</h1>
			<img alt="호랑이약방.로고" src="../layout/assets/img/tiger_par-logo-W.svg"
				class="img-responsive center-block">
			<h1 class="text-center">로고</h1>
			<c:choose>
				<c:when test="${not empty board.b_nickName }">
					<h1 class="text-right">${board.b_nickName }님</h1>
				</c:when>
				<c:otherwise>
					<h1 class="text-right">${board.u_nickName }님</h1>
				</c:otherwise>
			</c:choose>
		</div>

		<form name="frm" action="freeUpdateOk.tp?b_uid=${board.b_uid }" method="post"
			onsubmit="return chkSubmit()" encType="Multipart/form-data">

			<input type="hidden" name="u_uid" value="${user.u_uid }">
			<!-- 회원 고유번호 -->
			<input type="hidden" name="catagory" value="자유">
			<!-- 카테고리 -->

			<div id="write-top-box"
				style="border-top: 3px solid gold; border-bottom: 3px solid gold; padding: 20px 0">
				<h4 style="display: inline-block">제목</h4>
				<input type="text" name="title"
					style="width: 90%; margin: 0 15px; font-size: 20px"
					value="${board.title }" />
			</div>
			<div id="wrtie-content-box"
				style="padding-top: 40px; border-bottom: 3px solid gold;">
				<textarea name="content" style="width: 100%; height: 400px;">${board.content }</textarea>
				<h4 style="display: inline-block; padding: 20px 0">첨부파일</h4>
				<div id="delFiles"></div>
				<c:if test="${not empty board.file }">
					<div>
						<button type="button"
							onclick="deleteFiles(${fileDto.uid}); $(this).parent().remove();">삭제</button>${board.file }
					</div>
				</c:if>
				<br>
				<input style="margin-left: 20px;" type="file" name="upfile"
					value="${board.file }" />
			</div>
			<script>
				function deleteFiles(fileUid){
					// 삭제할 file 의 bf_uid 값(들)을 #delFiles 에 담아 submit 하게 한다
					$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid +"'>");
				}
			</script>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();"
					class="btn btn-warning" style="margin: 20px 0;" /> <input
					type="submit" value="등록" class="btn btn-warning"
					style="margin: 20px;" />
			</div>
		</form>
	</div>


<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />