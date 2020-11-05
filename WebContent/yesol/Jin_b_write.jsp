<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var u_nickName = frm["u_nickName"].value.trim();
	var title = frm["title"].value.trim();
	
	if(u_nickName == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["u_nickName"].focus();
		return false;
	}
	
	if(title == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	return true;
} // end chkSubmit()
</script>

<h2>글쓰기</h2>
<form  name="frm" action="writeOk.tp" method="post" onsubmit="return chkSubmit()"
		encType="Multipart/form-data">
작성자 : 
<input type="text" name="u_nickName"/><br>
제목 : 
<input type="text" name="title"/><br>
내용<br>
<textarea name="content"></textarea><br>
증빙서류 <input type="file" id="file1" name="file1" readonly><button type="button" onclick="cleanFile('#file1')"></button><br>
 첨부파일 <input type="file" id="file2" name="file2" readonly><button type="button"  onclick="cleanFile('#file2')"></button>
<br><br>
<input type="submit" value="등록"/>
</form>
<button type="button" onclick="location.href='Jin_b_list.tp'">목록</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function cleanFile(fileId){
	$(fileId).val("");
}
</script>
</body>
</html>