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
		location.href = "freeTalk.tp"
	</script>
</c:if>

<%@ include file = "../layout/top.jsp"%>
<%@ include file = "../layout/top1_2.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
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
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/freeWrite.css">


<%@ include file = "../layout/top2.jsp"%>
<%@ include file = "../layout/header.jsp"%>
<%@ include file = "../layout/sidebar.jsp"%>

<!--컨텐츠가 들어가는 메인화면-->
<div class="content">
	<div id="content-box">
		<div id="write-top-box">
			<h1><i class="fas fa-book-medical"></i>	글쓰기</h1>
			<img src="../layout/assets/img/tiger_par-logo-B.svg" alt="navbar brand"
				class="navbar-brand write-logo">
			<h1 class="text-right">${user.u_nickName }님</h1>
		</div>
		
		<form name="frm"  action="freeWriteOk.tp" method="post" onsubmit="return chkSubmit()" encType="Multipart/form-data">
			
			<input type="hidden" name="u_uid" value="${user.u_uid }"> 	<!-- 회원 고유번호 -->
			<input type="hidden" name="catagory" value="free"> <!-- 카테고리 -->
			
			<div id="write-inner-box">
				<h4 class="one_line">제목</h4>
				<input type="text" name="title" class="title-input free-title-input" maxlength="10"/>
				<div class="clear"></div>
			</div>
			<div id="write-content-box">
				<textarea name="content" class="wr-content"></textarea>
				
				<div class="display-block">
					<h4 class="one_line">첨부파일</h4>
					<input id="upfile" type="file" name="upfile"/>
					<button class="hide" type="button" id="delBtn" onclick="cleanFile('#upfile')">삭제</button>				
				</div>
			</div>
			<div class="text-center">
				<input type="button" value="취소" onclick="history.back();" class="btn btn-warning"/>
				<input type="submit" value="등록" class="btn btn-warning"/>
			</div>
		</form>
	</div>
</div>

<script>
	
	function cleanFile(fileId) {
		$(fileId).val("");
		$("#delBtn").addClass("hide");
	};
	
	$("#upfile").on("change", function(){
		
		var fileV = $("#upfile").val(); 
		
		if(fileV != ""){
			$("#delBtn").removeClass("hide");
		} else if(fileV == ""){
			$("#delBtn").addClass("hide");
		}
	});
	
</script>
<%@ include file = "../layout/footer.jsp"%>
<%@ include file = "../layout/script_bottom.jsp"%>