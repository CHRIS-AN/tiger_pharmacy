<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String id = request.getParameter("id");
%>
<%@ include file = "../layout/top.jsp"%>
<div class="wrapper">
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>
<!--컨텐츠가 들어가는 메인화면-->
<div class="main-panel">

<div id="content-box" class="container" style="margin: 0 auto; padding:150px 50px; box-shadow:0px 0px 5px #ccc; width:1000px; background:white;">
	<div id="bord-top-box">
		<h1 style="display:inline-block">자유톡</h1>		
		
		<a href="freeWrite.tp" class="btn btn-default btn-danger pull-right">글쓰기</a>
		
	</div>
	<div id="free-bord-box">
		<table class="table table-hover">
			<!-- 글번호 , 구분, 제목, 작성자, 등록, 조회수 -->
			<thead>
			<tr>
				<th>글번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.b_uid }</td>
					<td>${dto.catagory }</td>
					<td><a href="view.do?uid=${dto.b_uid }">${dto.title }</a></td>
					<c:choose>
						<c:when test="${not empty dto.b_nickName }">
							<td>${dto.b_nickName }</td>
						</c:when>
						<c:otherwise>
							<td>${dto.u_nickName }</td>
						</c:otherwise>
					</c:choose>
					<td>${dto.b_regDate }</td>
					<td>${dto.viewCnt }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page_search-box" class="text-center">
		<ul></ul>
	</div>
</div>

<jsp:include page="../layout/footer.jsp"/>
</div>
</div>
<jsp:include page="../layout/script_bottom.jsp"/>