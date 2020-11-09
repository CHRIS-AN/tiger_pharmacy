<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원가입 실패");
			location.href = "joinSelect.jsp"
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원가입 성공");
			location.href = "login.tp";
		</script>
	</c:otherwise>
</c:choose>