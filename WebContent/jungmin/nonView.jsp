<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나, 없습니다. 다시 시도해주세요.");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="CSS/pwModal.css" rel="stylesheet" type="text/css">
<title>게시글 ${list[0].title }</title>
</head>
<script>
function chkDelete(b_uid) {
	var d = confirm("삭제하시겠습니까?");
	
	if(d) {
		location.href = 'nonDeleteOk.tp?b_uid=' + b_uid;
	}
}

</script>
<body>
<h2>자유톡</h2>
<div class="date">
<h2>${list[0].b_nickname }</h2>
<br>

${list[0].b_regDate }<br>
</div>
조회수 : ${list[0].viewCnt }
<hr>
<div class="warn">
경고 문구
- 의료 관련 정보는 예민한 부분이라 법적 책임까지 갈 수 있음을 경고합니다.
</div>
<br>
<hr>
내용 : <br>
<div>
${list[0].content }
</div>
<br>
<br>
<br>
<br>
<br>
전체 댓글 : 1111개
<hr>
<div>
${list[0].b_nickname } : <br>
<!-- 이부분은 댓글 내용을 담는 곳!!! -->
안녕? 이상하게도 오늘따라 비에다가 막걸리 한 잔하고 싶겠구먼?


<br>
<br>
<br>
<br>

<!-- 댓글내용이 들어 갈 곳이다. -->
</div>
<hr>
<div class="">
작성자 :<input type="text" name="c_nickname"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 비밀번호:<input type="password" name="c_pw"/><br>
</div>
<div>
<textarea class="c_content">내용을 입력해주세요.</textarea>
</div>
<div class="boardBtn">
<button onabort="" >등록</button><br>
<hr>
<button id="btn_Update" style="width: auto" onclick="">수정하기</button>
<button onclick="location.href='nonList.tp'">목록보기</button>
<button id="btn_Delete" style="width: auto" onclick="">삭제하기</button>
</div>


<!-- -------------------------------------------------------------------- -->
<div id="modal_box" class="modal">

	<!-- Form : 이 위치에 form 을 넣습니다 -->	
	<form class="modal-content animate" 
		action="pwChk.tp?b_uid=${list[0].b_uid }" method="post">
	  <div class="imgcontainer">
  		<!-- 닫기버튼  -->
  		<span class="close" title="Close Modal">&times;</span>
	  </div>
	
	  <div class="container">
		<label for="psw"><b>Password</b></label>
		<input type="password" placeholder="Enter Password"
			name="password" id="pw" required>

		<button type="submit" onclick="pwChk()">확인</button>
	  </div>
	
	  <div class="container" style="background-color:#f1f1f1">
	    <!-- 취소 버튼 -->
	    <button type="button" class="cancelbtn">Cancel</button>
	    <!-- 비밀번호 잊으셨나요? -->
	    <span class="psw">Forgot <a href="#">password?</a></span>
	  </div>
	</form>
</div>
<script type="text/javascript">
</script>


<script>
var modal_box = document.getElementById('modal_box');
var btn_Update = document.getElementById('btn_Update');
var btn_Delete = document.getElementById('btn_Delete');
var btn_close = document.getElementsByClassName('close')[0];
var btn_cancel = document.getElementsByClassName('cancelbtn')[0];

btn_Update.onclick = function(){modal_box.style.display = "block"}
btn_Delete.onclick = function(){modal_box.style.display = "block"}
btn_close.onclick = function(){modal_box.style.display = "none"}
btn_cancel.onclick = function(){modal_box.style.display = "none"}


</script>


</body>
</html>

	</c:otherwise>
</c:choose>



