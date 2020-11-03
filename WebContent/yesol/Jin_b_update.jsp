<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- JSTL 버젼으로 바뀌면, import 의 번잡합도,  Java 변수 선언도 사라진다! --%>

<c:choose>
	<c:when test="${empty list || fm.length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글수정 ${list[0].title }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var title = frm['title'].value.trim();
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>
<h2>수정</h2>
<form name="frm" action="Jin_b_updateOk.bts" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="b_uid" value="${list[0].b_uid }">
작성자: ${list[0].u_nickName }<br>  <%-- 작성자 이름은 변경 불가 --%>
제목:
<input type="text" name="title" value="${list[0].title }"><br>
내용:<br>
<textarea name="content">${list[0].content }</textarea>
<br><br>
<input type="submit" value="수정"/>
</form>

<button onclick="history.back()">이전으로</button>
<button onclick="location.href='Jin_b_list.tp">목록보기</button>
<br>

</body>
</html>
	</c:otherwise>
</c:choose>
