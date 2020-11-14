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
<%@ include file = "../layout/top1_2.jsp"%>
<link rel="stylesheet" href="../yeonsub/css/common.css">
<link rel="stylesheet" href="../yeonsub/css/freeUpdate.css">

<script src = "https://kit.fontawesome.com/ab9c71e57b.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<%@ include file="../layout/top2.jsp" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />

<div id="content-box">

	<div id="write-top-box">
		<h1><i class="fas fa-book-medical"></i> 비회원 수정 </h1>
		
		<img alt="호랑이약방.로고" src="../layout/assets/img/tiger_par-logo-B.svg"
						class="img-responsive write-logo">
		<h1 class="text-right">${list[0].b_nickname }님</h1>
	</div>
	
	<form name="frm" action="nonUpdateOk.tp" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data"> 
		<input type="hidden" name="b_uid" value="${list[0].b_uid}">
		
		<div id="write-top-box">
			<div id="write-title-box">
				<h4 style="display: inline-block; float:inherit;">제목</h4>
				<input type="text" name="title" value="${list[0].title}" />
			</div>
		</div>
		<div class="clear"></div>
		<div id="wrtie-content-box"
				style="padding-top: 40px;">
			<textarea name="content" style="width:100%; height: 400px;">${list[0].content}</textarea>
			<div id="delFiles"></div> <%-- 삭제할 file의 bf_uid 값(들)을 담기 위한 div --%>
			<c:if test="${fn:length(fileList) > 0 }">
				<div style="margin:10px 0;">
					<span>첨부파일</span>
					<c:forEach var="fileDto" items="${fileList }">
						<c:if test="${not empty fileDto.file2 }">
							${fileDto.file2 }
								<button style="margin-left:15px;" type="button"
									onclick="deleteFiles(${fileDto.b_uid}); $(this).parent().remove();">삭제</button>
						</c:if>
						<c:if test="${empty fileDto.file2 }">
								<input type='file' id='file' name='upfile' style="overflow:hidden;" readonly>
								<button type='button' onclick="cleanFile('#file')">삭제</button>
								<br>
						</c:if>
					</c:forEach>
				</div>
				<div id="files"></div>
			</c:if>
		</div>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<%-- 첨부파일(추가) write.jsp 의 내용과 비슷 --%>
	
		<script>
		var i = 0;
		function deleteFiles(fileUid){
			// 삭제할 file 의 bf_uid 값(들)을 #delFiles 에 담아 submit 하게 한다
			$("#delFiles").append("<input type='hidden' name='delfile' value='" + fileUid +"'>");
			var new_input = "#upfile";
			$("#files").append("<h4 class='one_line'>첨부파일</h4 ><input type='file' id='upfile' name='upfile' readonly>" +
					"<button class='hide' type='button' id='delBtn' onclick='cleanFile(" + new_input + ")'>삭제</button>");
		}
		function cleanFile(fileId) {
			$(fileId).val("");
		}
		</script>
	
	<!--========================================================= -->
		<div class="text-center">
			<input type="button" value="취소" onclick="history.back();"
						class="btn btn-warning" style="margin: 20px 0;" /> 
			<input type="submit" value="수정"  class="btn btn-warning"
						style="margin: 20px;" />
		</div>
	</form>

</div>
	</c:otherwise>
 </c:choose>

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />












