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
<title>게시글 ${list[0].title }</title>
</head>
<style>
.boardBtn {
           text-align: right;
           width: 100%;
           padding-right: 20px;
}

.c_content{
	          width: 100%;
}
</style>
<script>
function chkDelete(b_uid) {
	var d = confirm("삭제하시겠습니까?");
	
	if(d) {
		location.href = 'nonDeleteOk.tp?b_uid=' + b_uid;
	}
}
</script>
<body>
<h2>${list[0].b_nickname }</h2>
<br>
${list[0].title } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${list[0].b_regDate }<br>
${list[0].viewCnt }
<hr>
<div>
경고 문구
- 의료 관련 정보는 예민한 부분이라 법적 책임까지 갈 수 있음을 경고하는 문구
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
${list[0].b_nickname } <br>
<br>
<br>
<br>
<br>

<!-- 댓글내용이 들어 갈 곳이다. -->
</div>
<hr>
작성자 :<input type="text" name="c_nickname"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 비밀번호:<input type="password" name="c_pw"/><br>
<div>
<textarea class="c_content">내용을 입력해주세요.</textarea>
</div>
<div class="boardBtn">
<button onabort="" >등록</button><br>
<hr>
<button onclick="location.href='nonUpdate.tp?b_uid=${list[0].b_uid}'">수정하기</button>
<button onclick="location.href='nonList.tp'">목록보기</button>
<button onclick="chkDelete(${list[0].b_uid})">삭제하기</button>
</div>전체 댓글 : 1111개 
</body>
</html>

	</c:otherwise>
</c:choose>







