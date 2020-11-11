<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("회원정보 수정 실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원정보가 수정되었습니다.");
			location.href = "../layout/index.tp";
		</script>
	</c:otherwise>
</c:choose>