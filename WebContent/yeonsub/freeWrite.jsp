<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="yeonsup.beans.*"%>
<%
	int result = (Integer)request.getAttribute("result");	
	// request에 담겨져 오는 것 회원 정보 dto
%>
<c:if test="${result == 0 }">
	<script>
		alert("로그인을 해주세요")
		// 나중에 로그인 페이지로 변경
		history.back();
	</script>
</c:if>

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
<%@ include file="../layout/top.jsp"%>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/freeWrite.css">
<%@ include file="../layout/top2.jsp"%>


<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

<!--컨텐츠가 들어가는 메인화면-->
<div class="content">
	<div id="content-box">
		<div id="write-top-box">
			<h1><i class="fas fa-book-medical"></i>	글쓰기</h1>
			<img src="../layout/	assets/img/tiger_par-logo-B.svg" alt="navbar brand"
				class="navbar-brand write-logo">
			<h1 class="text-right">${user.u_nickName }님</h1>
		</div>
		
		<form name="frm"  action="freeWriteOk.tp" method="post" onsubmit="return chkSubmit()" encType="Multipart/form-data">
			
			<input type="hidden" name="u_uid" value="${user.u_uid }"> 	<!-- 회원 고유번호 -->
			<input type="hidden" name="catagory" value="free"> <!-- 카테고리 -->
			
			<div id="write-inner-box">
				<h4 style="display:inline-block">제목</h4>
				<input type="text" name="title" class="title-input" maxlength="10"/>
			</div>
			<div id="write-content-box">
				<textarea onkeyup="adjustHeight()" name="content" class="wr-content"></textarea>
				<h4 style="display:inline-block; padding:20px 0">첨부파일</h4>
				<input style="margin-left:20px;" type="file" name="upfile"/>
			</div>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();" class="btn btn-warning" style="margin:20px 0;"/>
				<input type="submit" value="등록" class="btn btn-warning" style="margin:20px;"/>
			</div>
		</form>
	</div>
</div>
<script>
	function adjustHeight() {
		var textEle = $('textarea');
		var textEleHeight = textEle.prop('scrollHeight');
		if(textEleHeight >= 400){
			textEle.css('height', textEleHeight+10);
		}
	};	
</script>

<jsp:include page="../layout/footer.jsp"/>
<jsp:include page="../layout/script_bottom.jsp"/>