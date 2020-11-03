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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 ${list[0].title }</title>

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
</head>
<body>
<h2>수정 </h2>


<body>
<h2>자유톡</h2>

<form name="frm" action="nonUpdateOk.tp" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data"> 
<input type="hidden" name="b_uid" value="${list[0].b_uid}">
작성자: ${list[0].b_nickname}<br>

제목:
<input type="text" name="title" value="${list[0].title}"><br>
내용:<br>
<textarea name="content" style="width:100%; height: 200px;">${list[0].content}</textarea>
<br><br>

	<c:if test="${fn:length(fileList) > 0 }">
	<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
		<h4>기존파일입니다.</h4>
		<div id="delFiles"></div> <%-- 삭제할 file의 bf_uid 값(들)을 담기 위한 div --%>
			<c:forEach var="fileDto" items="${fileList }">
			<div>
				${fileDto.file2_source }
			</div>
			</c:forEach>
	</div>
	</c:if>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<%-- 첨부파일(추가) write.jsp 의 내용과 비슷 --%>
	<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border: 1px solid black;">
		<h4>변경할 첨부파일</h4>
		
		<button type="button" id="btnAdd">변경</button>
		<div id="files"></div>
	</div>

	<script>
	var i = 0;
	$("#btnAdd").click(function(){
		$("#files").append("<div> <input type='file' name='upfile" + i + "'> <button type='button' onclick='$(this).parent().remove()'>삭제</button> </div>");              
		i++;
	})
	</script>

<!--========================================================= -->

<input type="submit" value="수정"/>
</form>
<br>
<button type="button" onclick="location.href='nonList.tp'">목록으로</button>
</body>
</html>

	</c:otherwise>
 </c:choose>














