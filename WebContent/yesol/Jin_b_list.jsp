<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	int id = (Integer) session.getAttribute("u_uid");
%>
<!-- 
<c:if test="${empty sessionScope.u_uid }">
   <script>
      alert(" 회원만 이용가능한 게시판입니다.");
      history.back();
   </script>
</c:if>
 -->

<%@ include file="../layout/top.jsp"%>
<%@ include file="../layout/top1_2.jsp"%>

<link rel="stylesheet" href="CSS/Jin_b_list.css">

<%@ include file="../layout/top2.jsp"%>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />


<div class="content">
	<div id="content-box">
		
		<!-- #board-top-box 게시판 명 -->
		<div id="board-top-box">
		<h1 style="display: inline-block"><i class="fas fa-plus-square"></i>진료톡 -
		<c:choose>
			<c:when test="${param.catagory == 'jin_bi'}">
				비뇨기과			
			</c:when>
			<c:when test="${param.catagory == 'jin_jung'}">
				정신과
			</c:when>
		</c:choose>
		</h1>
		</div>
		<!-- END #board-top-box 게시판 명 -->
		
		
		<!-- 게시판 리스트 wrap -->
		<div id="list_wrap">
		
			<!-- #board-box-inner 게시판 리스트  -->
			<div class="board-box-inner">
				
				<div class="total-box">
					총 ${fn:length(list) } 건
				</div>
				
				<!-- 게시글 출력부  -->
				<c:choose>
					<!-- 게시글이 없을 경우  -->
					<c:when test="${empty list || fn:length(list) == 0 }">
					</c:when>
					<!-- END 게시글이 없을 경우  -->
					
					<!-- 게시글이 있을 경우 -->
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
							<!-- .board-box 게시글 하나씩 div -->
							<div class="board-box" onclick="sendBoard(${dto.b_uid})">
								
								<!-- .uid-box 게시글 번호 -->
								<div class="uid-box">
									<h2>${dto.b_uid}</h2>
								</div>
								<!-- END .uid-box 게시글 번호 -->
								
								<!-- .title-top-box 카테고리, 게시일자, 제목 -->
								<div class="title-top-box">
									<div class="reg-box">
										<c:choose>
											<c:when test="${param.catagory == 'jin_bi'}">
												비뇨기과			
											</c:when>
											<c:when test="${param.catagory == 'jin_jung'}">
												정신과
											</c:when>
										</c:choose>
										<span>${dto.b_regDate }</span>
									</div>
									
									<div class="title-box">
										${dto.title }
									</div>
								</div>
								<!-- END .title-top-box 카테고리, 게시일자 -->
								
								<div class="viewCnt-box">${dto.viewCnt }</div>
								
								<div class="nickName-box">
									<span>${dto.u_nickName }</span>
								</div>
							</div>
							<!-- END .board-box 게시글 하나씩 div -->
						</c:forEach>
					</c:otherwise>
					<!-- END 게시글이 있을 경우 -->
				</c:choose>
				<!-- END 게시글 출력부  -->
		
				<br>
		
				<button
					onclick="location.href = 'Jin_b_write.tp?catagory=${param.catagory}&u_uid=${param.u_uid }'">글쓰기</button>
			</div>
			<!-- END #board-box-inner 게시판 리스트  -->
		</div>
		<!-- END #list_wrap 게시판 리스트 wrap -->
	
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