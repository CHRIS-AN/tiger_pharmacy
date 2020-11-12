<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원가입 실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<%
			session.invalidate();
		%>
		<script>
			alert("정상적으로 회원탈퇴 되었습니다.");
			location.href = "../layout/index.tp";
		</script>
	</c:otherwise>
</c:choose>