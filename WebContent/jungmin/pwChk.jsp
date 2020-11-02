<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result != 0 }">
		<script>
			alert("등록 실패!!!!!");
			history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록성공, 리스트 출력합니다");
			location.href = "nonList.tp";
		</script>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="CSS/pwModal.css" rel="stylesheet" type="text/css">
<title>게시글 ${list[0].title }</title>
</head>
<body>
jjjj
</body>
</html>