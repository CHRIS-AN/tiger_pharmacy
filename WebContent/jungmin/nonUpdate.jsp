<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  
 <c:choose>
 	<c:when test="${empty list || fn:length(list) == 0 }">
 		<script>
 			alert(" 해당 정보가 삭제되거나, 없습니다  ");
 			history.back();
 		</script>
 	</c:when>
 	
<c:otherwise>

<%@ include file="../layout/top.jsp" %>
<link rel="stylesheet" href="../yeonsub/css/common.css">
<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../layout/top2.jsp" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />
<script>
function chkSubmit(){
	///////////////////////////////////////////////////////
	frm = document.forms["frm"];
	var b_nickname = frm["b_nickname"].value.trim();
	var title = frm["title"].value.trim();
	var b_pw = frm["b_pw"].value.trim();
	var content = frm["content"].value.trim();
	
	
	if(b_pw == "") {
		alert("비밀번호를 작성해야합니다.");
		frm["b_pw"].focus();
		return false;
	}

	if(b_nickname == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["nickname"].focus();
		return false;
	}
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	if(content == "") {
		alert("내용을 반드시 입력해주세요.");
		frm["content"].focus();
		return false;
	}
	/////////////////////////////////////////////////////////////
	return true;	
} // end chkSubmit()
</script>

<div id="content-box">

	<div id="write-top-box">
		<h1>비회원 수정 </h1>
		
		<img alt="호랑이약방.로고" src="../layout/assets/img/tiger_par-logo-B.svg"
						class="img-responsive write-logo">
		<h1 class="text-right">${list[0].b_nickname }님</h1>
	</div>
	
	<form name="frm" action="nonUpdateOk.tp" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data"> 
		<input type="hidden" name="b_uid" value="${list[0].b_uid}">
		
		<div id="write-top-box"
				style="border-top: 3px solid gold; border-bottom: 3px solid gold; padding: 20px 0">
			<h4 style="display: inline-block">제목</h4>
			<input type="text" style="width: 90%; margin: 0 15px; font-size: 20px" name="title" value="${list[0].title}" />
		</div>
		<div id="wrtie-content-box"
				style="padding-top: 40px; border-bottom: 3px solid gold;">
			<textarea name="content" style="width:100%; height: 400px;">${list[0].content}</textarea>
			<c:if test="${fn:length(fileList) > 0 }">
				<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
					<h4>기존파일입니다.</h4>
					<div id="delFiles"></div> <%-- 삭제할 file의 bf_uid 값(들)을 담기 위한 div --%>
					<c:forEach var="fileDto" items="${fileList }">
						<div>
							${fileDto.file2 }
						</div>
					</c:forEach>
				</div>
			</c:if>
			<button type="button" id="btnAdd">변경</button>
			<div id="files"></div>
		</div>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<%-- 첨부파일(추가) write.jsp 의 내용과 비슷 --%>
	
		<script>
		var i = 0;
		$("#btnAdd").click(function(){
			$("#files").append("<div> <input type='file' name='upfile" + i + "'> <button type='button' onclick='$(this).parent().remove()'>삭제</button> </div>");              
			i++;
		})
		</script>
	
	<!--========================================================= -->
		<div class="text-center">
			<input type="button" value="취소" onclick="history.back();"
						class="btn btn-warning" style="margin: 20px 0;" /> 
			<input type="submit" value="수정"  class="btn btn-warning"
						style="margin: 20px;" />
		</div>
	</form>
	<button type="button" onclick="location.href='nonList.tp'">목록으로</button>

</div>
	</c:otherwise>
 </c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />












