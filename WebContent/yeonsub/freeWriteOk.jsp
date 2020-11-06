<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose> 
	<c:when test="${result == 0 }">
		<script>
			alert("등록 실패");
			history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("완료되었습니다");
			location.href = "freeView.tp?b_uid=${b_uid}";
		</script>
	</c:otherwise>
</c:choose>

