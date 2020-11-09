<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int id = (Integer) session.getAttribute("u_uid");
%>

<%@ include file="../layout/top.jsp"%>
<%@ include file = "../layout/top1_2.jsp"%>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/freeTalk.css">
<%@ include file="../layout/top2.jsp"%>


<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />
<!--컨텐츠가 들어가는 메인화면-->
<div class="content">
	<div id="content-box">
		<div id="board-top-box">
			<h1 style="display: inline-block"><i class="fas fa-book-medical"></i> 자유 톡</h1>
			<a href="../jungmin/loginAlert.jsp" class="write_btn"><i class="fas fa-pen"></i></a>
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
								${dto.title }
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
								<i class="fas fa-search"></i>
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
		if(${not empty sessionScope.u_uid}){
			location.href = "freeView.tp?b_uid=" + b_uid + "&page=" + ${curPage};
		}else {
			location.href = "../jungmin/nonView.tp?b_uid=" + b_uid + "&page=" + ${curPage};
		}
	}	
</script>
<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />