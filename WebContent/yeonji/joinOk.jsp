<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("자네는 회원가입에 실패하였소.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원가입 성공! 드루와드루와");
			location.href = "login.tp";
		</script>
	</c:otherwise>
</c:choose>