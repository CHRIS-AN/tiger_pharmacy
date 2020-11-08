<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원가입 실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원가입 성공");
			location.href = "layout/index.jsp";
		</script>
	</c:otherwise>
</c:choose>