<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 합치면서 확인해야할 부분 !    -->

<c:choose>
	<c:when test="${empty sessionScope.u_uid}">
		<script>				
			location.href = "nonWrite.tp"; // null 값이면 비회원 글쓰기로 넘어가기.
		</script>
	</c:when>
	<c:otherwise>
		<script>
			location.href = "../yeonsub/freeWrite.tp"
		</script>
	</c:otherwise>
</c:choose>

