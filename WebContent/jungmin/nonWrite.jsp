<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비회원 게시판 글 작성</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var name = frm["name"].value.trim();
	var subject = frm["subject"].value.trim();
	
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["name"].focus();
		return false;
	}
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;	
} // end chkSubmit()


</script>

<body>
<h2>자유톡 비회원</h2>
<form name="frm" action="nonWriteOk.tp" method="post" onsubmit="return chkSubmit()">
작성자:
<input type="text" name="name"/>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;비밀번호:  <input type="password" name="password"/><br>
<hr>

제목:
<input type="text" name="title"/><br>
내용:<br>
<textarea name="content" style="width:100%; height: 200px;"></textarea>
<br><br>

<%-- 첨부파일 --%>











<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='nonList.tp'">목록으로</button>
</body>
</html>











