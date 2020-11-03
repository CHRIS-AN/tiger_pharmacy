<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose> 
	<c:when test="${result == 0 }">
		<script>
			alert("수정 실패");
			history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정 성공");  <%-- ${uid} 면 request를 찾음 --%>
			location.href = "freeView.tp?b_uid=${b_uid}"; <%--수정 --%>
		</script>
	</c:otherwise>
</c:choose>


