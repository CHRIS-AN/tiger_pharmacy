<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("${param.userEmail} 계정 확인 실패했소.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("${param.userEmail} 계정 확인 성공했소. 이제 개인정보 입력하시오.");
			location.href = 'joinImpo-email.tp?userEmail=${param.userEmail}';
			
		</script>
	</c:otherwise>
</c:choose>