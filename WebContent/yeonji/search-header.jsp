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
<link rel="stylesheet" href="../yeonsub/css/common.css">
<link rel="stylesheet" href="../yeonsub/css/freeTalk.css">
<%@ include file="../layout/top2.jsp"%>


<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/sidebar.jsp" />
<!--컨텐츠가 들어가는 메인화면-->
<div class="content">
	<div id="content-box">
		<div id="board-top-box">
			<h1 style="display: inline-block"><i class="fas fa-book-medical"></i> 전체 톡</h1>
			
		</div>
		<div id="free-board-box">
			<div class="board-box-inner">
				<div class="total-box">
					총 ${fn:length(list) } 건
				</div>
				<c:forEach var="dto" items="${list }">
					<div class="board-box" onclick="sendBoard(${dto.b_uid},'${dto.catagory }')">
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
						<div class="clear"></div>
						<div class="vn-box">
							<div class="viewCnt-box">조회수 &nbsp; ${dto.viewCnt }</div>
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
			</div>
			
		</div>
	</div>
</div>
<script>
	function sendBoard(b_uid, catagory) {
		if(catagory == "자유"){
			if(${not empty sessionScope.u_uid}){
				location.href = "../yeonsub/freeView.tp?b_uid=" + b_uid + "&page=" + ${curPage} + "&pa=all";
			} else {
				location.href = "../jungmin/nonView.tp?b_uid=" + b_uid + "&page=" + ${curPage} + "&pa=all";
			}
		} else {
			if(${not empty sessionScope.u_uid}){
				location.href = "../yesol/Jin_b_view.tp?b_uid=" + b_uid + "&page=" + ${curPage} + "&pa=all";
			} else {
				alert("회원만 입장 가능하십니다.")
			}
		}
	}	
</script>
<jsp:include page="../layout/footer.jsp" />
<jsp:include page="../layout/script_bottom.jsp" />