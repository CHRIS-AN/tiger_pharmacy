<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("가입 되지 않은 이메일입니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			location.href = "layout/index.jsp";
		</script>
	</c:otherwise>
</c:choose>