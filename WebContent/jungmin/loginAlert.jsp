<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 합치면서 확인해야할 부분 !    -->


<c:choose>
	<c:when test="${result == 0 }">
		<script>				
			location.href = "nonWrite.tp"; // null 값이면 비회원 글쓰기로 넘어가기.
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원만, 진료톡이 가능합니다  로그인을해주세요.");
			hisotory.back();
		</script>
	</c:otherwise>
</c:choose>

