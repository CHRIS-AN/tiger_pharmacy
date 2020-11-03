<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int id = (Integer) session.getAttribute("u_uid");
%>

<%@ include file="../layout/top.jsp"%>
<link rel="stylesheet" href="css/freeTalk.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />
<!--컨텐츠가 들어가는 메인화면-->
<div class="content">
	<div id="content-box">
		<div id="board-top-box">
			<h1 style="display: inline-block">자유톡</h1>
			<a href="freeWrite.tp" class="btn btn-default btn-danger pull-right">글쓰기</a>
		</div>
		<div id="free-board-box">
			<div class="board-box-inner">
				<div class="total-box">
					총 ${totalPage } 건
				</div>
				<c:forEach var="dto" items="${list }">
					<div class="board-box" onclick="sendBoard(${dto.b_uid})">
						<div class="uid-box">
							<h2>${dto.b_uid }</h2>
						</div>
						<div class="title-top-box">
							<div class="reg-box">
								${dto.catagory } <span>${dto.b_regDate }</span>
							</div>
							<div class="title-box">
								<a href="freeView.tp?b_uid=${dto.b_uid }">${dto.title }</a>
							</div>
						</div>
						<div class="viewCnt-box">${dto.viewCnt }</div>
						<div class="nickName-box">
							<c:choose>
								<c:when test="${not empty dto.b_nickName }">
									<span>${dto.b_nickName }</span>
								</c:when>
								<c:otherwise>
									<span>${dto.u_nickName }</span>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</c:forEach>
			</div>
			<div id="board-bottom-box">
				<div id="pagination-box">
					<ul class="page">
						<c:if test="${not empty str }">
							${str }
						</c:if>
					</ul>
				</div>
				<div id="page-search-box" class="text-center">
					<form name="s_frm" method="GET" action="searchList.tp">
						<aside>
							<select class="s_col" name="s_col">
								<option value="title">제목</option>
								<option value="title_content">제목+내용</option>
							</select>
							<input class="word" type="text" name="word" value="" placeholder="search"/>
							<button class="searchBtn" type="submit">
								검색
							</button>
						</aside>
					</form>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script>
	
	function sendBoard(b_uid) {
		location.href = "freeView.tp?b_uid=" + b_uid;
	}	
	
	</script>
<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />