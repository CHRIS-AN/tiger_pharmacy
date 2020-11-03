<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리스트</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid purple;
	border-collapse: collapse; 
}
</style>
</head>
<body>

<h2>목록</h2>
<table>
	<tr>
		<td>번호</td>
		<td>카테고리</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>등록일</td>
	</tr>
	
	<c:choose>
		<c:when test="${empty list || fn:length(list) == 0 }">
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.b_uid}</td>
					<td>${param.catagory}</td>
					<td><a href="view.bts?b_uid=${dto.b_uid }">${dto.title }</a></td>
					<td>${dto.u_nickName }</td>
					<td>${dto.viewcnt }</td>
					<td>${dto.b_regdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<br>
<button onclick="location.href = 'Jin_b_write.tp'">글쓰기</button>

</body>
</html>