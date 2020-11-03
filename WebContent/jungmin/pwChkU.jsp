<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>
	<c:when test="${psw[0].b_pw != param.password}">
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("비밀번호가 일치합니다.");
			location.href = "nonUpdate.tp?b_uid=" + ${psw[0].b_uid};	
		</script>
	</c:otherwise>
</c:choose>


