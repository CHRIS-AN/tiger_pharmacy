<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="yeonsup.beans.*"%>
<%
	int result = (Integer)request.getAttribute("result");	
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

<script>
function chkSubmit(){
	console.log("dfdfdfdf");
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
<jsp:include page="../layout/top.jsp"/>
<div class="wrapper">
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

<!--컨텐츠가 들어가는 메인화면-->
<div class="main-panel">
<div id="content-box" class="container" style="margin: 0 auto; padding:150px 100px; box-shadow:0px 0px 5px #ccc; width:1000px; background:white;">
	<div id="write-top-box">
		<h1><span><!-- 아이콘ㄴ --></span>회원 글쓰기</h1>
		<img alt="호랑이약방.로고" src="../layout/assets/img/tiger_par-logo-W.svg" class="img-responsive center-block">
		<h1 class="text-center">로고</h1>
		<h1 class="text-right">${user.u_nickName }님</h1>
	</div>
	
	<form name="frm"  action="freeWriteOk.tp" method="post" onsubmit="return chkSubmit()" encType="Multipart/form-data">
		
		<input type="hidden" name="u_uid" value="${user.u_uid }"> 	<!-- 회원 고유번호 -->
		<input type="hidden" name="catagory" value="자유"> <!-- 카테고리 -->
		
		<div id="write-top-box" style="border-top: 3px solid gold; border-bottom:3px solid gold; padding:20px 0">
			<h4 style="display:inline-block">제목</h4>
			<input type="text" name="title" style="width: 90%; margin: 0 15px; font-size:20px " />
		</div>
		<div id="wrtie-content-box" style="padding-top:40px; border-bottom:3px solid gold;">
			<textarea name="content" style="width:100%; height:400px;"></textarea>
			<h4 style="display:inline-block; padding:20px 0">첨부파일</h4>
			<input style="margin-left:20px;" type="file" name="upfile"/>
		</div>
		<div class="text-center">
			<input type="button" value="취소" onclick="history.back();" class="btn btn-warning" style="margin:20px 0;"/>
			<input type="submit" value="등록" class="btn btn-warning" style="margin:20px;"/>
		</div>
	</form>
</div>


<jsp:include page="../layout/footer.jsp"/>
</div>
</div>
<jsp:include page="../layout/script_bottom.jsp"/>