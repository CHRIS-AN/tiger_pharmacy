<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%--
	int id = (Integer) session.getAttribute("u_uid");
	

<c:if test="${empty sessionScope.u_uid }">
   <script>
      alert(" 회원만 이용가능한 게시판입니다.");
      history.back();
   </script>
</c:if>
--%>

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<link rel="stylesheet" href="CSS/Jin_b_list.css">

<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />


<div class="content">
	<div id="content-box">
		<h2><i class="fas fa-plus-square"></i>진료톡 -
		<c:choose>
			<c:when test="${param.catagory == 'jin_bi'}">
				비뇨기과			
			</c:when>
			<c:when test="${param.catagory == 'jin_jung'}">
				정신과
			</c:when>
		</c:choose>
		</h2>
		<table>
			<tr>
				<td>번호</td>
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
							<td><a href="Jin_b_view.tp?catagory=${param.catagory}&u_uid=${param.u_uid }&
								b_uid=${dto.b_uid }">${dto.title }</a></td>
							<td>${dto.u_nickname }</td>
							<td>${dto.viewcnt }</td>
							<td>${dto.b_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<br>
		
		<button
			onclick="location.href = 'Jin_b_write.tp?catagory=${param.catagory}&u_uid=${param.u_uid }'">글쓰기</button>
	
		<div id="boardSearch"><!-- 검색 -->
		<form name="search_frm" method="post" action="Jin_b_search.tp?catagory=${param.catagory}&u_uid=${param.u_uid }">
		<select id="search_cate" name="search">
			<option value="title">제목</option>
			<option value="title_content">제목+내용</option>
		</select>
		<input type="text" name="word">
		<button type="submit">검색</button>
		</form>
		</div><!-- 검색 -->
	
	</div><!-- end content-box -->
</div><!-- end content -->

<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />