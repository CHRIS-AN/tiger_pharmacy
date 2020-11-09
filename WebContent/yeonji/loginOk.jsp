<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("자네는 로그인에 실패하였소.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("호랑이 약방에 오신것을 환영합니다.");
			location.href = "layout/index.tp";
		</script>
	</c:otherwise>
</c:choose>