<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    


<c:choose>
	<c:when test="${update == 0 }" >
		<script>
			alert("수정에 실패였습니다. 다시 시도해주세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정 성공.");
			location.href = "nonView.tp?b_uid=${b_uid}";
		</script>
	</c:otherwise>
</c:choose>













